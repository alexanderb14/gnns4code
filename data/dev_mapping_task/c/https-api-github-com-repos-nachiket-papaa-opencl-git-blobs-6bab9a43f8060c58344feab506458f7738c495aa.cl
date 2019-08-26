__kernel __attribute((reqd_work_group_size(16, 16, 8))) __attribute((num_simd_work_items(4))) void A(__global float* restrict a, __global float* restrict b, __global float* restrict c, __global float* restrict d, int e, int f, int g) {
  __local float h[2 * 16][2 * 16];

  __local float i[8][16][16];

  int j = get_group_id(0);
  int k = get_group_id(1);
  int l = get_group_id(2);

  int m = get_local_id(0);
  int n = get_local_id(1);
  int o = get_local_id(2);

  int p = get_global_id(0);
  int q = get_global_id(1);
  int r = get_global_size(0);
  int s = get_global_size(1);

  int t = get_global_id(2) & 0x1FF;

  __local float u[8];

  int v = k * (16 - 3 + 1) * g;
  int w = j * (16 - 3 + 1);

  float x = 0.0f;
  float y = 0.0f;

  const bool z = ((m == 16 / 2) && (n == 16 / 2));

  if (z) {
    u[o] = c[t];
  }

  for (uint aa = 0; aa < e; aa++) {
    global float* ab = a + aa * f * g;
    h[n][m] = ab[v + n * g + w + m];

    bool ac = ((m < 3) && (n < 3));
    int ad = t * 3 * 3 * e;
    if (ac) {
      i[o][n][m] = b[ad + (aa * 3 + n) * 3 + m];
    }

    barrier(1);

    for (int ae = 0; ae < 3; ae++) {
      for (int af = 0; af < 3; af++) {
        x += i[o][ae][af] * h[n + ae][m + af];
      }
    }

    barrier(1);
  }

  x += u[o];

  x = fmax(y, x);
  bool ag = (n < (16 - 3 + 1) && m < (16 - 3 + 1));
  if (ag) {
    int ah = f - 3 + 1;
    int ai = g - 3 + 1;
    int aj = k * (16 - 3 + 1) + n;
    int ak = j * (16 - 3 + 1) + m;
    d[(t * ah + aj) * ai + ak] = x;
  }
}
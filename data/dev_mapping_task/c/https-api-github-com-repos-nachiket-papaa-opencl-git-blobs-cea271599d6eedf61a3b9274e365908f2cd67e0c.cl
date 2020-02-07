__kernel __attribute((reqd_work_group_size(4, 4, 4))) __attribute((num_simd_work_items(4))) void A(const __global float* restrict a, const __global float* restrict b, const __global float* restrict c, __global float* restrict d, const unsigned int e, const unsigned int f, const unsigned int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  const int j = get_global_id(2);

  const int k = get_global_size(0);
  const int l = get_global_size(1);
  const int m = k + e - 1;
  const int n = l + e - 1;

  int o = h * f;
  int p = i * f;
  int q = o + e;
  int r = p + e;

  const int s = j * e * e * g;
  int t = (int)e;
  float u, v;
  float4 w = 0.0;
  float x = 0.0;
  float y = 0.0;
  for (unsigned int z = 0; z < g; z++) {
    for (unsigned int aa = 0; aa < e; aa++) {
      const int ab = s + z * e * e + aa * e;
      const int ac = ((z * n) + p + aa) * m + o;
      int ad = 0;
      int ae = 0;

      while (ad <= t - 4) {
        float4 af = vload4(ae, b + ab);
        float4 ag = vload4(ae, a + ac);
        w += af * ag;
        ad += 4;
        ae++;
      }

      for (int ah = ad; ah < e; ah++) {
        w.x += b[ab + ah] * a[ac + ah];
      }
    }
  }
  y = w.x + w.y + w.z + w.w + c[j];
  d[((j * l) + i) * k + h] = fmax(x, y);
}
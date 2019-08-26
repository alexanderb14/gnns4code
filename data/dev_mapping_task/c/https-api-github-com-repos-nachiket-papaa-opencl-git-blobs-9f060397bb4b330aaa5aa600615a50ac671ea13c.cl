__kernel __attribute((reqd_work_group_size(64, 64, 1))) __attribute((num_simd_work_items(4))) void A(__global float* restrict a, __global float* b, __global float* c, __global float* d, int e, int f) {
  __local float g[64][64];
  __local float h[64][64];
  __local float i[64];

  int j = get_group_id(0);
  int k = get_group_id(1);

  int l = get_local_id(0);
  int m = get_local_id(1);

  int n = e * 64 * k;
  int o = n + e - 1;
  int p = 64 * j;

  float q = 0.0f;
  float r = 0.0f;

  if (m == 0) {
    i[l] = d[j * 64 + l];
  }

  for (int s = n, t = p; s <= o; s += 64, t += (64 * f)) {
    g[m][l] = b[s + e * m + l];
    h[l][m] = c[t + f * m + l];

    barrier(1);

    for (int u = 0; u < 64; ++u) {
      q += g[m][u] * h[l][u];
    }

    barrier(1);
  }
  q += i[l];

  a[get_global_id(1) * get_global_size(0) + get_global_id(0)] = fmax(r, q);
}
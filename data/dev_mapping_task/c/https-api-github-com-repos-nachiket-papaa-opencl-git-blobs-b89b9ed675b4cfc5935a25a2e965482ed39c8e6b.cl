__kernel __attribute((reqd_work_group_size(64, 64, 1))) __attribute((num_simd_work_items(4))) void A(__global float* restrict a, __global float* b, __global float* c, int d, int e) {
  __local float f[2][64][64];
  __local float g[2][64][64];

  int h = get_group_id(0);
  int i = get_group_id(1);

  int j = get_local_id(0);
  int k = get_local_id(1);

  int l = d * 64 * i;
  int m = l + d - 1;
  int n = 64 * h;

  float o = 0.0f;
  f[0][k][j] = b[l + d * k + j];
  g[0][j][k] = c[n + e * k + j];

  int p = d / 64;

  for (int q = 0; q < p; q++) {
    barrier(1);
    int r = q + 1;
    l += 64;
    n += (64 * e);

    if (r < p) {
      f[r % 2][k][j] = b[l + d * k + j];
      g[r % 2][j][k] = c[n + e * k + j];
    }

    for (int s = 0; s < 64; ++s) {
      o += f[q % 2][k][s] * g[q % 2][j][s];
    }
  }

  a[get_global_id(1) * get_global_size(0) + get_global_id(0)] = o;
}
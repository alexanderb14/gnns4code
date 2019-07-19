__attribute((reqd_work_group_size(16, 16, 1))) __attribute((num_simd_work_items(4))) __kernel void A(__global float* restrict a, __global float* restrict b, int c, int d) {
  int e, f;

  __local float g[16 * 16];
  __local float h[16 * 16];

  int i = get_global_id(0);
  int j = get_global_id(1);
  int k = get_global_size(1);

  int l = get_local_id(0);
  int m = get_local_id(1);

  float n = b[j * 16 + i];
  float o = 0;

  for (e = 0; e < c; e += 16) {
    g[m * 16 + l] = a[(d + m) * c + l + e];
    h[m * 16 + l] = a[j * c + l + e];
    barrier(1);
    for (int f = 0; f < 16; ++f) {
      o += g[l * 16 + f] * h[m * 16 + f];
    }
    barrier(1);
  }

  if (o < 0)
    o = 0;
  n += o;

  b[j * 16 + i] = n;
}
__kernel void A(__global float* a, int b, int c, __global float* d, int e, int f) {
  __local float g[32][32 + 1];

  int h = get_local_id(0);
  int i = get_local_id(1);
  int j = get_group_id(0) * 32;
  int k = get_group_id(1) * 32;

  d += e;
  a += b;

  d += j + h + ((k + i) * (f));
  a += k + h + ((j + i) * (c));

  g[i + 0][h] = d[0 * f];
  g[i + 8][h] = d[8 * f];
  g[i + 16][h] = d[16 * f];
  g[i + 24][h] = d[24 * f];

  barrier(1);

  a[0 * c] = g[h][i + 0];
  a[8 * c] = g[h][i + 8];
  a[16 * c] = g[h][i + 16];
  a[24 * c] = g[h][i + 24];
}
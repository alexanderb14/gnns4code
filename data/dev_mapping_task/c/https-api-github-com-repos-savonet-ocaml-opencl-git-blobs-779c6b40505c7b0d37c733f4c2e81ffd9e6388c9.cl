__kernel __attribute__((reqd_work_group_size(32, 32, 1))) void A(__global float* a, __global float* b, __global float* c, int d, int e) {
  int f = get_group_id(0);
  int g = get_group_id(1);
  int h = get_local_id(0);
  int i = get_local_id(1);
  int j, k;
  float l = 0;

  for (j = 0; j < d / 32; j++) {
    __local float m[32][32];
    __local float n[32][32];

    m[h][i] = a[(f * 32 + h) * d + (j * 32 + i)];
    n[h][i] = b[(j * 32 + h) * e + (g * 32 + i)];

    barrier(1);

    for (k = 0; k < 32; k++)
      l += m[h][k] * n[k][i];

    barrier(1);
  }
  c[(f * 32 + h) * e + (g * 32 + i)] = l;
}
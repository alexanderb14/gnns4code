void A(__global const float* a, int2 b, __local float c[8][4 * 32]) {
  c[b.y][b.x] = *(a - 32);
  c[b.y][b.x + 32] = *(a);
  c[b.y][b.x + 2 * 32] = *(a + 32);
  c[b.y][b.x + 3 * 32] = *(a + 2 * 32);
}

inline int B(int a) {
  return ((a & 1) ? (4 * 32 - (2 * (32 / 2 - (128 / 2) + 32 - a) + 1)) : (2 * (a + ((32 / 2) - (128 / 2) + 1))));
}

__kernel __attribute__((reqd_work_group_size(32, 8, 1))) void C(__global const float* a, unsigned int b, unsigned int c, __global float* d, unsigned int e, unsigned int f, __constant float* g) {
  const int2 h = (int2)(get_global_id(0), get_global_id(1));
  const int2 i = (int2)(get_local_id(0), get_local_id(1));

  __local float j[8][4 * 32];

  const int k = h.y * c + h.x + get_group_id(0) * 32 + b;

  A(&a[k], i, j);

  barrier(1);

  int l = B(i.x);

  float m = 0.f;

  int n = ((i.x & 1) ? (-2) : (2));

  for (int o = 0; o < 128; ++o)
    m += g[o] * j[i.y][l + o * n];

  d[h.y * f + (h.x ^ 0) + e] = m;
}
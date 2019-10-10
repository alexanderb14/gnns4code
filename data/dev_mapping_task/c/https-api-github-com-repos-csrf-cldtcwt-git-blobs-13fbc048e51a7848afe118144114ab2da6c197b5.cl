void A(__global const float* a, size_t b, int2 c, __local float d[4 * 8][32]) {
  const int e = c.y >> 1;

  const int f = (4 * 32 - 1 - e) ^ 1;

  const int g = ((c.y & 1) ? (-32 / 2) : (32 / 2));
  const int h = ((c.y & 1) ? (f) : (e));

  d[h][c.x] = *(a - 8 * b);
  d[h + g][c.x] = *(a);
  d[h + 2 * g][c.x] = *(a + 8 * b);
  d[h + 3 * g][c.x] = *(a + 2 * 8 * b);
}

inline int2 B(int a) {
  int b = a + ((32 / 2) - (128 / 2) + 1) + (a & 1) * (3 * 32 - 1 - 2 * a);

    return (int2) (((a & 1) ? (bb              ((a & 1) ? ((b) : (b
}

__kernel __attribute__((reqd_work_group_size(32, 8, 1))) void C(__global const float* a, unsigned int b, unsigned int c, __global float* d, unsigned int e, unsigned int f, __constant float* g) {
  const int2 h = (int2)(get_global_id(0), get_global_id(1));
  const int2 i = (int2)(get_local_id(0), get_local_id(1));

  __local float j[4 * 8][32];

  const int k = (h.y + get_group_id(1) * 8) * c + h.x + b;

  A(&a[k], c, i, j);

  barrier(1);

  int2 l = B(i.y);

  float m = 0.f;

  for (int n = 0; n < 128; n += 2)
    m += g[n] * j[l.s0 + n][i.x];

  for (int n = 0; n < 128; n += 2)
    m += g[n + 1] * j[l.s1 + n][i.x];

  d[(h.y ^ 0) * f + h.x + e] = m;
}
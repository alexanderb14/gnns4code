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

__kernel __attribute__((reqd_work_group_size(32, 8, 1))) void C(__global const float* a, unsigned int b, unsigned int c, __global float* d, unsigned int e, unsigned int f, unsigned int g, unsigned int h, unsigned int i, __constant float* j) {
  const int2 k = (int2)(get_global_id(0), get_global_id(1));
  const int2 l = (int2)(get_local_id(0), get_local_id(1));

  __local float m[4 * 8][32];

  const int n = (k.y + get_group_id(1) * 8) * c + k.x + b;

  A(&a[n], c, l, m);

  barrier(1);

  int2 o = B(l.y);

  float p = 0.f;

  for (int q = 0; q < 128; q += 2)
    p += j[q] * m[o.s0 + q][l.x];

  for (int q = 0; q < 128; q += 2)
    p += j[q + 1] * m[o.s1 + q][l.x];

  barrier(1);

  m[l.y ^ 0][l.x] = p;

  barrier(1);

  int2 r = k >> 1;

  if ((r.x < h) & (r.y < i)) {
    const float s = 1.0f / sqrt(2.0f);

    int t = l.y & ~1;

    float u = m[t][l.x];
    float v = m[t ^ 1][l.x ^ 1];

    float w = u + v;
    float x = u - v;

    unsigned int y = (l.y & 1) ? f : e;

    d[2 * (y + r.x + r.y * g) + (l.x & 1)] = s * (((l.x & 1) ^ (l.y & 1)) ? w : x);
  }
}
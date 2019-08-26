__constant bool Ga[] = {0, 0, 0};

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

__kernel __attribute__((reqd_work_group_size(32, 8, 1))) void C(__global const float* a, unsigned int b, unsigned int c, unsigned int d, __global float* e, unsigned int f, unsigned int g, unsigned int h, unsigned int i, unsigned int j, __constant float* k) {
  const int2 l = (int2)(get_global_id(0), get_global_id(1));
  const int2 m = (int2)(get_local_id(0), get_local_id(1));

  __local float n[4 * 8][32];

  const int o = (l.y + get_group_id(1) * 8) * d + l.x + b + c * get_group_id(2);

  A(&a[o], d, m, n);

  barrier(1);

  int2 p = B(m.y);

  float q = 0.f;

  if (get_group_id(2) == 0) {
    for (int r = 0; r < 128; r += 2)
      q += k[r] * n[p.s0 + r][m.x];

    for (int r = 0; r < 128; r += 2)
      q += k[r + 1] * n[p.s1 + r][m.x];

  } else if (get_group_id(2) == 1) {
    for (int r = 0; r < 128; r += 2)
      q += k[128 + r] * n[p.s0 + r][m.x];

    for (int r = 0; r < 128; r += 2)
      q += k[128 + r + 1] * n[p.s1 + r][m.x];

  } else {
    for (int r = 0; r < 128; r += 2)
      q += k[2 * 128 + r] * n[p.s0 + r][m.x];

    for (int r = 0; r < 128; r += 2)
      q += k[2 * 128 + r + 1] * n[p.s1 + r][m.x];
  }

  barrier(1);

  n[m.y ^ Ga[get_group_id(2)]][m.x] = q;

  barrier(1);

  int2 s = l >> 1;

  if ((s.x < i) & (s.y < j)) {
    const float t = 1.0f / sqrt(2.0f);

    int u = m.y & ~1;

    float v = n[u][m.x];
    float w = n[u ^ 1][m.x ^ 1];

    float x = v + w;
    float y = v - w;

    unsigned int z = f + g * (((size_t)(m.y & 1ul)) ? ((size_t)(5lu - get_group_id(2))) : (get_group_id(2)));

    e[2 * (z + s.x + s.y * h) + (m.x & 1)] = t * (((m.x & 1) ^ (m.y & 1)) ? x : y);
  }
}
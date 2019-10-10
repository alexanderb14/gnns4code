void A(__global const float* a, int2 b, __local float c[8][4 * 32]) {
  const int d = b.x >> 1;

  const int e = (4 * 32 - 1 - d) ^ 1;

  const int f = ((b.x & 1) ? (-32 / 2) : (32 / 2));
  const int g = ((b.x & 1) ? (e) : (d));

  c[b.y][g] = *(a - 32);
  c[b.y][g + f] = *(a);
  c[b.y][g + 2 * f] = *(a + 32);
  c[b.y][g + 3 * f] = *(a + 2 * 32);
}

inline int2 B(int a) {
  int b = a + ((32 / 2) - (128 / 2) + 1) + (a & 1) * (3 * 32 - 1 - 2 * a);

    return (int2) (((a & 1) ? (bb              ((a & 1) ? ((b) : (b
}

float C(int2 a, int2 b, __local float c[8][4 * 32], __constant float d[]) {
  float e = 0;

  for (int f = 0; f < 128; f += 2)
    e += d[f] * c[a.y][b.s0 + f];

  for (int f = 0; f < 128; f += 2)
    e += d[f + 1] * c[a.y][b.s1 + f];

  return e;
}

__kernel __attribute__((reqd_work_group_size(32, 8, 1))) void D(__global const float* a, unsigned int b, unsigned int c, __global float* d, unsigned int e, unsigned int f, unsigned int g, __constant float* h, __constant float* i, __constant float* j) {
  const int2 k = (int2)(get_global_id(0), get_global_id(1));
  const int2 l = (int2)(get_local_id(0), get_local_id(1));

  __local float m[8][4 * 32];

  const int n = k.y * c + k.x + get_group_id(0) * 32 + b;

  A(&a[n], l, m);

  barrier(1);

  int2 o = B(l.x);

  d[f * k.y + (k.x ^ 0) + e] = C(l, o, m, h);

  d[g + f * k.y + (k.x ^ 0) + e] = C(l, o, m, i);

  d[2 * g + f * k.y + (k.x ^ 0) + e] = C(l, o, m, j);
}
__kernel __attribute__((reqd_work_group_size(32, 8, 1))) void A(__global const float* a, unsigned int b, unsigned int c, __global float* d, unsigned int e, __constant float* f) {
  const int2 g = (int2)(get_global_id(0), get_global_id(1));
  const int2 h = (int2)(get_local_id(0), get_local_id(1));

  const int i = g.y * c + g.x;
  const int j = i + b;

  __local float k[2 * 8][32];

  k[h.y][h.x] = a[j - (8 >> 1) * c];
  k[h.y + 8][h.x] = a[j + (8 >> 1) * c];

  barrier(1);

  float l = 0.f;
  for (int m = 0; m < 128; ++m)
    l = mad(k[h.y + m + (8 >> 1) - ((128 - 1) >> 1)][h.x], f[128 - m - 1], l);

  d[i + e] = l;
}
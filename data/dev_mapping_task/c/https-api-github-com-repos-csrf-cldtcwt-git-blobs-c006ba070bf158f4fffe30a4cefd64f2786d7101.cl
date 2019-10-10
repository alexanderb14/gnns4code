__kernel __attribute__((reqd_work_group_size(32, 8, 1))) void A(__global const float* a, __global float* b, __constant float* c, unsigned int d, unsigned int e) {
  const int2 f = (int2)(get_global_id(0), get_global_id(1));
  const int2 g = (int2)(get_local_id(0), get_local_id(1));

  const int h = f.y * e + f.x;

  __local float i[8][2 * 32];

  i[g.y][g.x] = a[h - (32 >> 1)];
  i[g.y][g.x + 32] = a[h + (32 >> 1)];

  barrier(1);

  if (f.x < ((32 >> 1) + 8))
    i[g.y][g.x] = i[g.y][32 - g.x - 1];

  const int j = d + 8 - 1;

  if ((f.x + (32 >> 1)) > j) {
    int k = f.x + (32 >> 1) - j;

    i[g.y][g.x + 32] = i[g.y][g.x + 32 - ((k << 1) - 1)];

    if ((f.x - (32 >> 1)) > j) {
      k -= 32;
      i[g.y][g.x] = i[g.y][g.x - ((k << 1) - 1)];
    }
  }

  barrier(1);

  float l = 0.f;
  for (int m = 0; m < 128; ++m)
    l = mad(i[g.y][g.x + m + (32 >> 1) - ((128 - 1) >> 1)], c[128 - m - 1], l);

  b[h] = l;
}
__kernel __attribute__((reqd_work_group_size(32, 8, 1))) void A(__global const float* a, __global float* b, __constant float* c, unsigned int d, unsigned int e) {
  const int2 f = (int2)(get_global_id(0), get_global_id(1));
  const int2 g = (int2)(get_local_id(0), get_local_id(1));

  const int h = f.y * e + f.x;

  __local float i[8][2 * 32];

  i[g.y][g.x] = a[h - (32 >> 1)];
  i[g.y][g.x + 32] = a[h + (32 >> 1)];

  barrier(1);

  float j = 0.f;
  for (int k = 0; k < 128; ++k)
    j = mad(i[g.y][g.x + k + (32 >> 1) - ((128 - 1) >> 1)], c[128 - k - 1], j);

  b[h] = j;
}
__kernel __attribute__((reqd_work_group_size(32 * 8, 1, 1))) void A(__global const float* a, __global float* b, unsigned int c, unsigned int d) {
  const int2 e = (int2)(get_global_id(0), get_global_id(1));
  const int2 f = (int2)(get_local_id(0), get_local_id(1));

  const int g = e.y * d + e.x;

  __local float h[8 * 32];

  h[f.x] = a[g];

  b[g] = h[f.x];
}
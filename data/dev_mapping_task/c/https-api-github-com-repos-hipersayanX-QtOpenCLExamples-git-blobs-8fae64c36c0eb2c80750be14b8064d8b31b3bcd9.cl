__kernel void A(__global int* a, __global int* b, int c) {
  size_t d = get_global_id(0);
  size_t e = get_local_id(0);

  __local int f[256];

  f[e] = a[d];
  barrier(1);

  for (int g = get_local_size(0) >> 1; g > 0; g >>= 1) {
    if (e < g && d + g < c)
      f[e] += f[e + g];

    barrier(1);
  }

  if (e == 0)
    b[get_group_id(0)] = f[0];
}
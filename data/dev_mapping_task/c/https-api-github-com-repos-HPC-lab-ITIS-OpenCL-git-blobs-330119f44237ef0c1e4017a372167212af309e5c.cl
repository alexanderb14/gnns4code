__kernel void A(__global float* a, __local float* b, __global float* c, const int d) {
  int e = get_global_id(0);
  int f = get_local_id(0);

  if (e < d)
    b[f] = a[e] + a[e + d];

  barrier(1);

  for (int g = get_local_size(0) / 2; g > 0; g >>= 1) {
    if (f < g)
      b[f] += b[f + g];
    barrier(1);
  }

  if (f == 0)
    c[get_group_id(0)] = b[0];
}
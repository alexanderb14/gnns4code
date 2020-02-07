__kernel void A(__global float* a, __local float* b, __global float* c, const int d) {
  int e = get_global_id(0);
  int f = get_local_id(0);
  float g = 0.;

  while (e < d) {
    g += a[e];
    e += get_global_size(0);
  }

  b[f] = g;

  barrier(1);

  for (int h = get_local_size(0) / 2; h > 0; h >>= 1) {
    if (f < h)
      b[f] += b[f + h];
    barrier(1);
  }

  if (f == 0)
    c[get_group_id(0)] = b[0];
}
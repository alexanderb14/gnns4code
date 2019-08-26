__kernel void A(__global float* a, __local float* b, __global float* c, const int d) {
  int e = get_global_id(0);
  int f = get_local_id(0);

  if (e < d)
    b[f] = a[e];

  barrier(1);

  for (int g = 1; g < get_local_size(0); g <<= 1) {
    int h = (g << 1) - 1;
    if ((f & h) == 0)
      b[f] += b[f + g];
    barrier(1);
  }

  if (f == 0)
    c[get_group_id(0)] = b[0];
}
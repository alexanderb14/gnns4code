__kernel void A(__global double* a, __global double* b, __global double* c) {
  size_t d = get_global_id(0);

  c[d] = a[d] * b[d];
}

__kernel void B(__global double* a, __global double* b) {
  __local double c[128];
  unsigned int d = get_local_id(0);
  unsigned int e = get_global_id(0);
  unsigned int f;

  b[e] = 0.0;
  c[d] = a[e];

  barrier(1);

  for (f = 128 / 2; f > 0; f >>= 1) {
    if (d < f)
      c[d] += c[d + f];
    barrier(1);
  }

  if (d == 0)
    b[get_group_id(0)] = c[0];
}
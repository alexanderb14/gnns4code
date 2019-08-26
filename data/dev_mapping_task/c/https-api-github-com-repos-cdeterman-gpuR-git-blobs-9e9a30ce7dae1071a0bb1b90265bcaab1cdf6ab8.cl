__kernel void A(__global double* a, __global double* b, const unsigned int c) {
  const int d = get_global_id(0);

  if (d < c) {
    b[d] = sign(a[d]);
  }
}
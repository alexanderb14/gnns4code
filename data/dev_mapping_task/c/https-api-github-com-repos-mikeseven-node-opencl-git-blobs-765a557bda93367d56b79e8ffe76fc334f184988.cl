__kernel void A(__global float* a, __global float* b, const unsigned int c) {
  unsigned int d = get_global_id(0);
  if (d < c)
    b[d] = a[d] * a[d];
}
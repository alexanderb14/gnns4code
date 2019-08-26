__kernel void A(__global float* a, __global float* b, __private int c) {
  size_t d = get_global_id(0);
  float e = 0;

  if (d < c)
    e = a[d];

  b[d] = e * e;
}
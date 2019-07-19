__kernel void A(__global float* a, __global float* b, __global float* c) {
  int d = get_global_id(0);

  c[2 * d] = cos(a[d]);
  c[2 * d + 1] = sin(b[d]);
}
__kernel void A(__global const float* __restrict const a, __global float* __restrict const b) {
  const int c = get_global_id(0);
  b[c] = a[c] * a[c];
}
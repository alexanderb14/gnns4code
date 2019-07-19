__kernel void A(__global float* a, __global float* b) {
  const int c = get_global_id(0);

  a[c] = b[c] * (1 - b[c]);
}
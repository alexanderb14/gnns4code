__kernel void A(__global float* a, __global float* b, float c) {
  const int d = get_global_id(0);
  b[d] += c * a[d];
}
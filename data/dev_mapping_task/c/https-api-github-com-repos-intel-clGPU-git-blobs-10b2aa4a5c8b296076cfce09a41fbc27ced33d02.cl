__kernel void A(float a, __global float* b, uint c, __global float* d, uint e) {
  uint f = get_global_id(0);
  d[f * e] += a * b[f * c];
}
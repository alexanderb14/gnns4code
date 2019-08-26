__kernel void A(float a, __global float* b, uint c) {
  const uint d = get_global_id(0);
  b[d * c] *= a;
}
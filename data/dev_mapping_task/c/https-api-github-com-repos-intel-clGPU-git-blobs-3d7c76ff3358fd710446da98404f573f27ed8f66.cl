__kernel void A(float a, __global float* b) {
  const uint c = get_global_id(0);
  b[c] *= a;
}
__kernel void A(__global float4* const restrict a, __global const float4* const restrict b) {
  if (get_global_id(0) == 0) {
    a[0] = b[0];
  }
}
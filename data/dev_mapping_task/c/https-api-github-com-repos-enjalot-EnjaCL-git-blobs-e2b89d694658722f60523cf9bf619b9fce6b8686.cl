__kernel void A(__global float4* a, __global int* b) {
  int c = get_global_id(0);
}
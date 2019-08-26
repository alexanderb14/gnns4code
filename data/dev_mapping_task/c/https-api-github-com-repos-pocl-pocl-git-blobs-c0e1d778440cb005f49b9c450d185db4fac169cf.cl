__kernel void A(__global const float4* a, __global const float4* b, __global float* c) {
  int d = get_global_id(0);
  float4 e = a[d] * b[d];
  c[d] = e.x + e.y + e.z + e.w;
}
__kernel void A(__global const float3* a, __global float3* b, __global const float3* c, const float d) {
  float3 e = c[get_global_id(0)];
  e.y = e.y - d * 9.82f;

  b[get_global_id(0)] = a[get_global_id(0)] + d * e;
}
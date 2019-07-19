kernel void A(global float3* a, float3 b, float3 c) {
  *a = step(b, c);
}
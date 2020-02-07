kernel void A(global float4* a, float4 b, float4 c) {
  *a = step(b, c);
}
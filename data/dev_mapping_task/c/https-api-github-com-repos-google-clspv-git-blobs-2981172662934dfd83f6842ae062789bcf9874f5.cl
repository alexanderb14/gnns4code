kernel void A(global float* a, float4 b, uint c) {
  vstore4(b, c, a);
}
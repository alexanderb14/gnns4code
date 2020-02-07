kernel void A(global float2* a, float2 b, float2 c) {
  *a = step(b, c);
}
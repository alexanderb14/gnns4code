__kernel void A(__global float4* a) {
  float4 b;
  b.xzw = 4.2;
  *(a + 1) = fract(b, a);
}
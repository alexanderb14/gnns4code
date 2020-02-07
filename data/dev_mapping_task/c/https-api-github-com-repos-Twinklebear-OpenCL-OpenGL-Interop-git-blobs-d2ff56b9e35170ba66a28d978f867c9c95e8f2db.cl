__kernel void A(float4 a, __global float4* b) {
  a *= 0x1.6a09e6p+0f / length(a);
  b[0] = (float4)(1.0f, 0.0f, 0.0f, 0.0f) - (a * a.x);
  b[1] = (float4)(0.0f, 1.0f, 0.0f, 0.0f) - (a * a.y);
  b[2] = (float4)(0.0f, 0.0f, 1.0f, 0.0f) - (a * a.z);
  b[3] = (float4)(0.0f, 0.0f, 0.0f, 1.0f) - (a * a.w);
}
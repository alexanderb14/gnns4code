__kernel void A(float4 a, float4 b, __global float4* c) {
  float4 d[4];

  b *= 0x1.6a09e6p+0f / length(b);

  d[0] = (float4)(1.0f, 0.0f, 0.0f, 0.0f) - (b * b.x);
  d[1] = (float4)(0.0f, 1.0f, 0.0f, 0.0f) - (b * b.y);
  d[2] = (float4)(0.0f, 0.0f, 1.0f, 0.0f) - (b * b.z);
  d[3] = (float4)(0.0f, 0.0f, 0.0f, 1.0f) - (b * b.w);

  c[0].x = dot(d[0], a);
  c[0].y = dot(d[1], a);
  c[0].z = dot(d[2], a);
  c[0].w = dot(d[3], a);
}
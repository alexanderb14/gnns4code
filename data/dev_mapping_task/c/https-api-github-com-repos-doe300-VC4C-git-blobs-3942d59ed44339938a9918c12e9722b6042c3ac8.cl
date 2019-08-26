__kernel void A(char4 a, uchar4 b, short4 c, ushort4 d, int4 e, uint4 f, float4 g, __global float4* h) {
  h[0] = convert_float4(a);
  h[1] = convert_float4(b);
  h[2] = convert_float4(c);
  h[3] = convert_float4(d);
  h[4] = convert_float4(e);
  h[5] = convert_float4(f);
  h[6] = g;
}
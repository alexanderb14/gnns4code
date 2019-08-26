__kernel void A(__global float4* a, __global uchar2* b) {
  int4 c = (int4)(-1, 0, -1, 0);
  float4 d = (float4)(0.25f, 0.5f, 0.75f, 1.0f);
  float4 e = (float4)(1.25f, 1.5f, 1.75f, 2.0f);
  *a = ((c) ? (e) : (d));

  uchar2 f = (uchar2)(0xAA, 0x55);
  uchar2 g = (uchar2)(0x0F, 0x0F);
  uchar2 h = (uchar2)(0x33, 0x33);
  *b = bitselect(g, h, f);
}
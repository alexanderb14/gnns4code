kernel void A(global uchar4* a, global float4* b) {
  uchar4 c = *a;
  float4 d;
  d.x = c.x;
  d.y = c.y;
  d.z = c.z;
  d.w = c.w;
  *b = d;
}
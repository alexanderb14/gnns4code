void A(__global uchar* a, int4 b, int4 c, float d) {
  a[b.x + b.y * c.x + b.z * c.x * c.y] = convert_uchar_sat_rte(d * 255.f);
}

void B(__global uchar* a, int4 b, int4 c, uchar d) {
  a[b.x + b.y * c.x + b.z * c.x * c.y] = d;
}

void C(__global half* a, int4 b, int4 c, float d) {
  vstore_half(d, b.x + b.y * c.x + b.z * c.x * c.y, a);
}

void D(__global float* a, int4 b, int4 c, float d) {
  a[b.x + b.y * c.x + b.z * c.x * c.y] = d;
}

void E(__global ushort2* a, int4 b, int4 c, float2 d) {
  a[b.x + b.y * c.x + b.z * c.x * c.y] = convert_ushort2_sat_rte(d * 65535.f);
}

void F(__global half* a, int4 b, int4 c, float4 d) {
  vstore_half4(d, b.x + b.y * c.x + b.z * c.x * c.y, a);
}

void G(__global float4* a, int4 b, int4 c, float4 d) {
  a[b.x + b.y * c.x + b.z * c.x * c.y] = d;
}
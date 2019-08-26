kernel void A(global float2* a, float2 b, unsigned int c, unsigned int d) {
  int e = get_global_id(0);
  if (e < d) {
    a[e + c] = b;
  }
}
kernel void B(global float4* a, float4 b, unsigned int c, unsigned int d) {
  int e = get_global_id(0);
  if (e < d) {
    a[e + c] = b;
  }
}
kernel void C(global float8* a, float8 b, unsigned int c, unsigned int d) {
  int e = get_global_id(0);
  if (e < d) {
    a[e + c] = b;
  }
}
kernel void D(global float16* a, float16 b, unsigned int c, unsigned int d) {
  int e = get_global_id(0);
  if (e < d) {
    a[e + c] = b;
  }
}
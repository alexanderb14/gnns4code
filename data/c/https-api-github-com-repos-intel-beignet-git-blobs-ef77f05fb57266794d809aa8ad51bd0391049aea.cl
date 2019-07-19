kernel void A(global float* a, global float* b, global float* c) {
  int d = get_global_id(0);
  c[d] = step(a[d], b[d]);
}

kernel void B(global float2* a, global float2* b, global float2* c) {
  int d = get_global_id(0);
  c[d] = step(a[d], b[d]);
}
kernel void C(global float3* a, global float3* b, global float3* c) {
  int d = get_global_id(0);
  c[d] = step(a[d], b[d]);
}
kernel void D(global float4* a, global float4* b, global float4* c) {
  int d = get_global_id(0);
  c[d] = step(a[d], b[d]);
}
kernel void E(global float8* a, global float8* b, global float8* c) {
  int d = get_global_id(0);
  c[d] = step(a[d], b[d]);
}
kernel void F(global float16* a, global float16* b, global float16* c) {
  int d = get_global_id(0);
  c[d] = step(a[d], b[d]);
}
kernel void G(float a, global float* b, global float* c) {
  int d = get_global_id(0);
  c[d] = step(a, b[d]);
}

kernel void H(float a, global float2* b, global float2* c) {
  int d = get_global_id(0);
  c[d] = step(a, b[d]);
}
kernel void I(float a, global float3* b, global float3* c) {
  int d = get_global_id(0);
  c[d] = step(a, b[d]);
}
kernel void J(float a, global float4* b, global float4* c) {
  int d = get_global_id(0);
  c[d] = step(a, b[d]);
}
kernel void K(float a, global float8* b, global float8* c) {
  int d = get_global_id(0);
  c[d] = step(a, b[d]);
}
kernel void L(float a, global float16* b, global float16* c) {
  int d = get_global_id(0);
  c[d] = step(a, b[d]);
}
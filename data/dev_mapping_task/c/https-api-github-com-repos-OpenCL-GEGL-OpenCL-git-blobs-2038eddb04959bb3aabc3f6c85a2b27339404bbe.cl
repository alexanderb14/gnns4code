__kernel void A(__global const float4* a, __global const float* b, __global float4* c, float d) {
  int e = get_global_id(0);
  float4 f = a[e];
  float g = (b) ? b[e] : 1.0f;
  float4 h;
  h = f * g * d;
  c[e] = h;
}
__kernel void B(__global const float4* a, __global const float* b, __global float4* c, float d) {
  int e = get_global_id(0);
  float4 f = a[e];
  float g = (b) ? b[e] : 1.0f;
  float4 h = (float4)(f f f f* d c[e] = h;
}
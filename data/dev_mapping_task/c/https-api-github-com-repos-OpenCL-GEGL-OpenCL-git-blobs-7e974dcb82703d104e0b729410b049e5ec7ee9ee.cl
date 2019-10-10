__kernel void A(__global const float4* a, __global float4* b, float c, float d, float e) {
  int f = get_global_id(0);
  float4 g = a[f];
  float4 h;
  h = g * (floatef);
  b[f] = h;
}
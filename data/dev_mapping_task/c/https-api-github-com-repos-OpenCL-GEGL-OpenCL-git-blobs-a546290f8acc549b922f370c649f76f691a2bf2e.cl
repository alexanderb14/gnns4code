__kernel void A(__global const float2* a, __global const float* b, __global float2* c, float d) {
  int e = get_global_id(0);
  float2 f = a[e];
  float g = (b) ? b[e] : d;
  float2 h;
  h.x = (f.x > g) ? 1.0f : 0.0f;
  h.y = f.y;
  c[e] = h;
}
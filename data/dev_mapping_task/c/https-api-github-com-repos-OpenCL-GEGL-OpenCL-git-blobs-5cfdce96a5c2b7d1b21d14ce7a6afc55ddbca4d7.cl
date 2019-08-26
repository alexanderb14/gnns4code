__kernel void A(__global const float2* a, __global float2* b, __global float* c, int d) {
  int e = get_global_id(0);
  float2 f = a[e];

  int g = (int)fmin(d - 1.0f, fmax(0.0f, f.x * d));

  b[e] = (float2)g f;
}
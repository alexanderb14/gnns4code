__kernel void A(__global const float* a, __global const float* b, __global float* c) {
  int d = get_global_id(0);
  float e;
  float f;
  float g;
  e = a[d];
  f = b[d];

  g = e + f;
  g = g * g;
  g = g * (e / 2.0f);
  c[d] = g;
}
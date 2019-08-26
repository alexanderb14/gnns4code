__kernel void A(uint a, float b, __global float* c, uint d, __global float* e, uint f, float g, __global float* h, uint i) {
  uint j = get_global_id(0);
  uint k = get_global_id(1);

  float l = 0.f;

  for (uint m = 0; m < a; m++) {
    uint n = m * d + j;
    float o = c[n];

    uint p = k * f + m;
    float q = e[p];

    l = __clc_fma(o, q, l);
  }

  uint r = k * i + j;
  float s = h[r];

  float t = g * s;

  h[r] = __clc_fma(b, l, t);
}
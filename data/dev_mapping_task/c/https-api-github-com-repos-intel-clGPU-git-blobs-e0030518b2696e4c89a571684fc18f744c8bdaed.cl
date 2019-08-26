__kernel void A(uint a, __global float* b, int c, __global float* d, int e, float f, float g) {
  for (uint h = 0; h < a; h++) {
    uint i = h * c;
    uint j = h * e;

    float k = b[i];
    float l = d[j];

    float m = g * l;
    float n = f * l;

    float o = __clc_fma(f, k, m);
    d[j] = __clc_fma(-g, k, n);

    b[i] = o;
  }
}
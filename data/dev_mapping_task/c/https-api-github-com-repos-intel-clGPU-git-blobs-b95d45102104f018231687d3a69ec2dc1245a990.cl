__kernel void A(uint a, float b, const __constant float* c, int d, const __constant float* e, int f, __global float* g, uint h) {
  for (uint i = 0; i < a; ++i) {
    for (uint j = 0; j <= i; ++j) {
      float k = __clc_fma(c[i * d], e[j * f], e[i * f] * c[j * d]);
      g[j * h + i] = __clc_fma(b, k, g[j * h + i]);
    }
  }
}
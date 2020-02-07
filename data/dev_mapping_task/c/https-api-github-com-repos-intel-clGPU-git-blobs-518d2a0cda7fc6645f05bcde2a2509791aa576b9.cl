__kernel void A(uint a, float b, __global float* c, uint d, __global float* e, int f, float g, __global float* h, int i) {
  for (uint j = 0; j < a; ++j) {
    float k = 0;
    for (uint l = 0; l < a; ++l) {
      if (j >= l)
        k = __clc_fma(c[l * d + j], e[l * f], k);
      else
        k = __clc_fma(c[j * d + l], e[l * f], k);
    }

    if (g != 0)
      h[j * i] = __clc_fma(b, k, g * h[j * i]);
    else
      h[j * i] = b * k;
  }
}
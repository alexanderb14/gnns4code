__kernel void A(int a, __global float* b, int c, __global float* d) {
  float e = 0.0f;

  for (int f = 0; f < a; ++f) {
    e += __clc_fabs(b[f * c]);
  }

  d[0] = e;
}
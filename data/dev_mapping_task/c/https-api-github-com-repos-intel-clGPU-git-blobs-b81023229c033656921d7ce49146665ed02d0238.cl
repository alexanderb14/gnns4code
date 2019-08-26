__kernel void A(int a, __global float* b, int c, __global float* d, int e, __global float* f) {
  float g = 0.f;
  for (int h = 0; h < a; ++h) {
    g += b[h * c] * d[h * e];
    ;
  }

  f[0] = g;
}
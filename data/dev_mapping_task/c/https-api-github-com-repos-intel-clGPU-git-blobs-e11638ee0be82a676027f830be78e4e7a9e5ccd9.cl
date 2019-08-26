__kernel void A(int a, __global float* b, int c, __global int* d) {
  int e = 0;
  float f = __clc_fabs(b[0]);

  for (uint g = 1; g < a; ++g) {
    float h = __clc_fabs(b[g * c]);

    if (h < f) {
      f = h;
      e = g;
    }
  }

  d[0] = e;
}
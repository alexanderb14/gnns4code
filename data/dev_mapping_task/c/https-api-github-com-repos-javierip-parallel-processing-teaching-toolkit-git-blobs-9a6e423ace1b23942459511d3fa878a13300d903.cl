__kernel void A(__global const float* a, __global const float* b, __global float* c) {
  int d = get_global_id(0);
  int e = get_global_id(1);
  int f = 32;

  int g = 0;
  for (g = 0; g < f; g++) {
    int h = a[d + e * f + g];
    int i = b[d + e * f + g];
    c[d + e * f + g] = h + i;
  }
}
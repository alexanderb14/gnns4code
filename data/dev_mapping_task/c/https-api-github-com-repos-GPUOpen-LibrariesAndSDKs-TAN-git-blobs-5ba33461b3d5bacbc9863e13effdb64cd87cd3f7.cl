__kernel void A(__global float* a, __global float* b, int c, int d) {
  int e = get_global_id(0);

  float f = 0;
  for (int g = 0; g < d; g++) {
    f += a[g * c + e];
  }

  b[e] = f;
}
__kernel void A(__global double* a, __global double* b, __global double* c, int d) {
  int e = get_global_id(0);
  int f = get_global_id(1);
  if ((f < d) && (e < d)) {
    double g = 0.0;
    for (int h = 0; h < d; h++)
      g += a[f * d + h] * b[h * d + e];
    c[f * d + e] = g;
  }
}
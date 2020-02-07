__kernel void A(__global const double* a, __global double* b, __global const int* c, const int d, const int e, const int f) {
  const int g = get_global_id(0);

  if (g < d) {
    b[g] = a[c[g] * f + e];
  }
}
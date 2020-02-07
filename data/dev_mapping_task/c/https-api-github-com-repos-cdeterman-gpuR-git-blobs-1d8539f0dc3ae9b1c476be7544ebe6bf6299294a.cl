__kernel void A(__global double* a, __global double* b, const double c, const unsigned int d) {
  const int e = get_global_id(0);

  if (e < d) {
    b[e] = max(a[e], c);
  }
}
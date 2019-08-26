__kernel void A(__global int* a, __global int* b, const int c, const unsigned int d) {
  const int e = get_global_id(0);

  if (e < d) {
    b[e] = max(a[e], c);
  }
}
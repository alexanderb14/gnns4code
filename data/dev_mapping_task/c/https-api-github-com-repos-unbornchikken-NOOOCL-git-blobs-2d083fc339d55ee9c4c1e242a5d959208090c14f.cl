__kernel void A(__global double* a, __global double* b, __global double* c, const unsigned int d) {
  int e = get_global_id(0);

  if (e < d)
    c[e] = a[e] + b[e];
}
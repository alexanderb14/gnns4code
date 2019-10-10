__kernel void A(__global int* a, __global int* b, __global int* c, int d) {
  int e = get_global_id(0);
  if (e < d) {
    c[e] = a[e] + b[e];
  }
}
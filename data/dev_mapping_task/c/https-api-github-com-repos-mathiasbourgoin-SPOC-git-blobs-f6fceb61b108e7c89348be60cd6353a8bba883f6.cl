__kernel void A(__global const double* a, __global const double* b, __global double* c, int d) {
  int e = get_global_id(0);
  if (e < d) {
    c[e] = a[e] + b[e];
  }
}

__kernel void B(__global const float* a, __global const float* b, __global float* c, int d) {
  int e = get_global_id(0);
  if (e < d) {
    c[e] = a[e] + b[e];
  }
}
__kernel void A(__global float* a, float b) {
  int c = get_global_id(0);
  a[c] = b;
}

__kernel void B(__global const float* a, __global const float* b, __global float* c) {
  int d = get_global_id(0);
  c[d] = a[d] + b[d];
}

__kernel void C(__global double* a, double b) {
  int c = get_global_id(0);
  a[c] = b;
}

__kernel void D(__global const double* a, __global const double* b, __global double* c) {
  int d = get_global_id(0);
  c[d] = a[d] + b[d];
}
kernel void A(global float* a, global float* b, global float* c, global int* d) {
  int e = get_global_id(0);
  a[e * (*d) + 0] = __clc_pow(b[e], c[e]);
  a[e * (*d) + 1] = b[e];
}
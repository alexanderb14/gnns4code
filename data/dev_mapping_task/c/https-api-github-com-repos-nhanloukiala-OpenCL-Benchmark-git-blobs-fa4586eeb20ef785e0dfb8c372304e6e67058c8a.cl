__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d) {
  size_t e = get_global_id(0);
  d[get_global_id(0)] = mad(a[e], b[e], c[e]);
}
__kernel void B(__global float* a, __global float* b, __global float* c, __global float* d) {
  size_t e = get_global_id(0);
  d[get_global_id(0)] = __clc_fma(a[e], b[e], c[e]);
}
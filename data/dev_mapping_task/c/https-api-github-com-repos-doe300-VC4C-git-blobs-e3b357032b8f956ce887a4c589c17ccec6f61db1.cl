__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d) {
  int e = get_global_id(0);

  d[e] = clamp(a[e], b[e], c[e]);
}
__kernel void A(__global float* a, __global float* b, __global float* c) {
  int d = get_global_id(0);
  int e = get_global_id(1);

  const int f = e + d * get_global_size(1);
  b[f] = a[d] + a[e];
  c[e] = a[0];
}
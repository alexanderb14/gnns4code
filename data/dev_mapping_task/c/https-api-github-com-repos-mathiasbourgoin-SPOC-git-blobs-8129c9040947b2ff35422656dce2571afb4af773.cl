__kernel void A(__global const float* a, __global const float* b, int c, __global float* d) {
  int e = get_global_id(0);
  if (e >= c)
    return;
  d[e] = a[e] + b[e];
}

__kernel void B(__global const float* a, __global const float* b, __global float* c, int d) {
  int e = get_global_id(0);
  if (e >= d)
    return;
  c[e] = a[e] - b[e];
}
__kernel void C(__global const float* a, __global const float* b, __global float* c, int d) {
  int e = get_global_id(0);
  if (e >= d)
    return;
  c[e] = a[e] / b[e];
}
__kernel void D(__global const float* a, __global const float* b, __global float* c, int d) {
  int e = get_global_id(0);
  if (e >= d)
    return;
  c[e] = a[e] * b[e];
}
__kernel void E(__global const float* a, __global const float* b, __global const float* c, __global float* d, int e) {
  int f = get_global_id(0);
  if (f >= e)
    return;
  d[f] = a[f] * b[f] + c[f];
}
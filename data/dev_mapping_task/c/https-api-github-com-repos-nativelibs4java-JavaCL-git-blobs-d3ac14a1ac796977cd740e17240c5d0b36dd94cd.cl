__kernel void A(__global const float* a, __global const float* b, __global float* c, int d) {
  int e = get_global_id(0);
  if (e >= d)
    return;

  c[e] = a[e] + b[e];
}

__kernel void B(__global float* a, __global float* b, int c) {
  int d = get_global_id(0);
  if (d >= c)
    return;

  a[d] = cos((float)d);
  b[d] = sin((float)d);
}
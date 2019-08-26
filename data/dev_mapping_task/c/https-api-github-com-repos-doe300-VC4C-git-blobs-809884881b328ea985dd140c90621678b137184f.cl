__kernel void A(__global float* a, __global float* b, __global float* c, __local float* d) {
  size_t e = get_global_id(0);
  size_t f = get_local_id(0);

  d[f] = a[e] * b[e];

  barrier(1);
  if (f == 0) {
    d[f] = d[f] + d[f + 1];
  }

  c[e] = d[f];
}

__kernel void B(__global float* a, __global float* b, __global float* c) {
  size_t d = get_global_id(0);
  size_t e = get_local_id(0);

  __local float f[12];

  f[e] = a[d] * b[d];

  barrier(1);
  if (e == 0) {
    f[e] = f[e] + f[e + 1];
  }

  c[d] = f[e];
}
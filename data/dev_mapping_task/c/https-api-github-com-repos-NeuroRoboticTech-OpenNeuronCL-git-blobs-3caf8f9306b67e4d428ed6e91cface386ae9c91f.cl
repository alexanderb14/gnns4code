__kernel void A(__global float* a, __global float* b, __global float* c, __global int* d, __local float* e, __local float* f, __local float* g, __local int* h, __global float* i, __global float* j) {
  int k = get_global_id(0);

  e[k] = a[k];
  f[k] = b[k];
  g[k] = c[k];
  h[k] = d[k];

  i[k] = e[k] + k;
  b[k] = k;
  d[k] = k;
  j[k] = g[k] + k;
}
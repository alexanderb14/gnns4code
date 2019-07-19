__kernel void A(__global double* a, __global double* b, __global double* c, long d) {
  int e = get_global_id(0);

  if (e >= d)
    return;

  int f = e << 2;
  c[e] = a[f] * b[f] + a[f + 1] * b[f + 1] + a[f + 2] * b[f + 2] + a[f + 3] * b[f + 3];
}
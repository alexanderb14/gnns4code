__kernel void A(__global const int* a, __global const int* b, __global int* c, int d) {
  int e = get_global_id(0);

  if (e >= d)
    return;

  c[e] = a[e] + b[e];
}
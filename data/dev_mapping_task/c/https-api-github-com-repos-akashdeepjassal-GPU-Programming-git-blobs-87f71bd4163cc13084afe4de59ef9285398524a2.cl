__kernel void A(__global const int* a, __global const int* b, __global int* c, const int d) {
  const int e = get_global_id(0);
  if (e < d)
    c[e] = a[e] + b[e];
}
__kernel void A(__global int* a, __global int* b, __global int* c, int d) {
  int e = get_global_id(0);

  if (e > d - 1)
    return;

  if (a[e])
    c[b[e]] = e;
}
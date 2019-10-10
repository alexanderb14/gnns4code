__kernel void A(__global int* a, __global int* b, __global int* c) {
  int d = get_global_id(0);

  int e = sub_sat(a[d], b[d]);
  c[d] = e;
}
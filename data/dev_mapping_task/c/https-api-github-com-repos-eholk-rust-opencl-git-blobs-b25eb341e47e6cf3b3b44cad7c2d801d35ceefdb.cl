__kernel void A(__global const long* a, __global const long* b, __global long* c) {
  int d = get_global_id(0);
  c[d] = a[d] + b[d];
}
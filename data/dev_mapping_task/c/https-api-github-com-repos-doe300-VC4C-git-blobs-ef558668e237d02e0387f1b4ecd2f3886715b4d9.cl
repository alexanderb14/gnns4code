__kernel void A(__global uchar4* a, __global uchar4* b, __global uchar4* c) {
  int d = get_global_id(0);

  c[d] = (a[d].s0 < b[d].s0) ? a[d] : b[d];
}
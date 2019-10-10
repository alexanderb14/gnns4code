__kernel void A(__global int4* a, __global int4* b, __global int4* c, __global int4* d) {
  d[0] = a[0] * b[0] + c[0] - a[0];
  d[1] = (mul_hi((a[1]), (b[1])) + (c[1]));
  d[2] = mad_sat(a[2], b[2], c[2]);
  d[3] = mad24(a[3], b[3], c[3]);
}
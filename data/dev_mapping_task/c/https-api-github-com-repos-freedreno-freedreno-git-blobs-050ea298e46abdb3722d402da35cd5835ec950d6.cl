__kernel void A(__global int* a, __global int* b, __global int* c, __global int* d) {
  d[0] = mad24(a[0], b[0], c[0]);
  d[1] = mul24(a[1], b[1]);
  d[2] = clz(a[2]);
  d[3] = clamp(a[3], b[3], c[3]);
  d[4] = (mul_hi((a[4]), (b[4])) + (c[4]));
  d[5] = mad_sat(a[5], b[5], c[5]);
  d[6] = max(a[6], b[6]);
  d[7] = min(a[7], b[7]);
  d[8] = mul_hi(a[8], b[8]);
  d[9] = rotate(a[9], b[9]);
  d[10] = sub_sat(a[10], b[10]);
  d[11] = abs(a[11]);
  d[12] = abs_diff(a[12], b[12]);
  d[13] = add_sat(a[13], b[13]);
  d[14] = hadd(a[14], b[14]);
  d[15] = rhadd(a[15], b[15]);
}
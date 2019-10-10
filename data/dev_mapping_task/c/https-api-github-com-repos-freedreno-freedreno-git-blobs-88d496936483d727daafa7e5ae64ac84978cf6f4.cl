__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d) {
  d[0] = acos(a[0]);
  d[1] = acosh(a[1]);
  d[2] = acospi(a[2]);
  d[3] = asin(a[3]);
  d[4] = asinh(a[4]);
  d[5] = asinpi(a[5]);
  d[6] = atan(a[6]);
  d[7] = atan2(a[7], b[7]);
  d[8] = atanh(a[8]);
  d[9] = atanpi(a[9]);
}
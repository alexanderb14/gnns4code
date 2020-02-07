__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d, const int e, const int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);

  const int i = g * f + h;

  if (g < e && h < f) {
    c[i] = __clc_fabs(sqrt(__clc_pow(a[i], 2.0f) + __clc_pow(b[i], 2.0f)));
    d[i] = atan2(b[i], a[i]);
  }
}
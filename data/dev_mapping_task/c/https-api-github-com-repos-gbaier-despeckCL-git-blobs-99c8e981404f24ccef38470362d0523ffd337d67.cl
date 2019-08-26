__kernel void A(__global float* a, __global float* b, const int c, const int d, const float e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);

  const int h = f * d + g;

  if (f < c && g < d) {
    const float i = sqrt(__clc_pow(a[h], 2.0f) + __clc_pow(b[h], 2.0f));
    a[h] = __clc_pow(i, e) * a[h];
    b[h] = __clc_pow(i, e) * b[h];
  }
}
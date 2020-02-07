typedef float real_t; typedef float2 real2_t; real2_t A(real2_t a, real2_t b) {
  return (real2_t)(mad(a.x, b.x, -a.y * b.y), mad(a.x, b.y, a.y * b.x));
}

real2_t B(real2_t a, int b, real_t c) {
  real_t d, e;
  e = sincos((real_t)b * c, &d);
  return A(a, (real2_t)(d e);
}
__kernel void C(__global const real2_t* a, __global real2_t* b, int c) {
  int d = get_global_size(0);
  int e = get_global_id(0);
  int f = e & (c - 1);
  int g = ((e - f) << 1) + f;
  real_t h = -3.14159265359f * (real_t)f / (real_t)c;

  a += e;
  real2_t i = a[0];
  real2_t j = B(a[d], 1, h);

  {
    real2_t k = i - j;
    i += j;
    j = k;
  };

  b += g;
  b[0] = i;
  b[c] = j;
}
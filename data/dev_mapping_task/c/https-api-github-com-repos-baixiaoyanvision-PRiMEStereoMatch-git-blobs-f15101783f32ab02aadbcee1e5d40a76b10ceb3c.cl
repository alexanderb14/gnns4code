__kernel void A(__global const double* restrict a, __global const double* restrict b, __global const double* restrict c, __global const double* restrict d, const int e, const int f, __global double* restrict g, __global double* restrict h) {
  const int i = get_global_id(0);
  const int j = get_global_id(1);
  const int k = get_global_id(2);

  const int l = j * f;
  const int m = ((k * e) + j) * f;

  double n = *(a + (l * 3) + (3 * i));
  double o = *(a + (l * 3) + (3 * i) + 1);
  double p = *(a + (l * 3) + (3 * i) + 2);
  double q = *(c + l + i);
  double r, s, t, u;

  double v = 0;
  double w = 0;

  if (i >= abs(k)) {
    r = *(b + (l * 3) + 3 * (i - k));
    s = *(b + (l * 3) + 3 * (i - k) + 1);
    t = *(b + (l * 3) + 3 * (i - k) + 2);
    u = *(d + l + (i - k));

    v += __clc_fabs(n - r);
    v += __clc_fabs(o - s);
    v += __clc_fabs(p - t);
    v *= 0.3333333333;

    w = __clc_fabs(q - u);
  } else {
    v += __clc_fabs(n - 1.0);
    v += __clc_fabs(o - 1.0);
    v += __clc_fabs(p - 1.0);
    v *= 0.3333333333;

    w = __clc_fabs(q - 1.0);
  }

  v = v > 0.028 ? 0.028 : v;
  w = w > 0.008 ? 0.008 : w;
  *(g + m + i) = 0.9 * v + 0.1 * w;

  n = *(b + (l * 3) + (3 * i));
  o = *(b + (l * 3) + (3 * i) + 1);
  p = *(b + (l * 3) + (3 * i) + 2);
  q = *(d + l + i);

  v = 0;
  w = 0;

  if (i >= abs(k)) {
    r = *(a + (l * 3) + 3 * (i + k));
    s = *(a + (l * 3) + 3 * (i + k) + 1);
    t = *(a + (l * 3) + 3 * (i + k) + 2);
    u = *(c + l + (i + k));

    v += __clc_fabs(n - r);
    v += __clc_fabs(o - s);
    v += __clc_fabs(p - t);
    v *= 0.3333333333;

    w = __clc_fabs(q - u);
  } else {
    v += __clc_fabs(n - 1.0);
    v += __clc_fabs(o - 1.0);
    v += __clc_fabs(p - 1.0);
    v *= 0.3333333333;

    w = __clc_fabs(q - 1.0);
  }

  v = v > 0.028 ? 0.028 : v;
  w = w > 0.008 ? 0.008 : w;
  *(h + m + i) = 0.9 * v + 0.1 * w;
}
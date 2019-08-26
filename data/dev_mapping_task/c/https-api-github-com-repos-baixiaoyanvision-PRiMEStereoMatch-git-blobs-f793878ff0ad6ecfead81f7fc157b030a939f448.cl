__kernel void A(__global const double* restrict a, __global const double* restrict b, __global const double* restrict c, __global const double* restrict d, const int e, const int f, __global double* restrict g, __global double* restrict h) {
  const int i = get_global_id(0) * 5;
  const int j = get_global_id(1);
  const int k = get_global_id(2);

  int l = j * f + i;
  const int m = ((k * e) + j) * f + i;

  double16 n, o = vload16(0, a + (l * 3));
  double8 p, q = vload8(0, c + l);

  double8 r = 0;
  double8 s = 0;

  if (i >= abs(k)) {
    l = j * f + i - k;
    n = vload16(0, b + (l * 3));
    p = vload8(0, d + l);

    o = __clc_fabs(o - n);

    s = __clc_fabs(q - p);
  } else {
    o = __clc_fabs(o - 1.0);

    s = __clc_fabs(q - 1.0);
  }
  r = (double8)(os0 + os1 + os2, os3 + os4 + os5, os6 + os7 + os8, os9 + osa + osb, osc + osd + ose, 0, 0, 0) * 0.3333333333;

  r = r > 0.028 ? 0.028 : r;
  s = s > 0.008 ? 0.008 : s;
  vstore4(0.9 * r.s0123 + 0.1 * s.s0123, 0, g + m);
  *(g + m + 4) = 0.9 * r.s4 + 0.1 * s.s4;

  l = j * f + i;
  o = vload16(0, b + (l * 3));
  q = vload8(0, d + l);

  s = 0;

  if (i >= abs(k)) {
    l = j * f + i + k;
    n = vload16(0, a + (l * 3));
    p = vload8(0, c + l);

    o = __clc_fabs(o - n);

    s = __clc_fabs(q - p);
  } else {
    o = __clc_fabs(o - 1.0);

    s = __clc_fabs(q - 1.0);
  }
  r = (double8)(os0 + os1 + os2, os3 + os4 + os5, os6 + os7 + os8, os9 + osa + osb, osc + osd + ose, 0, 0, 0) * 0.3333333333;

  r = r > 0.028 ? 0.028 : r;
  s = s > 0.008 ? 0.008 : s;
  vstore4(0.9 * r.s0123 + 0.1 * s.s0123, 0, h + m);
  *(h + m + 4) = 0.9 * r.s4 + 0.1 * s.s4;
}
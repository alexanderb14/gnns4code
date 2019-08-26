float A(float a) {
  float b, c;
  float d, e, f, g, h;

  if ((b = __clc_fabs(a)) < 8.0) {
    e = a * a;
    g = 57568490574.0 + e * (-13362590354.0 + e * (651619640.7 + e * (-11214424.18 + e * (77392.33017 + e * (-184.9052456)))));
    h = 57568490411.0 + e * (1029532985.0 + e * (9494680.718 + e * (59272.64853 + e * (267.8532712 + e * 1.0))));
    f = g / h;
  } else {
    c = 8.0 / b;
    e = c * c;
    d = b - 0.785398164;
    g = 1.0 + e * (-0.1098628627e-2 + e * (0.2734510407e-4 + e * (-0.2073370639e-5 + e * 0.2093887211e-6)));
    h = -0.1562499995e-1 + e * (0.1430488765e-3 + e * (-0.6911147651e-5 + e * (0.7621095161e-6 - e * 0.934935152e-7)));
    f = sqrt(0.636619772 / b) * (cos(d) * g - c * sin(d) * h);
  }
  return f;
}

float B(float a) {
  float b, c;
  float d, e, f, g, h;

  if ((b = __clc_fabs(a)) < 8.0) {
    e = a * a;
    g = a * (72362614232.0 + e * (-7895059235.0 + e * (242396853.1 + e * (-2972611.439 + e * (15704.48260 + e * (-30.16036606))))));
    h = 144725228442.0 + e * (2300535178.0 + e * (18583304.74 + e * (99447.43394 + e * (376.9991397 + e * 1.0))));
    f = g / h;
  } else {
    c = 8.0 / b;
    e = c * c;
    d = b - 2.356194491;
    g = 1.0 + e * (0.183105e-2 + e * (-0.3516396496e-4 + e * (0.2457520174e-5 + e * (-0.240337019e-6))));
    h = 0.04687499995 + e * (-0.2002690873e-3 + e * (0.8449199096e-5 + e * (-0.88228987e-6 + e * 0.105787412e-6)));
    f = sqrt(0.636619772 / b) * (cos(d) * g - c * sin(d) * h);
    if (a < 0.0)
      f = -f;
  }
  return f;
}

float C(int a, float b) {
  int c, d, e;
  float f, g, h, i, j, k, l;

  f = __clc_fabs(b);
  if (a == 0)
    return (A(f));
  if (a == 1)
    return (B(f));
  if (f == 0.0)
    return 0.0;
  else if (f > (float)a) {
    k = 2.0 / f;
    h = A(f);
    g = B(f);
    for (c = 1; c < a; c++) {
      i = c * k * g - h;
      h = g;
      g = i;
    }
    l = g;
  } else {
    k = 2.0 / f;
    e = 2 * ((a + (int)sqrt(40.0 * a)) / 2);
    d = 0;
    i = l = j = 0.0;
    g = 1.0;
    for (c = e; c > 0; c--) {
      h = c * k * g - i;
      i = g;
      g = h;
      if (__clc_fabs(g) > 1.0e10) {
        g *= 1.0e-10;
        i *= 1.0e-10;
        l *= 1.0e-10;
        j *= 1.0e-10;
      }
      if (d)
        j += g;
      d = !d;
      if (c == a)
        l = i;
    }
    j = 2.0 * j - g;
    l /= j;
  }
  return b < 0.0 && a % 2 == 1 ? -l : l;
}

__kernel void D(__global float* a, __global float* b, const int c) {
  int d = get_global_id(0);

  b[d] = C(c, a[d]);
}
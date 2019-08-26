int A(double a, int b, int c, int d, int e, double f) {
  double g = b, h = c, i = d, j = e;

  if (a > 1.0)
    return 0;
  double k = i * (h - f) + j * (f - g);
  int l = (int)k;
  return l;
}

double B(double a, double b) {
  if (a <= b && a >= -b)
    return 0.42 + 0.5 * cos(3.14159265358979323846264338327950288f * a / b) + 0.08 * cos(2 * 3.14159265358979323846264338327950288f * a / b);
  else
    return 0;
}

double C(double a, double b, double c) {
  if (c <= 1.0) {
    if (__clc_fabs(a) < (double)__clc_pow((double)10, (double)-30))
      return 1.0;
    double d = sin(b * a * 3.14159265358979323846264338327950288f);
    double e = (3.14159265358979323846264338327950288f * b * a);
    if (d / e > 1.0)
      return 1.0;
    return d / e;
  } else {
    double f = 1.0 / c;
    if (__clc_fabs(a) < (double)__clc_pow((double)10, (double)-30))
      return f;
    double d = sin(b * a * 3.14159265358979323846264338327950288f * f);
    double e = (3.14159265358979323846264338327950288f * a * b);
    if (d / e > f)
      return f;
    else
      return d / e;
  }
}

inline double D(double a, __global float* b, float c) {
  a = __clc_fabs(a);
  a *= 512;
  int d = (int)(a);
  if (d >= 65537 || d + 1 >= 65537)
    return 0.0;
  double e = (double)b[d];

  double f = (a - (double)d);
  double g = (double)b[d + 1] - e;
  double h = e + f * g;
  double i = (double)(1.0 / c);
  h = (c < 1.0 && h > i) ? i : h;
  return h;
}

__kernel void E(__global float* a, int b, __global float* c, int d, int e, int f, int g, int h, int i, int j, __global float* k) {
  __global float* l = (__global float*)k;
  int m = get_global_id(0);
  if (m > d)
    return;
  double n = (double)h / (double)i;
  double o = (double)(f + m) * n;
  double p = o;
  int q = (int)o;
  int r = q + 1;

  int s = q - e;
  int t = r - e;
  if (s > 2048 - j) {
    return;
  }

  {
    double u = 0;

    for (int v = 0; v < j; v++) {
      int w = t + v;
      float x = (w >= 0 && w <= 2048 - 1) ? a[w * g] : 0;
      int y = r + v;
      int z = y;
      u += (double)((double)x * D(p - (double)z, l, n));
    }
    for (int v = 0; v < j; v++) {
      int w = s - v;
      float x = (w >= 0 && w <= 2048 - 1) ? a[w * g] : 0;
      int y = q - v;
      int z = y;
      u += (double)((double)x * D(p - (double)z, l, n));
    }
    c[m * g] = (float)u;
  }
  {
    double u = 0;

    for (int v = 0; v < j; v++) {
      int w = t + v;
      float x = (w >= 0 && w <= 2048 - 1) ? a[w * g + 1] : 0;
      int y = r + v;
      int z = y;
      u += (double)((double)x * D(p - (double)z, l, n));
    }
    for (int v = 0; v < j; v++) {
      int w = s - v;
      float x = (w >= 0 && w <= 2048 - 1) ? a[w * g + 1] : 0;
      int y = q - v;
      int z = y;
      u += (double)((double)x * D(p - (double)z, l, n));
    }
    c[m * g + 1] = (float)u;
  }

  return;
}
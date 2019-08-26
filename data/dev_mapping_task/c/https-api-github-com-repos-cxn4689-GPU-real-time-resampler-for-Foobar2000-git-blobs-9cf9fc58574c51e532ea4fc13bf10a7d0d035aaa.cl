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
  if (d > 65537)
    return 0.0;
  double e = (double)b[d];

  double f = (a - (double)d);
  double g = (double)b[d + 1] - e;
  double h = e + f * g;
  double i = (double)(1.0 / c);
  h = (c > 1.0 && h > i) ? i : h;
  return h;
}

__kernel void E(__global float* a, int b, __global float* c, int d, int e, int f, int g, int h, int i, int j, __global float* k) {
  __global float* l = (__global float*)k;
  int m = get_global_id(0);
  if (m > d)
    return;
  double n = (double)h / (double)i;
  int o = h;
  int p = i;
  double q = (double)(f + m) * n;
  double r = q;
  int s = (int)q;
  int t = s + 1;

  int u = s - e;
  int v = t - e;
  if (u > 4096 - j) {
    return;
  }
  float w = (u >= 0 && u <= 4096 - 1) ? a[u * g] : 0;
  float x = (v <= 4096 - 1 && v >= 0) ? a[v * g] : 0;

  {
    double y = 0;

    for (int z = 0; z < j; z++) {
      int aa = v + z;
      float w = (aa >= 0 && aa <= 4096 - 1) ? a[aa * g] : 0;
      int ab = t + z;
      int ac = ab;
      y += (double)((double)w * D(r - (double)ac, l, n));
    }
    for (int z = 0; z < j; z++) {
      int aa = u - z;
      float w = (aa >= 0 && aa <= 4096 - 1) ? a[aa * g] : 0;
      int ab = s - z;
      int ac = ab;
      y += (double)((double)w * D(r - (double)ac, l, n));
    }
    c[m * g] = (float)y;
  }
  {
    double y = 0;

    for (int z = 0; z < j; z++) {
      int aa = v + z;
      float w = (aa >= 0 && aa <= 4096 - 1) ? a[aa * g + 1] : 0;
      int ab = t + z;
      int ac = ab;
      y += (double)((double)w * D(r - (double)ac, l, n));
    }
    for (int z = 0; z < j; z++) {
      int aa = u - z;
      float w = (aa >= 0 && aa <= 4096 - 1) ? a[aa * g + 1] : 0;
      int ab = s - z;
      int ac = ab;
      y += (double)((double)w * D(r - (double)ac, l, n));
    }
    c[m * g + 1] = (float)y;
  }

  return;
}
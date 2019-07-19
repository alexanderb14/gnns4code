void A(double4 a, double4* b) {
  double4 c;
  double4 d;
  double4 e;
  double4 f;

  const double4 g = (double4)0.319381530;
  const double4 h = (double4)-0.356563782;
  const double4 i = (double4)1.781477937;
  const double4 j = (double4)-1.821255978;
  const double4 k = (double4)1.330274429;

  const double4 l = (double4)0.0;
  const double4 m = (double4)1.0;
  const double4 n = (double4)2.0;
  const double4 o = (double4)0.2316419;

  const double4 p = (double4)0.398942280;

  d = __clc_fabs(a);
  e = m / (m + o * d);

  c = m - p * exp(-a * a / n) * e * (g + e * (h + e * (i + e * (j + e * k))));

  f = (a < l) ? (m - c) : c;

  *b = f;
}
__kernel void B(const __global double4* a, int b, __global double4* c, __global double4* d) {
  double4 e, f;
  double4 g, h;
  double4 i;
  double4 j;

  size_t k = get_global_id(0);
  size_t l = get_global_id(1);
  double4 m = (double4)2.0;
  double4 n = a[l * b + k];
  double4 o = 10.0 * n + 100.0 * (1.0 - n);
  double4 p = 10.0 * n + 100.0 * (1.0 - n);
  double4 q = 1.0 * n + 10.0 * (1.0 - n);
  double4 r = 0.01 * n + 0.05 * (1.0 - n);
  double4 s = 0.01 * n + 0.10 * (1.0 - n);

  i = s * sqrt(q);

  e = (log(o / p) + (r + s * s / m) * q) / i;
  f = e - i;

  j = p * exp(-r * q);
  A(e, &g);
  A(f, &h);
  c[l * b + k] = o * g - j * h;
  A(-e, &g);
  A(-f, &h);
  d[l * b + k] = j * h - o * g;
}
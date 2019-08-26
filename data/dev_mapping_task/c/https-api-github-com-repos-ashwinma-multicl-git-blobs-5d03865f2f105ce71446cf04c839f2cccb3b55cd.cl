double A(double* a, double b); void B(int a, double* b, double c, double d[]); __kernel void C(__global double* a, __global double* b, __global double* c, int d, double e, int f, int g) {
  __local double h[128 * 10];
  __local double i[128];
  __local double j[128];
  int k, l, m, n, o, p;
  double q, r, s, t, u, v, w;

  double x[2 * 128];

  int y = get_global_id(0);
  int z = get_local_id(0);

  double aa = 0.0;
  double ab = 0.0;
  for (l = 0; l < 10; l++) {
    h[z * 10 + l] = 0.0;
  }

  if (y < g) {
    y = y + f;

    o = d + y + 1;
    q = 271828183.0;
    r = e;

    for (k = 1; k <= 100; k++) {
      n = o / 2;
      if ((2 * n) != o)
        s = A(&q, r);
      if (n == 0)
        break;
      s = A(&r, r);
      o = n;
    }

    w = q;

    for (m = 0; m < (1 << 16); m = m + 128) {
      B(2 * 128, &w, 1220703125.0, x);

      for (k = 0; k < 128; k++) {
        u = 2.0 * x[2 * k] - 1.0;
        v = 2.0 * x[2 * k + 1] - 1.0;
        q = u * u + v * v;
        if (q <= 1.0) {
          r = sqrt(-2.0 * log(q) / q);
          s = (u * r);
          t = (v * r);
          p = (int)(((__clc_fabs(s)) > (__clc_fabs(t))) ? (__clc_fabs(s)) : (__clc_fabs(t)));
          h[z * 10 + p] += 1.0;
          aa += s;
          ab += t;
        }
      }
    }
  }
  i[z] = aa;
  j[z] = ab;

  barrier(1);

  if (z == 0) {
    for (k = 1; k < get_local_size(0); k++) {
      for (l = 0; l < 10; l++) {
        h[l] += h[k * 10 + l];
      }
      i[0] += i[k];
      j[0] += j[k];
    }

    int ac = get_group_id(0);
    for (l = 0; l < 10; l++) {
      a[ac * 10 + l] = h[l];
    }
    b[ac] = i[0];
    c[ac] = j[0];
  }
}

double A(double* a, double b) {
  const double c = 1.1920928955078125e-07;
  const double d = c * c;
  const double e = 8.388608e+06;
  const double f = e * e;

  double g, h, i, j, k, l, m, n, o;
  double p;

  g = c * b;
  k = (int)g;
  l = b - e * k;

  g = c * (*a);
  m = (int)g;
  n = *a - e * m;
  g = k * n + l * m;
  h = (int)(c * g);
  o = g - e * h;
  i = e * o + l * n;
  j = (int)(d * i);
  *a = i - f * j;
  p = d * (*a);

  return p;
}

void B(int a, double* b, double c, double d[]) {
  const double e = 1.1920928955078125e-07;
  const double f = e * e;
  const double g = 8.388608e+06;
  const double h = g * g;

  double i, j, k, l, m, n, o, p, q;

  int r;

  i = e * c;
  m = (int)i;
  n = c - g * m;

  for (r = 0; r < a; r++) {
    i = e * (*b);
    o = (int)i;
    p = *b - g * o;
    i = m * p + n * o;
    j = (int)(e * i);
    q = i - g * j;
    k = g * q + n * p;
    l = (int)(f * k);
    *b = k - h * l;
    d[r] = f * (*b);
  }

  return;
}
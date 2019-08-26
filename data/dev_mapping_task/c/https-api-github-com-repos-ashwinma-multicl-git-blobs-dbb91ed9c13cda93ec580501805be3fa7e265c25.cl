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

__kernel void C(__local double* a, __local double* b, __local double* c, __global double* d, __global double* e, __global double* f, int g, double h) {
  int i, j, k, l, m, n;
  double o, p, q, r, s, t, u;

  double v[2 * 128];

  int w = get_global_id(0);
  int x = get_local_id(0);

  int y = get_local_size(0);

  double z = 0.0;
  double aa = 0.0;
  for (j = 0; j < 10; j++) {
    a[j * y + x] = 0.0;
  }

  m = g + w + 1;
  o = 271828183.0;
  p = h;

  for (i = 1; i <= 100; i++) {
    l = m / 2;
    if ((2 * l) != m)
      q = A(&o, p);
    if (l == 0)
      break;
    q = A(&p, p);
    m = l;
  }

  u = o;

  for (k = 0; k < (1 << 16); k = k + 128) {
    B(2 * 128, &u, 1220703125.0, v);

    for (i = 0; i < 128; i++) {
      s = 2.0 * v[2 * i] - 1.0;
      t = 2.0 * v[2 * i + 1] - 1.0;
      o = s * s + t * t;
      if (o <= 1.0) {
        p = sqrt(-2.0 * log(o) / o);
        q = (s * p);
        r = (t * p);
        n = (((__clc_fabs(q)) > (__clc_fabs(r))) ? (__clc_fabs(q)) : (__clc_fabs(r)));
        a[n * y + x] += 1.0;
        z += q;
        aa += r;
      }
    }
  }
  b[x] = z;
  c[x] = aa;

  barrier(1);

  for (j = 0; j < 10; j++) {
    for (i = get_local_size(0) / 2; i > 0; i >>= 1) {
      if (x < i) {
        a[j * y + x] += a[j * y + x + i];
      }
      barrier(1);
    }
  }

  for (i = get_local_size(0) / 2; i > 0; i >>= 1) {
    if (x < i) {
      b[x] += b[x + i];
      c[x] += c[x + i];
    }
    barrier(1);
  }

  if (x == 0) {
    int ab = get_group_id(0);
    for (j = 0; j < 10; j++) {
      d[ab * 10 + j] = a[j * y];
    }
    e[ab] = b[0];
    f[ab] = c[0];
  }
}
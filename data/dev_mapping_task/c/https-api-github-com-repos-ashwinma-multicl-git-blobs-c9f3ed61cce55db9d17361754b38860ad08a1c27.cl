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

  double v[2 * 256];

  int w = get_global_id(0);
  int x = get_local_id(0);

  double y = 0.0;
  double z = 0.0;
  for (j = 0; j < 10; j++) {
    a[x * 10 + j] = 0.0;
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

  for (k = 0; k < (1 << 16); k = k + 256) {
    B(2 * 256, &u, 1220703125.0, v);

    for (i = 0; i < 256; i++) {
      s = 2.0 * v[2 * i] - 1.0;
      t = 2.0 * v[2 * i + 1] - 1.0;
      o = s * s + t * t;
      if (o <= 1.0) {
        p = sqrt(-2.0 * log(o) / o);
        q = (s * p);
        r = (t * p);
        n = (((__clc_fabs(q)) > (__clc_fabs(r))) ? (__clc_fabs(q)) : (__clc_fabs(r)));
        a[x * 10 + n] += 1.0;
        y += q;
        z += r;
      }
    }
  }
  b[x] = y;
  c[x] = z;

  barrier(1);

  if (x == 0) {
    for (i = 1; i < get_local_size(0); i++) {
      for (j = 0; j < 10; j++) {
        a[j] += a[i * 10 + j];
      }
      b[0] += b[i];
      c[0] += c[i];
    }

    int aa = get_group_id(0);
    for (j = 0; j < 10; j++) {
      d[aa * 10 + j] = a[j];
    }
    e[aa] = b[0];
    f[aa] = c[0];
  }
}
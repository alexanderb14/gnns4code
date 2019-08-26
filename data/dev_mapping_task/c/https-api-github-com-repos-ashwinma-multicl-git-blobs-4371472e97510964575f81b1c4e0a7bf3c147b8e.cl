typedef bool logical; double A(double* a, double b) {
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

inline int B(double a, int b) {
  return (int)(b * a);
}

inline void C(int a, double b[], int c[], int* d, int e, double f) {
  int g;
  logical h;

  h = false;
  for (g = 0; g < *d; g++) {
    if (c[g] == e) {
      b[g] = f;
      h = true;
    }
  }
  if (h == false) {
    b[*d] = f;
    c[*d] = e;
    *d = *d + 1;
  }
}
inline void D(int a, int b, int c, double d[], int e[], double* f, double g) {
  volatile int h;
  int i, j;
  double k, l;

  h = 0;

  while (h < b) {
    k = A(f, g);

    l = A(f, g);
    j = B(l, c) + 1;

    if (j > a)
      continue;

    logical m = false;
    for (i = 0; i < h; i++) {
      if (e[i] == j) {
        m = true;
        break;
      }
    }
    if (m)
      continue;
    d[h] = k;
    e[h] = j;
    h = h + 1;
  }
}

__kernel void E(__global int* a, int b) {
  int c = get_global_id(0);
  if (c >= b)
    return;
  a[c] = 0;
}

__kernel void F(__global double* a, int b) {
  int c = get_global_id(0);
  if (c >= b)
    return;
  a[c] = 0.0;
}

__kernel void G(__global int* a, __global int* b, __global double* c, __global int* d, __global int* e, int f, int g, double h, double i) {
  __global int(*j)[11 + 1];
  __global double(*k)[11 + 1];

  int l, m, n;
  int o[11 + 1];
  double p[11 + 1];
  double q = h;

  int r, s, t, u;
  int v;

  j = (__global int(*)[11 + 1])b;
  k = (__global double(*)[11 + 1])c;

  s = get_global_size(0);
  r = get_global_id(0);

  v = (f + s - 1) / s;
  t = v * r;
  u = t + v;
  if (u > f)
    u = f;

  d[r] = t;
  e[r] = u;

  for (l = 0; l < u; l++) {
    n = 11;
    D(f, n, g, p, o, &q, i);
    if (l >= t) {
      C(f, p, o, &n, l + 1, 0.5);
      a[l] = n;
      for (m = 0; m < n; m++) {
        j[l][m] = o[m] - 1;
        k[l][m] = p[m];
      }
    }
  }
}

__kernel void H(__global int* a, __global int* b, __global int* c, __global int* d, __global int* e, __global int* f, int g) {
  __global int(*h)[11 + 1] = (__global int(*)[11 + 1])c;

  int i, j, k, l, m;

  int n = get_global_id(0);
  int o = get_global_size(0);
  int p = e[n];
  if (p >= g)
    return;
  int q = f[n];

  k = p + 1;
  l = q + 1;

  for (i = 0; i < g; i++) {
    for (m = 0; m < b[i]; m++) {
      j = h[i][m];
      if (j >= p && j < q) {
        j = j + 1;
        a[j] = a[j] + b[i];
      }
    }
  }

  if (n == 0) {
    a[0] = 0;
    k = 0;
  }
  for (j = k + 1; j < l; j++) {
    a[j] = a[j] + a[j - 1];
  }
  if (n < o)
    d[n] = a[l - 1];
}

__kernel void I(__global int* a, __global int* b, __global int* c, __global int* d) {
  int e = get_global_id(0);
  int f = get_global_size(0);

  int g = 0;
  if (e < f) {
    for (int h = 0; h < e; h++) {
      g = g + b[h];
    }
  }
  if (g > 0) {
    int i = (e == 0) ? 0 : (c[e] + 1);
    int j = d[e] + 1;

    for (int k = i; k < j; k++) {
      a[k] = a[k] + g;
    }
  }
}

__kernel void J(__global double* a, __global int* b, __global int* c, __global int* d, __global int* e, __global double* f, __global int* g, __global int* h, int i, int j) {
  __global int(*k)[11 + 1];
  __global double(*l)[11 + 1];
  __global int* m;

  const double n = 1.0e-1;
  const double o = 20;

  int p, q, r, s, t, u, v;
  double w, x, y, z;
  logical aa;

  int ab = get_global_id(0);
  if (ab >= i)
    return;

  k = (__global int(*)[11 + 1])e;
  l = (__global double(*)[11 + 1])f;
  m = &b[j];

  for (r = c[ab]; r < c[ab + 1]; r++) {
    a[r] = 0.0;
    b[r] = -1;
  }
  m[ab] = 0;

  w = 1.0;
  y = __clc_pow(n, (1.0 / (double)(i)));

  for (p = 0; p < i; p++) {
    for (t = 0; t < d[p]; t++) {
      q = k[p][t];

      if (q != ab)
        continue;

      x = w * l[p][t];
      for (u = 0; u < d[p]; u++) {
        v = k[p][u];
        z = l[p][u] * x;

        if (v == q && q == p) {
          z = z + n - o;
        }

        aa = false;
        for (r = c[q]; r < c[q + 1]; r++) {
          if (b[r] > v) {
            for (s = c[q + 1] - 2; s >= r; s--) {
              if (b[s] > -1) {
                a[s + 1] = a[s];
                b[s + 1] = b[s];
              }
            }
            b[r] = v;
            a[r] = 0.0;
            aa = true;
            break;
          } else if (b[r] == -1) {
            b[r] = v;
            aa = true;
            break;
          } else if (b[r] == v) {
            m[q] = m[q] + 1;
            aa = true;
            break;
          }
        }
        a[r] = a[r] + z;
      }
    }
    w = w * y;
  }
}

__kernel void K(__global int* a, __global int* b, __global int* c, __global int* d, int e, int f) {
  int g = get_global_id(0);
  int h = get_global_size(0);
  int i = c[g];
  if (i >= e)
    return;
  int j = d[g];

  __global int* k = &a[f];

  for (int l = i + 1; l < j; l++) {
    k[l] = k[l] + k[l - 1];
  }
  if (g < h)
    b[g] = k[j - 1];
}

__kernel void L(__global int* a, __global int* b, __global int* c, __global int* d, int e, int f) {
  int g = get_global_id(0);
  int h = get_global_size(0);
  int i = c[g];
  if (i >= e)
    return;
  int j = d[g];

  int k = 0;
  if (g < h) {
    for (int l = 0; l < g; l++) {
      k = k + b[l];
    }
  }
  if (k > 0) {
    __global int* m = &a[f];
    for (int n = i; n < j; n++) {
      m[n] = m[n] + k;
    }
  }
}

__kernel void M(__global double* a, __global double* b, __global int* c, __global int* d, __global int* e, int f, int g) {
  int h, i, j;
  int k = get_global_id(0);
  if (k >= g)
    return;

  __global int* l = &e[f];

  if (k > 0) {
    h = c[k] - l[k - 1];
  } else {
    h = 0;
  }
  i = c[k + 1] - l[k];
  j = c[k];
  for (int m = h; m < i; m++) {
    a[m] = b[j];
    d[m] = e[j];
    j = j + 1;
  }
}

__kernel void N(__global int* a, __global int* b, int c, int d) {
  int e = get_global_id(0) + 1;
  if (e >= (c + 1))
    return;

  __global int* f = &b[d];

  a[e] = a[e] - f[e - 1];
}
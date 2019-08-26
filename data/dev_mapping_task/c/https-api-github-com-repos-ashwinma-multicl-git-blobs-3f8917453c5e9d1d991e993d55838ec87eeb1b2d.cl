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

int B(double a, int b) {
  return (int)(b * a);
}

void C(int a, double b[], int c[], int* d, int e, double f) {
  int g;
  int h;

  h = false;
  for (g = 1; g <= *d; g++) {
    if (c[g] == e) {
      b[g] = f;
      h = true;
    }
  }
  if (h == false) {
    *d = *d + 1;
    b[*d] = f;
    c[*d] = e;
  }
}

void D(int a, int b, int c, double d[], int e[], double* f, double g) {
  int h, i, j;
  double k, l;

  h = 0;

  while (h < b) {
    k = A(f, g);

    l = A(f, g);
    j = B(l, c) + 1;
    if (j > a)
      continue;

    int m = false;
    for (i = 1; i <= h; i++) {
      if (e[i] == j) {
        m = true;
        break;
      }
    }
    if (m)
      continue;
    h = h + 1;
    d[h] = k;
    e[h] = j;
  }
}

__kernel void E(int a, __global int* b, __global int* c, __global double* d, double e, double f) {
  int g, h, i, j;
  int k[15 + 1 + 1];
  double l[15 + 1 + 1];
  double m = e;

  int n, o, p, q;
  int r;

  j = 1;
  do {
    j = 2 * j;
  } while (j < a);

  o = get_global_size(0);
  n = get_global_id(0);

  r = (a + o - 1) / o;
  p = r * n + 1;
  q = p + r - 1;
  if (q > a)
    q = a;

  for (g = 1; g <= q; g++) {
    i = 15;
    D(a, i, j, l, k, &m, f);
    if (g >= p) {
      C(a, l, k, &i, g, 0.5);
      b[g] = i;
      for (h = 1; h <= i; h++) {
        c[(g - 1) * (15 + 1 + 1) + h] = k[h];
        d[(g - 1) * (15 + 1 + 1) + h] = l[h];
      }
    }
  }
}

__kernel void F(__global int* a, __global int* b, __global int* c, __global int* d, int e, int f, int g) {
  int h, i, j, k, l;
  k = get_global_id(0);
  l = get_global_size(0);
  h = (g + l - 1) / l;
  j = h * k + 1;
  i = j + h - 1;
  if (i > g)
    i = g;

  int m, n, o, p, q;

  o = j + 1;
  p = i + 1;

  for (n = o; n <= p; n++) {
    a[n] = 0;
  }

  for (m = 1; m <= g; m++) {
    for (q = 1; q <= b[m]; q++) {
      n = c[(m - 1) * (15 + 1 + 1) + q];
      if (n >= j && n <= i) {
        n = n + 1;
        a[n] = a[n] + b[m];
      }
    }
  }

  if (k == 0) {
    a[1] = 1;
    o = 1;
  }
  for (n = o + 1; n <= p; n++) {
    a[n] = a[n] + a[n - 1];
  }
  if (k < l)
    d[k] = a[p];
}

__kernel void G(__global int* a, __global int* b, int c, int d, int e) {
  int f, g, h, i, j;
  i = get_global_id(0);
  j = get_global_size(0);
  f = (e + j - 1) / j;
  h = f * i + 1;
  g = h + f - 1;
  if (g > e)
    g = e;

  int k, l, m, n, o;

  m = h + 1;
  n = g + 1;

  if (i == 0) {
    m = 1;
  }

  o = 0;
  if (i < j) {
    for (k = 0; k <= i - 1; k++) {
      o = o + b[k];
    }
  }
  if (o > 0) {
    for (l = m; l <= n; l++) {
      a[l] = a[l] + o;
    }
  }
}

__kernel void H(__global double* a, __global int* b, __global int* c, __global int* d, __global int* e, __global double* f, int g, int h, int i, int j, double k, double l) {
  int m, n, o, p, q;
  p = get_global_id(0);
  q = get_global_size(0);
  m = (i + q - 1) / q;
  o = m * p + 1;
  n = o + m - 1;
  if (n > i)
    n = i;

  int r;

  int s, t, u, v, w, x, y;
  double z, aa, ab, ac;

  r = h - g + 1;
  __global int* ad = &b[j];

  u = c[r + 1] - 1;

  for (t = o; t <= n; t++) {
    for (v = c[t]; v <= c[t + 1] - 1; v++) {
      a[v] = 0.0;
      b[v] = 0;
    }
    ad[t] = 0;
  }

  z = 1.0;
  ab = __clc_pow(k, (1.0 / (double)(i)));

  for (s = 1; s <= i; s++) {
    for (u = 1; u <= d[s]; u++) {
      t = e[(s - 1) * (15 + 1 + 1) + u];

      if (t < o || t > n)
        continue;

      aa = z * f[(s - 1) * (15 + 1 + 1) + u];
      for (x = 1; x <= d[s]; x++) {
        y = e[(s - 1) * (15 + 1 + 1) + x];
        ac = f[(s - 1) * (15 + 1 + 1) + x] * aa;

        if (y == t && t == s) {
          ac = ac + k - l;
        }

        for (v = c[t]; v <= c[t + 1] - 1; v++) {
          if (b[v] > y) {
            for (w = c[t + 1] - 2; w >= v; w--) {
              if (b[w] > 0) {
                a[w + 1] = a[w];
                b[w + 1] = b[w];
              }
            }
            b[v] = y;
            a[v] = 0.0;
            break;
          } else if (b[v] == 0) {
            b[v] = y;
            break;
          } else if (b[v] == y) {
            ad[t] = ad[t] + 1;
            break;
          }
        }

        a[v] = a[v] + ac;
      }
    }
    z = z * ab;
  }
}

__kernel void I(__global int* a, __global int* b, int c, int d, int e, int f) {
  int g, h, i, j, k;
  j = get_global_id(0);
  k = get_global_size(0);
  g = (e + k - 1) / k;
  i = g * j + 1;
  h = i + g - 1;
  if (h > e)
    h = e;

  int l;

  __global int* m = &a[f];

  for (l = i + 1; l <= h; l++) {
    m[l] = m[l] + m[l - 1];
  }

  b[j] = m[h];
}

__kernel void J(__global int* a, __global int* b, int c, int d, int e, int f) {
  int g, h, i, j, k;
  j = get_global_id(0);
  k = get_global_size(0);
  g = (e + k - 1) / k;
  i = g * j + 1;
  h = i + g - 1;
  if (h > e)
    h = e;

  int l, m, n;

  __global int* o = &a[f];

  n = 0;
  if (j < k) {
    for (l = 0; l <= j - 1; l++) {
      n = n + b[l];
    }
  }
  if (n > 0) {
    for (m = i; m <= h; m++) {
      o[m] = o[m] + n;
    }
  }
}

__kernel void K(__global double* a, __global double* b, __global int* c, __global int* d, __global int* e, int f, int g, int h, int i) {
  int j, k, l, m, n;
  m = get_global_id(0);
  n = get_global_size(0);
  j = (h + n - 1) / n;
  l = j * m + 1;
  k = l + j - 1;
  if (k > h)
    k = h;

  int o, p, q, r, s;

  p = l + 1;
  q = k + 1;

  if (m == 0) {
    p = 1;
  }

  __global int* t = &e[i];

  o = get_global_id(1) + 1;
  {
    if (o > 1) {
      p = c[o] - t[o - 1];
    } else {
      p = 1;
    }

    q = c[o + 1] - t[o] - 1;

    r = c[o];
    for (s = p; s <= q; s++) {
      a[s] = b[r];
      d[s] = e[r];
      r = r + 1;
    }
  }
}

__kernel void L(__global int* a, __global int* b, const int c, const int d) {
  int e = get_global_id(0) + 1;
  if (e <= d) {
    int f;
    for (f = b[e]; f <= b[e + 1] - 1; f++) {
      a[f] = a[f] - c + 1;
    }
  }
}

__kernel void M(__global double* a, const int b) {
  int c = get_global_id(0) + 1;
  if (c <= b)
    a[c] = 1.0;
}

__kernel void N(__global double* a, __global double* b, __global double* c, __global double* d) {
  int e = get_global_id(0) + 1;
  a[e] = 0.0;
  b[e] = 0.0;
  c[e] = 0;
  d[e] = 0;
}

__kernel void O(__global double* a, __global double* b, __local double* c, __local double* d, int e, __global double* f, __global double* g) {
  int h = get_global_id(0);
  double i = 0;
  double j = 0;

  while (h <= e) {
    double k = a[h];
    double l = b[h];
    if (h > 0) {
      i += k * l;
      j += l * l;
    }
    h += get_global_size(0);
  }

  int m = get_local_id(0);
  c[m] = i;
  d[m] = j;
  barrier(1);
  for (int n = get_local_size(0) / 2; n > 0; n = n / 2) {
    if (m < n) {
      double o = c[m + n];
      double p = c[m];
      c[m] = p + o;

      double q = d[m + n];
      double r = d[m];
      d[m] = r + q;
    }
    barrier(1);
  }
  if (m == 0) {
    f[get_group_id(0)] = c[0];
    g[get_group_id(0)] = d[0];
  }
}

__kernel void P(__global double* a, __global double* b, const double c, const int d) {
  int e = get_global_id(0) + 1;
  if (e <= d)
    a[e] = c * b[e];
}

__kernel void Q(__global double* a, __global double* b, __global double* c, __global double* d, __global double* e, __global double* f, int g) {
  int h = get_global_id(0) + 1;
  if (h <= g) {
    a[h] = 0.0;
    b[h] = 0.0;
    c[h] = d[h];
    e[h] = c[h];
    f[h] = 0;
  }
}

__kernel void R(__global double* a, __local double* b, const int c, __global double* d) {
  int e = get_global_id(0);
  double f = 0;

  while (e <= c) {
    double g = a[e];
    if (e > 0)
      f += g * g;
    e += get_global_size(0);
  }

  int h = get_local_id(0);
  b[h] = f;
  barrier(1);
  for (int i = get_local_size(0) / 2; i > 0; i = i / 2) {
    if (h < i) {
      double j = b[h + i];
      double k = b[h];
      b[h] = k + j;
    }
    barrier(1);
  }
  if (h == 0) {
    d[get_group_id(0)] = b[0];
  }
}

__kernel void S(__global int* a, __global double* b, __global double* c, __global int* d, __global double* e, const int f) {
  int g = get_global_id(0) + 1;
  if (g <= f) {
    int h;
    double i = 0.0;
    int j = a[g];
    int k = a[g + 1] - 1;
    for (h = j; h <= k; h++) {
      i = i + b[h] * c[d[h]];
    }
    e[g] = i;
  }
}

__kernel void T(__global double* a, __global double* b, __local double* c, const int d, __global double* e) {
  int f = get_global_id(0);
  double g = 0;

  while (f <= d) {
    double h = a[f];
    double i = b[f];
    if (f > 0)
      g += h * i;
    f += get_global_size(0);
  }

  int j = get_local_id(0);
  c[j] = g;
  barrier(1);
  for (int k = get_local_size(0) / 2; k > 0; k = k / 2) {
    if (j < k) {
      double l = c[j + k];
      double m = c[j];
      c[j] = m + l;
    }
    barrier(1);
  }
  if (j == 0) {
    e[get_group_id(0)] = c[0];
  }
}

__kernel void U(__global double* a, __global double* b, __global double* c, __global double* d, const double e, const int f) {
  int g = get_global_id(0) + 1;
  if (g <= f) {
    d[g] = d[g] + e * a[g];
    c[g] = c[g] - e * b[g];
  }
}

__kernel void V(__global double* a, __global double* b, const double c, const int d) {
  int e = get_global_id(0) + 1;
  if (e <= d) {
    a[e] = b[e] + c * a[e];
  }
}

__kernel void W(__global int* a, __global double* b, __global double* c, __global int* d, __global double* e, const int f) {
  int g = get_global_id(0) + 1;
  if (g <= f) {
    int h;
    double i = 0.0;
    for (h = a[g]; h <= a[g + 1] - 1; h++) {
      i = i + b[h] * c[d[h]];
    }
    e[g] = i;
  }
}

__kernel void X(__global double* a, __global double* b, __local double* c, const int d, __global double* e) {
  int f = get_global_id(0);
  double g = 0;

  while (f <= d) {
    double h = a[f];
    double i = b[f];
    if (f > 0)
      g += (h - i) * (h - i);
    f += get_global_size(0);
  }

  int j = get_local_id(0);
  c[j] = g;
  barrier(1);
  for (int k = get_local_size(0) / 2; k > 0; k = k / 2) {
    if (j < k) {
      double l = c[j + k];
      double m = c[j];
      c[j] = m + l;
    }
    barrier(1);
  }
  if (j == 0) {
    e[get_group_id(0)] = c[0];
  }
}

__kernel void Y(__global double* a, const int b) {
  int c = get_global_id(0) + 1;
  if (c <= b) {
    a[c] = 0.0;
  }
}

__kernel void Z(__global double* a, __global double* b, const int c, const int d) {
  int e = get_global_id(0) + c;
  if (e >= c && e <= d) {
    a[e] = a[e] + b[e];
  }
}
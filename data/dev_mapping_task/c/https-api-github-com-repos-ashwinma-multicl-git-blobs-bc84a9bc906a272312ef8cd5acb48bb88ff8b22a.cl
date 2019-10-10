typedef struct {
  double real;
  double imag;
} dcomplex;

inline dcomplex A(dcomplex a, dcomplex b) {
  double c = a.real;
  double d = a.imag;
  double e = b.real;
  double f = b.imag;

  double g = e * e + f * f;
  double h = (c * e + d * f) / g;
  double i = (d * e - c * f) / g;
  dcomplex j = (dcomplex) {
    i return j;
  }
  void B(int a, int b, int c, __global dcomplex* d, __global dcomplex* e, __global dcomplex* f);
  void C(int a, int b, int c, __global dcomplex* d, __global dcomplex(*e)[18], __global dcomplex(*f)[18]);
  void D(int a, int b, int c, int d, __global dcomplex* e, __global dcomplex* f, __global dcomplex* g);
  void E(int a, int b, int c, int d, int e, int f, __global dcomplex* g, __global dcomplex(*h)[18], __global dcomplex(*i)[18]);
  double F(double* a, double b);
  void G(int a, double* b, double c, __global double d[]);
  double H(double a, int b, int c);
  __kernel void I(__global double* a, __global const int* b, __global const int* c, __global const int* d, __global const int* e, int f) {
    __global const int(*g)[3] = (__global const int(*)[3])b;
    int h = g[2][0];
    int i = g[2][1];
    int j = g[2][2];

    int k, l, m, n, o, p, q, r;
    double s;

    s = -4.0 * 1.0e-6 * 3.141592653589793238 * 3.141592653589793238;
    if (f == 0) {
      m = get_global_id(1);
      l = get_global_id(0);
      if (m >= j || l >= i)
        return;

      r = ((m + e[2] + 128 / 2) % 128) - 128 / 2;
      p = ((l + d[2] + 256 / 2) % 256) - 256 / 2;
      for (k = 0; k < g[2][0]; k++) {
        n = ((k + c[2] + 256 / 2) % 256) - 256 / 2;
        o = n * n;
        q = p * p + o;
        a[m * i * h + l * h + k] = exp(s * (double)(r * r + q));
      }
    } else if (f == 1) {
      l = get_global_id(1);
      k = get_global_id(0);
      if (l >= j || k >= i)
        return;

      p = ((l + d[2] + 256 / 2) % 256) - 256 / 2;
      n = ((k + c[2] + 256 / 2) % 256) - 256 / 2;
      o = n * n;
      q = p * p + o;
      for (m = 0; m < g[2][0]; m++) {
        r = ((m + e[2] + 128 / 2) % 128) - 128 / 2;
        a[l * i * h + k * h + m] = exp(s * (double)(r * r + q));
      }
    } else if (f == 2) {
      l = get_global_id(1);
      k = get_global_id(0);
      if (l >= j || k >= i)
        return;

      p = ((l + d[2] + 256 / 2) % 256) - 256 / 2;
      n = ((k + c[2] + 256 / 2) % 256) - 256 / 2;
      o = n * n;
      q = p * p + o;
      for (m = 0; m < g[2][0]; m++) {
        r = ((m + e[2] + 128 / 2) % 128) - 128 / 2;
        a[l * i * h + k * h + m] = exp(s * (double)(r * r + q));
      }
    }
  }

  __kernel void J(__global double* a, __global const int* b, __global const int* c, __global const int* d) {
    __global const int(*e)[3] = (__global const int(*)[3])b;

    int f;
    double g, h;

    g = 314159265.0;

    h = H(1220703125.0, 2 * 256, d[0] * 256 + c[0]);
    F(&g, h);
    h = H(1220703125.0, 2 * 256, 256);

    a[0] = g;
    for (f = 1; f < e[0][2]; f++) {
      F(&g, h);
      a[f] = g;
    }
  }

  __kernel void K(__global dcomplex * a, __global double* b, __global const int* c) {
    __global const int(*d)[3] = (__global const int(*)[3])c;
    int e = d[0][0];
    int f = d[0][1];
    int g = d[0][2];

    int h;
    double i;

    h = get_global_id(0);
    if (h >= g)
      return;

    i = b[h];
    G(2 * 256 * f, &i, 1220703125.0, (__global double*)&a[h * f * e]);
  }

  __kernel void L(__global dcomplex * a, __global dcomplex * b, __global const double* c, int d, int e, int f) {
    int g, h, i;
    i = get_global_id(1);
    h = get_global_id(0);
    if (i >= f || h >= e)
      return;

    int j = i * e * d + h * d;
    for (g = 0; g < d; g++) {
      int k = j + g;
      a[k] = (dcomplex) {(ak.rek(c(ak.imk(c
    b[k] = a[k];
      }
    }

    __kernel void M(__global dcomplex * a, __global dcomplex * b, __local dcomplex * c, __global const int* d, __global const int* e, __global const int* f, __global const int* g, __global const int* h, __global const int* i, int j, int k) {
      int l, m, n;
      int o = get_global_id(0) + 1;
      int p = get_local_id(0);

      c[p] = (dcomplex){0.0, 0.0};
      if (o <= 1024) {
        l = o % 256;
        if (l >= d[0] && l < e[0]) {
          m = 3 * o % 256;
          if (m >= f[0] && m < g[0]) {
            n = 5 * o % 128;
            if (n >= h[0] && n < i[0]) {
              int q = (n - h[0]) * k * j + (m - f[0]) * j + (l - d[0]);
              c[p] = a[q];
            }
          }
        }
      }

      barrier(1);

      if (p == 0) {
        dcomplex r = c[0];
        for (int o = 1; o < get_local_size(0); o++) {
      r = (dcomplex){(rlo(c.real, (rgo(c.imag};
        }

        b[get_group_id(0)] = r;
      }
    }

    __kernel void N(__global dcomplex * a, __global dcomplex * b, __global dcomplex * c, __global dcomplex * d, __global dcomplex * e, int f, int g, int h, int i, int j) {
      int k, l, m;

      m = get_global_id(1);
      l = get_global_id(0);
      if (m >= i || l >= h)
        return;

      __global dcomplex* n = &d[m * h * g + l * g];
      __global dcomplex* o = &e[m * h * g + l * g];

      int p = m * h * g + l * g;
      for (k = 0; k < g; k++) {
        n[k] = a[p + k];
      }

      B(f, j, g, c, n, o);

      for (k = 0; k < g; k++) {
        b[p + k] = n[k];
      }
    }

    __kernel void O(__global dcomplex * a, __global dcomplex * b, __global dcomplex * c, __global dcomplex * d, __global dcomplex * e, int f, int g, int h, int i, int j) {
      int k, l, m;

      m = get_global_id(1);
      k = get_global_id(0);
      if (m >= i || k >= g)
        return;

      __global dcomplex* n = &d[m * g * h + k * h];
      __global dcomplex* o = &e[m * g * h + k * h];

      int p = m * h * g + k;
      for (l = 0; l < h; l++) {
        n[l] = a[p + l * g];
      }

      B(f, j, h, c, n, o);

      for (l = 0; l < h; l++) {
        b[p + l * g] = n[l];
      }
    }

    __kernel void P(__global dcomplex * a, __global dcomplex * b, __global dcomplex * c, __global dcomplex * d, __global dcomplex * e, int f, int g, int h, int i, int j) {
      int k, l, m;

      l = get_global_id(1);
      k = get_global_id(0);
      if (l >= h || k >= g)
        return;

      __global dcomplex* n = &d[l * g * i + k * i];
      __global dcomplex* o = &e[l * g * i + k * i];

      int p = l * g + k;
      for (m = 0; m < i; m++) {
        n[m] = a[m * h * g + p];
      }

      B(f, j, i, c, n, o);

      for (m = 0; m < i; m++) {
        b[m * h * g + p] = n[m];
      }
    }
    void B(int a, int b, int c, __global dcomplex* d, __global dcomplex* e, __global dcomplex* f) {
      int g, h;
      for (h = 1; h <= b; h += 2) {
        D(a, h, b, c, d, e, f);
        if (h == b) {
          for (g = 0; g < c; g++) {
            e[g] = f[g];
          }
          return;
        }
        D(a, h + 1, b, c, d, f, e);
      }
    }

    void C(int a, int b, int c, __global dcomplex* d, __global dcomplex(*e)[18], __global dcomplex(*f)[18]) {
      int g, h, i;
      for (i = 1; i <= b; i += 2) {
        E(a, i, b, c, 16, 18, d, e, f);
        if (i == b) {
          for (h = 0; h < c; h++) {
            for (g = 0; g < 16; g++) {
              e[h][g] = f[h][g];
            }
          }
          return;
        }
        E(a, i + 1, b, c, 16, 18, d, f, e);
      }
    }

    void D(int a, int b, int c, int d, __global dcomplex* e, __global dcomplex* f, __global dcomplex* g) {
      int h, i, j, k, l, m, n, o, p, q, r;
      dcomplex s, t, u, v;

      i = d / 2;
      l = 1 << (b - 1);
      j = 1 << (c - b);
      k = 2 * l;
      m = j;

      for (n = 0; n <= j - 1; n++) {
        o = n * l;
        p = o + i;
        q = n * k;
        r = q + l;
        if (a >= 1) {
          s = e[m + n];
        } else {
          s = (dcomplex){(e[mn]).real, -1.0 * (e[mn]).imag};
        }

        for (h = 0; h <= l - 1; h++) {
          t = f[o + h];
          u = f[p + h];
      g[q+h] = (dcomplex){(treal+(ureal, (timag+(uimag};
      v = (dcomplex){(treal-(ureal, (timag-(uimag};
      g[r+h] = (dcomplex){((s.real*(vreal)-((s.imag*(vimag), ((s.real*(vimag)+((s.imag*(vreal)};
        }
      }
    }

    void E(int a, int b, int c, int d, int e, int f, __global dcomplex* g, __global dcomplex(*h)[18], __global dcomplex(*i)[18]) {
      int j, k, l, m, n, o, p, q, r, s, t, u;
      dcomplex v, w, x, y;

      k = d / 2;
      n = 1 << (b - 1);
      l = 1 << (c - b);
      m = 2 * n;
      o = l;

      for (p = 0; p <= l - 1; p++) {
        r = p * n;
        s = r + k;
        t = p * m;
        u = t + n;
        if (a >= 1) {
          v = g[o + p];
        } else {
          v = (dcomplex){(g[op]).real, -1.0 * (g[op]).imag};
        }

        for (j = 0; j <= n - 1; j++) {
          for (q = 0; q < e; q++) {
            w = h[r + j][q];
            x = h[s + j][q];
        i[t+j][q] = (dcomplex){(wreal+(xreal, (wimag+(ximag};
        y = (dcomplex){(wreal-(xreal, (wimag-(ximag};
        i[u+j][q] = (dcomplex){((v.real*(yreal)-((v.imag*(yimag), ((v.real*(yimag)+((v.imag*(yreal)};
          }
        }
      }
    }

    __kernel void Q(__global dcomplex * a, __global dcomplex * b, int c, int d) {
      int e, f;

      f = get_global_id(1);
      e = get_global_id(0);
      if (f >= d || e >= c)
        return;

      b[e * d + f] = a[f * c + e];
    }

    __kernel void R(__global dcomplex * a, __global dcomplex * b, int c, int d) {
      int e, f;

      e = get_global_id(1);
      f = get_global_id(0);
      if (e >= c || f >= d)
        return;

      b[e * d + f] = a[f * c + e];
    }

    __kernel void S(__global dcomplex * a, __global dcomplex * b, int c, int d) {
      dcomplex e[32][34];
      int f, g, h, i;

      g = get_global_id(1) * 32;
      f = get_global_id(0) * 32;
      if (g >= d || f >= c)
        return;

      for (i = 0; i < 32; i++) {
        for (h = 0; h < 32; h++) {
          e[h][i] = a[(g + i) * c + (f + h)];
        }
      }

      for (h = 0; h < 32; h++) {
        for (i = 0; i < 32; i++) {
          b[(f + h) * d + (g + i)] = e[h][i];
        }
      }
    }

    __kernel void T(__global dcomplex * a, __global dcomplex * b, int c, int d, int e) {
      int f;
      int g, h, i;
      i = get_global_id(1);
      h = get_global_id(0);
      if (i >= e || h >= (c / e))
        return;

      f = i * d;
      for (g = 0; g < d; g++) {
        b[h * d * e + (g + f)] = a[i * (c / e) * d + h * d + g];
      }
    }

    __kernel void U(__global dcomplex * a, __global dcomplex * b, int c, int d, int e) {
      int f, g, h;
      g = get_global_id(1);
      h = get_global_id(0);
      if (g >= d || h >= e)
        return;

      for (f = 0; f < c; f++) {
        b[f * d * e + g * e + h] = a[h * d * c + g * c + f];
      }
    }

    __kernel void V(__global dcomplex * a, __global dcomplex * b, int c, int d, int e, int f, int g) {
      int h, i, j, k, l, m, n;
      dcomplex o[256][34];
      i = get_global_id(1);
      k = get_global_id(0) * g;
      if (i >= d || k > (e - g))
        return;

      for (l = 0; l <= c - f; l += f) {
        for (j = 0; j < g; j++) {
          n = j + k;
          for (h = 0; h < f; h++) {
            o[h][j] = a[n * d * c + i * c + (h + l)];
          }
        }

        for (h = 0; h < f; h++) {
          m = h + l;
          for (j = 0; j < g; j++) {
            b[m * d * e + i * e + (j + k)] = o[h][j];
          }
        }
      }
    }

    __kernel void W(__global dcomplex * a, __global dcomplex * b, int c, int d, int e, int f) {
      int g, h, i, j, k;
      j = get_global_id(1);
      i = get_global_id(0);
      if (j >= f || i >= e)
        return;

      k = j * c / f;
      for (h = 0; h < d; h++) {
        int l = j * e * d * (c / f) + i * d * (c / f) + h * (c / f);
        int m = i * d * c + h * c;
        for (g = 0; g < c / f; g++) {
          b[m + g + k] = a[l + g];
        }
      }
    }

    __kernel void X(__global dcomplex * a, __global dcomplex * b, int c, int d, int e) {
      int f, g, h;
      h = get_global_id(1);
      f = get_global_id(0);
      if (h >= e || f >= c)
        return;

      for (g = 0; g < d; g++) {
        b[f * e * d + h * d + g] = a[h * d * c + g * c + f];
      }
    }

    __kernel void Y(__global dcomplex * a, __global dcomplex * b, int c, int d, int e, int f) {
      int g, h, i, j, k;
      j = get_global_id(1);
      i = get_global_id(0);
      if (j >= f || i >= e)
        return;

      k = j * c / f;
      for (h = 0; h < d; h++) {
        int l = j * d * e * (c / f) + h * e * (c / f) + i * (c / f);
        int m = i * d * c + h * c;
        for (g = 0; g < c / f; g++) {
          b[m + g + k] = a[l + g];
        }
      }
    }

    double F(double* a, double b) {
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

    void G(int a, double* b, double c, __global double d[]) {
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
    }

    double H(double a, int b, int c) {
      double d, e;
      int f, g;
      int h;

      if (c == 0 || b == 0)
        return 1.0;
      d = a;
      e = 1;
      f = b;
      h = true;

      while (h) {
        g = f / 2;
        if (g * 2 == f) {
          F(&d, d);
          f = g;
        } else {
          f = f * c;
          h = false;
        }
      }

      while (f > 1) {
        g = f / 2;
        if (g * 2 == f) {
          F(&d, d);
          f = g;
        } else {
          F(&e, d);
          f = f - 1;
        }
      }
      F(&e, d);
      return e;
    }
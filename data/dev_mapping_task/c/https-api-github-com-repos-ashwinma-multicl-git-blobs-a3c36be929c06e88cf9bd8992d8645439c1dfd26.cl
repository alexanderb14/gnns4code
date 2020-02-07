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
  void C(int a, int b, int c, int d, __global dcomplex* e, __global dcomplex* f, __global dcomplex* g);
  void D(int a, double* b, double c, __global double d[]);

  __kernel void E(__global dcomplex * a, __global dcomplex * b, __global double* c, int d) {
    int e = get_global_id(0);
    if (e >= d)
      return;

    a[e] = (dcomplex){0.0, 0.0};
    b[e] = (dcomplex){0.0, 0.0};
    c[e] = 0.0;
  }

  __kernel void F(__global double* a, int b, int c, int d, double e) {
    int f, g, h, i, j;

    int k = get_global_id(1);
    int l = get_global_id(0);
    if (k >= d || l >= c)
      return;
    int m;
    int n = k * c * (b + 1) + l * (b + 1);

    f = ((k + 128 / 2) % 128) - 128 / 2;
    g = f * f;
    h = ((l + 256 / 2) % 256) - 256 / 2;
    i = h * h + g;
    for (m = 0; m < b; m++) {
      j = ((m + 256 / 2) % 256) - 256 / 2;
      a[n + m] = exp(e * (double)(j * j + i));
    }
  }

  __kernel void G(__global dcomplex * a, __global const double* b, int c, int d, int e) {
    double f;
    int g;

    int h = get_global_id(0);
    if (h >= e)
      return;

    int i = h * d * (c + 1);

    f = b[h];
    for (g = 0; g < d; g++) {
      D(2 * 256, &f, 1220703125.0, (__global double*)&a[i + g * (c + 1) + 0]);
    }
  }

  __kernel void H(__global dcomplex * a, __global dcomplex * b, __global const double* c, int d, int e, int f) {
    int g = get_global_id(1);
    int h = get_global_id(0);
    if (g >= f || h >= e)
      return;

    int i = g * e * (d + 1) + h * (d + 1);
    for (int j = 0; j < d; j++) {
      int k = i + j;
      a[k] = (dcomplex) {(ak.rek(c(ak.imk(c
    b[k] = a[k];
      }
    }

    __kernel void I(__global dcomplex * a, __global dcomplex * b, __local dcomplex * c, int d, int e) {
      int f, g, h;
      int i = get_global_id(0) + 1;
      int j = get_local_id(0);

      if (i <= 1024) {
        f = i % 256;
        g = 3 * i % 256;
        h = 5 * i % 128;
        c[j] = a[h * e * (d + 1) + g * (d + 1) + f];
      } else {
        c[j] = (dcomplex){0.0, 0.0};
      }

      barrier(1);

      if (j == 0) {
        dcomplex k = c[0];
        for (i = 1; i < get_local_size(0); i++) {
      k = (dcomplex){(kli(c.real, (kgi(c.imag};
        }

        b[get_group_id(0)] = k;
      }
    }

    __kernel void J(__global dcomplex * a, __global dcomplex * b, __global dcomplex * c, int d, int e, int f, int g, int h, __global dcomplex* i, __global dcomplex* j) {
      int k, l, m;
      m = get_global_id(1);
      l = get_global_id(0);
      if (m >= g || l >= f)
        return;

      __global dcomplex* n = &i[m * f * e + l * e];
      __global dcomplex* o = &j[m * f * e + l * e];

      int p = m * f * (e + 1) + l * (e + 1);
      for (k = 0; k < e; k++) {
        n[k] = a[p + k];
      }

      B(d, h, e, c, n, o);

      for (k = 0; k < e; k++) {
        b[p + k] = n[k];
      }
    }

    __kernel void K(__global dcomplex * a, __global dcomplex * b, __global dcomplex * c, int d, int e, int f, int g, int h, __global dcomplex* i, __global dcomplex* j) {
      int k, l, m;
      m = get_global_id(1);
      k = get_global_id(0);
      if (m >= g || k >= e)
        return;

      __global dcomplex* n = &i[m * e * f + k * f];
      __global dcomplex* o = &j[m * e * f + k * f];

      int p = m * f * (e + 1) + k;
      for (l = 0; l < f; l++) {
        n[l] = a[p + l * (e + 1)];
      }

      B(d, h, f, c, n, o);

      for (l = 0; l < f; l++) {
        b[p + l * (e + 1)] = n[l];
      }
    }

    __kernel void L(__global dcomplex * a, __global dcomplex * b, __global dcomplex * c, int d, int e, int f, int g, int h, __global dcomplex* i, __global dcomplex* j) {
      int k, l, m;
      l = get_global_id(1);
      k = get_global_id(0);
      if (l >= f || k >= e)
        return;

      __global dcomplex* n = &i[l * e * g + k * g];
      __global dcomplex* o = &j[l * e * g + k * g];

      int p = l * (e + 1) + k;
      for (m = 0; m < g; m++) {
        n[m] = a[m * f * (e + 1) + p];
      }

      B(d, h, g, c, n, o);

      for (m = 0; m < g; m++) {
        b[m * f * (e + 1) + p] = n[m];
      }
    }
    void B(int a, int b, int c, __global dcomplex* d, __global dcomplex* e, __global dcomplex* f) {
      int g, h;
      for (h = 1; h <= b; h += 2) {
        C(a, h, b, c, d, e, f);
        if (h == b) {
          for (g = 0; g < c; g++) {
            e[g] = f[g];
          }
          return;
        }
        C(a, h + 1, b, c, d, f, e);
      }
    }

    void C(int a, int b, int c, int d, __global dcomplex* e, __global dcomplex* f, __global dcomplex* g) {
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

    void D(int a, double* b, double c, __global double d[]) {
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
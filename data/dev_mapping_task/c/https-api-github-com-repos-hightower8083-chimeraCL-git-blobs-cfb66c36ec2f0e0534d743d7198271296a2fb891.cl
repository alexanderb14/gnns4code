__kernel void A(__global double* a, __global double* b, uint c, __global double* d, __global double* e, __global double* f, uint g) {
  uint h = (uint)get_global_id(0);
  if (h < c) {
    double i = a[h];
    uint j;

    for (j = 0; j < g - 1; j++) {
      if (i > d[j] && i <= d[j + 1]) {
        break;
      }
    }

    double k = e[j] * f[j];
    double l = e[j + 1] * f[j];

    b[h] *= k * (d[j + 1] - a[h]) + l * (a[h] - d[j]);
  }
}

__kernel void B(__global double* a, __global double* b, __global double* c, __global double* d, __global double* e, __global double* f, __global double* g, uint h, uint i, uint j, uint k, uint l) {
  uint m = (uint)get_global_id(0);
  if (m < i) {
    uint n = h - 1;
    uint o = j * k * l;

    uint p = m / n;
    uint q = m - n * p;
    uint r = m * o;

    double s = f[q];
    double t = g[p];
    double u = e[m];

    double v = f[q + 1] - f[q];
    double w = g[p + 1] - g[p];
    double x = 1. / ((double)j);
    double y = 1. / ((double)k);
    double z = 2 * 3.14 / ((double)l);
    double aa, ab, ac, ad, ae, af;

    for (uint ag = 0; ag < l; ag++) {
      aa = u + ag * z;
      ac = sin(aa);
      ad = cos(aa);
      for (int ah = 0; ah < k; ah++) {
        ab = t + (0.5 + ah) * y * w;
        ae = ab * ac;
        af = ab * ad;
        for (int ai = 0; ai < j; ai++) {
          a[r] = s + (0.5 + ai) * x * v;
          b[r] = ae;
          c[r] = af;
          d[r] = ab;
          r += 1;
        }
      }
    }
  }
}

__kernel void C(__global double* a, __global double* b, __global double* c, __global uint* d, __constant uint* e, __global uint* f, __constant uint* g, __constant double* h, __constant double* i, __constant uint* j, __constant double* k, __constant double* l) {
  uint m = (uint)get_global_id(0);
  if (m < *e) {
    double n;
    int o, p;
    int q = (int)*g - 1;
    int r = (int)*j - 1;

    n = sqrt(b[m] * b[m] + c[m] * c[m]);

    o = (int)__clc_floor((a[m] - *h) * (*i));
    p = (int)__clc_floor((n - *k) * (*l));

    if (o > 0 && o < q - 1 && p < r - 1 && p >= 0) {
      f[m] = o + p * q;
      atom_add(&d[f[m]], 1U);
    } else {
      f[m] = r * q;
      atom_add(&d[f[m]], 1U);
    }
  }
}

__kernel void D(__global double* a, __global double* b, __global double* c, __global double* d, __global double* e, __global double* f, __global double* g, __constant double* h, __constant uint* i) {
  uint j = (uint)get_global_id(0);
  if (j < *i) {
    double k = (*h) * g[j];

    double l = d[j] * k;
    double m = e[j] * k;
    double n = f[j] * k;

    a[j] = a[j] + l;
    b[j] = b[j] + m;
    c[j] = c[j] + n;
  }
}

__kernel void E(__global double* a, __global double* b, __global uint* c, uint d) {
  uint e = (uint)get_global_id(0);
  double f;
  if (e < d) {
    f = a[c[e]];
    b[e] = f;
  }
}

__kernel void F(__global uint* a, __global uint* b, __global uint* c, __constant uint* d) {
  uint e = (uint)get_global_id(0);
  if (e < *d) {
    b[e] = a[c[e]];
  }
}

__kernel void G(__global uint* a, __global uint* b, __global uint* c, __global uint* d, uint e) {
  uint f = (uint)get_global_id(0);
  if (f < e) {
    uint g = b[f];
    uint h = atom_add(&c[g], 1U);
    uint i = a[g] + h;
    d[i] = f;
  }
}
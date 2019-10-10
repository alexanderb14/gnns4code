double A(double a) {
  int b = (int)(a);
  if (a - b < .5f)
    return b;
  else
    return b++;
}
double B(__global unsigned char* a, __global int* b, int c, int d) {
  double e = 0.0;
  int f;
  for (f = 0; f < c; f++)
    e += (__clc_pow((double)(a[b[d * c + f]] - 100), 2) - __clc_pow((double)(a[b[d * c + f]] - 228), 2)) / 50.0;
  return e;
}

void C(__global double* a, __global double* b, int c) {
  int d;
  a[0] = b[0];
  for (d = 1; d < c; d++) {
    a[d] = b[d] + a[d - 1];
  }
}

double D(__global int* a, int b) {
  int c = 2147483647;
  int d = 1103515245;
  int e = 12345;
  int f = d * a[b] + e;
  a[b] = f % c;
  return __clc_fabs(a[b] / ((double)c));
}
double E(__global int* a, int b) {
  double c = 3.14159265358979323846;
  double d = D(a, b);
  double e = D(a, b);
  double f = cos(2 * c * e);
  double g = -2 * log(d);
  return sqrt(g) * f;
}
double F(__global double* a, __global double* b, int c) {
  int d;
  double e = 0;
  for (d = 0; d < c; d++) {
    a[d] = a[d] * exp(b[d]);
    e += a[d];
  }
  return e;
}

int G(__global double* a, int b, int c, double d) {
  if (c < b)
    return -1;
  int e;
  while (c > b) {
    e = b + ((c - b) / 2);
    if (a[e] >= d) {
      if (e == 0)
        return e;
      else if (a[e - 1] < d)
        return e;
      else if (a[e - 1] == d) {
        while (a[e] == d && e >= 0)
          e--;
        e++;
        return e;
      }
    }
    if (a[e] > d)
      c = e - 1;
    else
      b = e + 1;
  }
  return -1;
}
__kernel void H(__global double* a, __global double* b, __global double* c, __global double* d, __global double* e, __global double* f, __global double* g, int h) {
  int i = get_global_id(0);

  if (i < h) {
    int j = -1;
    int k;

    for (k = 0; k < h; k++) {
      if (c[k] >= d[i]) {
        j = k;
        break;
      }
    }
    if (j == -1) {
      j = h - 1;
    }

    e[i] = a[j];
    f[i] = b[j];
  }
  barrier(2);
}
__kernel void I(__global double* a, int b, __global double* c, __global double* d, __global double* e, __global int* f) {
  int g = get_global_id(0);
  int h = get_local_id(0);
  __local double i;
  __local double j;

  if (0 == h)
    j = c[0];

  barrier(1);

  if (g < b) {
    a[g] = a[g] / j;
  }

  barrier(2);

  if (g == 0) {
    C(d, a, b);
    e[0] = (1 / ((double)(b))) * D(f, g);
  }

  barrier(2);

  if (0 == h)
    i = e[0];

  barrier(1);

  if (g < b) {
    e[g] = i + g / ((double)(b));
  }
}

__kernel void J(__global double* a, int b) {
  int c = get_global_id(0);
  size_t d = get_local_size(0);

  if (c == 0) {
    int e;
    double f = 0;
    int g = __clc_ceil((double)b / (double)d);
    for (e = 0; e < g; e++) {
      f += a[e];
    }
    a[0] = f;
  }
}
__kernel void K(__global double* a, __global double* b, __global double* c, __global double* d, __global double* e, __global int* f, __global int* g, __global double* h, __global unsigned char* i, __global double* j, __global double* k, const int l, const int m, const int n, int o, const int p, const int q, __global int* r, __global double* s, __local double* t) {
  int u = get_group_id(0);
  int v = get_local_id(0);
  int w = get_global_id(0);
  size_t x = get_local_size(0);
  int y;
  int z, aa;

  if (w < l) {
    a[w] = c[w];
    b[w] = d[w];

    k[w] = 1 / ((double)(l));

    a[w] = a[w] + 1.0 + 5.0 * E(r, w);
    b[w] = b[w] - 2.0 + 2.0 * E(r, w);
  }

  barrier(2);

  if (w < l) {
    for (y = 0; y < m; y++) {
      z = A(a[w]) + g[y * 2 + 1];
      aa = A(b[w]) + g[y * 2];

      f[w * m + y] = abs(z * p * q + aa * q + o);
      if (f[w * m + y] >= n)
        f[w * m + y] = 0;
    }
    h[w] = B(i, f, m, w);

    h[w] = h[w] / m;

    k[w] = k[w] * exp(h[w]);
  }

  t[v] = 0.0;

  barrier(1 | 2);

  if (w < l) {
    t[v] = k[w];
  }

  barrier(1);

  for (unsigned int ab = x / 2; ab > 0; ab >>= 1) {
    if (v < ab) {
      t[v] += t[v + ab];
    }
    barrier(1);
  }
  if (v == 0) {
    s[u] = t[0];
  }
}
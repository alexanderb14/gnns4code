typedef bool logical; __kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(__global int* a, __global int* b, int c, int d) {
  int e = get_global_id(0);
  int f = get_global_size(0);
  int g = (d + f - 1) / f;
  int h = e * g;
  int i = h + g;
  if (i > d)
    i = d;

  for (int j = h; j < i; j++) {
    for (int k = b[j]; k < b[j + 1]; k++) {
      a[k] = a[k] - c;
    }
  }
}

__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void B(__global double* a) {
  int b = 14000 + 1;
  int c = get_global_id(0);
  int d = get_global_size(0);
  int e = (b + d - 1) / d;
  int f = c * e;
  int g = f + e;
  if (g > b)
    g = b;

  for (int h = f; h < g; h++) {
    a[h] = 1.0;
  }
}

__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void C(__global double* a, __global double* b, __global double* c, __global double* d, int e) {
  int f = get_global_id(0);
  int g = get_global_size(0);
  int h = (e + g - 1) / g;
  int i = f * h;
  int j = i + h;
  if (j > e)
    j = e;

  for (int k = i; k < j; k++) {
    a[k] = 0.0;
    b[k] = 0.0;
    c[k] = 0;
    d[k] = 0;
  }
}

__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void D(__global double* a, __global double* b, __global double* c, __global double* d, __local double* e, __local double* f, int g) {
  int h = get_global_id(0);
  int i = get_global_size(0);
  int j = (g + i - 1) / i;
  int k = h * j;
  int l = k + j;
  if (l > g)
    l = g;

  double m = 0.0;
  double n = 0.0;
  for (int o = k; o < l; o++) {
    m = m + a[o] * b[o];
    n = n + b[o] * b[o];
  }
  c[h] = m;
  d[h] = n;
}

__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void E(__global double* a, __global double* b, double c, int d) {
  int e = get_global_id(0);
  int f = get_global_size(0);
  int g = (d + f - 1) / f;
  int h = e * g;
  int i = h + g;
  if (i > d)
    i = d;

  for (int j = h; j < i; j++) {
    a[j] = c * b[j];
  }
}
__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void F(__global double* a, __global double* b, __global double* c, __global double* d, __global double* e) {
  int f = 14000 + 1;
  int g = get_global_id(0);
  int h = get_global_size(0);
  int i = (f + h - 1) / h;
  int j = g * i;
  int k = j + i;
  if (k > f)
    k = f;

  for (int l = j; l < k; l++) {
    a[l] = 0.0;
    b[l] = 0.0;
    double m = d[l];
    c[l] = m;
    e[l] = m;
  }
}

__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void G(__global double* a, __global double* b, int c) {
  int d = get_global_id(0);
  int e = get_global_size(0);
  int f = (c + e - 1) / e;
  int g = d * f;
  int h = g + f;
  if (h > c)
    h = c;

  double i = 0.0;
  for (int j = g; j < h; j++) {
    i = i + a[j] * a[j];
  }
  b[d] = i;
}

__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void H(__global int* a, __global double* b, __global double* c, __global int* d, __global double* e, int f) {
  int g = get_global_id(0);
  int h = get_global_size(0);
  int i = (f + h - 1) / h;
  int j = g * i;
  int k = j + i;
  if (k > f)
    k = f;

  for (int l = j; l < k; l++) {
    double m = 0.0;
    for (int n = a[l]; n < a[l + 1]; n++) {
      m = m + b[n] * c[d[n]];
    }
    e[l] = m;
  }
}

__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void I(__global double* a, __global double* b, __global double* c, int d) {
  int e = get_global_id(0);
  int f = get_global_size(0);
  int g = (d + f - 1) / f;
  int h = e * g;
  int i = h + g;
  if (i > d)
    i = d;

  double j = 0.0;
  for (int k = h; k < i; k++) {
    j = j + a[k] * b[k];
  }
  c[e] = j;
}

__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void J(__global double* a, __global double* b, __global double* c, __global double* d, __global double* e, double f, int g) {
  int h = get_global_id(0);
  int i = get_global_size(0);
  int j = (g + i - 1) / i;
  int k = h * j;
  int l = k + j;
  if (l > g)
    l = g;

  double m = 0.0;
  for (int n = k; n < l; n++) {
    d[n] = d[n] + f * a[n];
    c[n] = c[n] - f * b[n];

    m = m + c[n] * c[n];
  }
  e[h] = m;
}

__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void K(__global double* a, __global double* b, const double c, int d) {
  int e = get_global_id(0);
  int f = get_global_size(0);
  int g = (d + f - 1) / f;
  int h = e * g;
  int i = h + g;
  if (i > d)
    i = d;

  for (int j = h; j < i; j++) {
    a[j] = b[j] + c * a[j];
  }
}

__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void L(__global int* a, __global double* b, __global double* c, __global int* d, __global double* e, int f) {
  int g = get_global_id(0);
  int h = get_global_size(0);
  int i = (f + h - 1) / h;
  int j = g * i;
  int k = j + i;
  if (k > f)
    k = f;

  for (int l = j; l < k; l++) {
    double m = 0.0;
    for (int n = a[l]; n < a[l + 1]; n++) {
      m = m + b[n] * c[d[n]];
    }
    e[l] = m;
  }
}

__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void M(__global double* a, __global double* b, __global double* c, int d) {
  int e = get_global_id(0);
  int f = get_global_size(0);
  int g = (d + f - 1) / f;
  int h = e * g;
  int i = h + g;
  if (i > d)
    i = d;

  double j = 0.0;
  for (int k = h; k < i; k++) {
    double l = a[k] - b[k];
    j = j + l * l;
  }
  c[e] = j;
}
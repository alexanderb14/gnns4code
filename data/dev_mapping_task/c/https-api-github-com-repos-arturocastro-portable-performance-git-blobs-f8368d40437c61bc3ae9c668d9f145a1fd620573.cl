__kernel void A(double a, double b, double c, double d, __global double* e, __global double* f) {
  int g = get_global_id(0);
  int h = get_global_id(1);

  f[h * (64 + 1) + g] = a * sin((h + 0.5) * b) * sin((g + 0.5) * c);
  e[h * (64 + 1) + g] = d * (cos(2.0 * h * b) + cos(2.0 * g * c)) + 50000.0;
}

__kernel void B(double a, double b, __global double* c, __global double* d, __global double* e) {
  int f = get_global_id(0);
  int g = get_global_id(1);

  if (f < 64 && g < 64) {
    c[(g + 1) * (64 + 1) + f] = -(e[(g + 1) * (64 + 1) + f + 1] - e[(g + 1) * (64 + 1) + f]) / b;
    d[g * (64 + 1) + f + 1] = (e[(g + 1) * (64 + 1) + f + 1] - e[g * (64 + 1) + f + 1]) / a;
  }
}

__kernel void C(__global double* a, __global double* b, __global double* c, __global double* d, __global double* e, __global double* f) {
  int g = get_global_id(0);
  int h = get_global_id(1);

  if (g < 64) {
    a[(0) * (64 + 1) + (g)] = a[(64) * (64 + 1) + (g)];
    b[(64) * (64 + 1) + (g + 1)] = b[(0) * (64 + 1) + (g + 1)];
  }

  if (h < 64) {
    a[(h + 1) * (64 + 1) + (64)] = a[(h + 1) * (64 + 1) + (0)];
    b[(h) * (64 + 1) + (0)] = b[(h) * (64 + 1) + (64)];
  }

  a[(0) * (64 + 1) + (64)] = a[(64) * (64 + 1) + (0)];
  b[(64) * (64 + 1) + (0)] = b[(0) * (64 + 1) + (64)];

  d[(h) * (64 + 1) + (g)] = a[(h) * (64 + 1) + (g)];
  e[(h) * (64 + 1) + (g)] = b[(h) * (64 + 1) + (g)];
  f[(h) * (64 + 1) + (g)] = c[(h) * (64 + 1) + (g)];
}

__kernel void D(double a, double b, __global double* c, __global double* d, __global double* e, __global double* f, __global double* g, __global double* h, __global double* i) {
  int j = get_global_id(0);
  int k = get_global_id(1);

  if (j < 64 && k < 64) {
    f[(k + 1) * (64 + 1) + (j)] = .5 * (e[(k + 1) * (64 + 1) + (j)] + e[(k) * (64 + 1) + (j)]) * c[(k + 1) * (64 + 1) + (j)];
    g[(k) * (64 + 1) + (j + 1)] = .5 * (e[(k) * (64 + 1) + (j + 1)] + e[(k) * (64 + 1) + (j)]) * d[(k) * (64 + 1) + (j + 1)];
    h[(k + 1) * (64 + 1) + (j + 1)] = (a * (d[(k + 1) * (64 + 1) + (j + 1)] - d[(k) * (64 + 1) + (j + 1)]) - b * (c[(k + 1) * (64 + 1) + (j + 1)] - c[(k + 1) * (64 + 1) + (j)])) / (e[(k) * (64 + 1) + (j)] + e[(k + 1) * (64 + 1) + (j)] + e[(k + 1) * (64 + 1) + (j + 1)] + e[(k) * (64 + 1) + (j + 1)]);
    i[(k) * (64 + 1) + (j)] = e[(k) * (64 + 1) + (j)] + .25 * (c[(k + 1) * (64 + 1) + (j)] * c[(k + 1) * (64 + 1) + (j)] + c[(k) * (64 + 1) + (j)] * c[(k) * (64 + 1) + (j)] + d[(k) * (64 + 1) + (j + 1)] * d[(k) * (64 + 1) + (j + 1)] + d[(k) * (64 + 1) + (j)] * d[(k) * (64 + 1) + (j)]);
  }
}

__kernel void E(__global double* a, __global double* b, __global double* c, __global double* d) {
  int e = get_global_id(0);
  int f = get_global_id(1);

  a[(0) * (64 + 1) + (64)] = a[(64) * (64 + 1) + (0)];
  b[(64) * (64 + 1) + (0)] = b[(0) * (64 + 1) + (64)];
  c[(0) * (64 + 1) + (0)] = c[(64) * (64 + 1) + (64)];
  d[(64) * (64 + 1) + (64)] = d[(0) * (64 + 1) + (0)];

  if (e < 64) {
    a[(0) * (64 + 1) + (e)] = a[(64) * (64 + 1) + (e)];
    b[(64) * (64 + 1) + (e + 1)] = b[(0) * (64 + 1) + (e + 1)];
    c[(0) * (64 + 1) + (e + 1)] = c[(64) * (64 + 1) + (e + 1)];
    d[(64) * (64 + 1) + (e)] = d[(0) * (64 + 1) + (e)];
  }

  if (f < 64) {
    a[(f + 1) * (64 + 1) + (64)] = a[(f + 1) * (64 + 1) + (0)];
    b[(f) * (64 + 1) + (0)] = b[(f) * (64 + 1) + (64)];
    c[(f + 1) * (64 + 1) + (0)] = c[(f + 1) * (64 + 1) + (64)];
    d[(f) * (64 + 1) + (64)] = d[(f) * (64 + 1) + (0)];
  }
}

__kernel void F(double a, double b, double c, __global double* d, __global double* e, __global double* f, __global double* g, __global double* h, __global double* i, __global double* j, __global double* k, __global double* l, __global double* m) {
  int n = get_global_id(0);
  int o = get_global_id(1);

  if (o < 64 && n < 64) {
    g[(o + 1) * (64 + 1) + (n)] = d[(o + 1) * (64 + 1) + (n)] + a * (l[(o + 1) * (64 + 1) + (n + 1)] + l[(o + 1) * (64 + 1) + (n)]) * (k[(o + 1) * (64 + 1) + (n + 1)] + k[(o) * (64 + 1) + (n + 1)] + k[(o) * (64 + 1) + (n)] + k[(o + 1) * (64 + 1) + (n)]) - b * (m[(o + 1) * (64 + 1) + (n)] - m[(o) * (64 + 1) + (n)]);
    h[(o) * (64 + 1) + (n + 1)] = e[(o) * (64 + 1) + (n + 1)] - a * (l[(o + 1) * (64 + 1) + (n + 1)] + l[(o) * (64 + 1) + (n + 1)]) * (j[(o + 1) * (64 + 1) + (n + 1)] + j[(o) * (64 + 1) + (n + 1)] + j[(o) * (64 + 1) + (n)] + j[(o + 1) * (64 + 1) + (n)]) - c * (m[(o) * (64 + 1) + (n + 1)] - m[(o) * (64 + 1) + (n)]);
    i[(o) * (64 + 1) + (n)] = f[(o) * (64 + 1) + (n)] - b * (j[(o + 1) * (64 + 1) + (n)] - j[(o) * (64 + 1) + (n)]) - c * (k[(o) * (64 + 1) + (n + 1)] - k[(o) * (64 + 1) + (n)]);
  }
}

__kernel void G(__global double* a, __global double* b, __global double* c) {
  int d = get_global_id(0);
  int e = get_global_id(1);

  if (d < 64) {
    a[(0) * (64 + 1) + (d)] = a[(64) * (64 + 1) + (d)];
    b[(64) * (64 + 1) + (d + 1)] = b[(0) * (64 + 1) + (d + 1)];
    c[(64) * (64 + 1) + (d)] = c[(0) * (64 + 1) + (d)];
  }

  if (e < 64) {
    a[(e + 1) * (64 + 1) + (64)] = a[(e + 1) * (64 + 1) + (0)];
    b[(e) * (64 + 1) + (0)] = b[(e) * (64 + 1) + (64)];
    c[(e) * (64 + 1) + (64)] = c[(e) * (64 + 1) + (0)];
  }

  a[(0) * (64 + 1) + (64)] = a[(64) * (64 + 1) + (0)];
  b[(64) * (64 + 1) + (0)] = b[(0) * (64 + 1) + (64)];
  c[(64) * (64 + 1) + (64)] = c[(0) * (64 + 1) + (0)];
}

__kernel void H(double a, __global double* b, __global double* c, __global double* d, __global double* e, __global double* f, __global double* g, __global double* h, __global double* i, __global double* j) {
  int k = get_global_id(0);
  int l = get_global_id(1);

  e[(l) * (64 + 1) + (k)] = b[(l) * (64 + 1) + (k)] + a * (h[(l) * (64 + 1) + (k)] - 2. * b[(l) * (64 + 1) + (k)] + e[(l) * (64 + 1) + (k)]);
  f[(l) * (64 + 1) + (k)] = c[(l) * (64 + 1) + (k)] + a * (i[(l) * (64 + 1) + (k)] - 2. * c[(l) * (64 + 1) + (k)] + f[(l) * (64 + 1) + (k)]);
  g[(l) * (64 + 1) + (k)] = d[(l) * (64 + 1) + (k)] + a * (j[(l) * (64 + 1) + (k)] - 2. * d[(l) * (64 + 1) + (k)] + g[(l) * (64 + 1) + (k)]);

  b[(l) * (64 + 1) + (k)] = h[(l) * (64 + 1) + (k)];
  c[(l) * (64 + 1) + (k)] = i[(l) * (64 + 1) + (k)];
  d[(l) * (64 + 1) + (k)] = j[(l) * (64 + 1) + (k)];
}

__kernel void I(__global double* a, __global double* b, __global double* c, __global double* d, __global double* e, __global double* f, __global double* g, __global double* h, __global double* i) {
  int j = get_global_id(0);
  int k = get_global_id(1);

  d[(k) * (64 + 1) + (j)] = a[(k) * (64 + 1) + (j)];
  e[(k) * (64 + 1) + (j)] = b[(k) * (64 + 1) + (j)];
  f[(k) * (64 + 1) + (j)] = c[(k) * (64 + 1) + (j)];

  a[(k) * (64 + 1) + (j)] = g[(k) * (64 + 1) + (j)];
  b[(k) * (64 + 1) + (j)] = h[(k) * (64 + 1) + (j)];
  c[(k) * (64 + 1) + (j)] = i[(k) * (64 + 1) + (j)];
}
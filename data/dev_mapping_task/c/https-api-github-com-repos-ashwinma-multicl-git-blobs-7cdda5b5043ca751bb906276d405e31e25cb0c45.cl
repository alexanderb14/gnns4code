double A(int a, int b, int c, int d, __global double* e) {
  double f, g, h;
  double i;

  __global double(*j)[13] = (__global double(*)[13])e;

  f = ((double)a) / (64 - 1);
  g = ((double)b) / (64 - 1);
  h = ((double)c) / (64 - 1);

  i = j[d][0] + (j[d][1] + (j[d][4] + (j[d][7] + j[d][10] * f) * f) * f) * f + (j[d][2] + (j[d][5] + (j[d][8] + j[d][11] * g) * g) * g) * g + (j[d][3] + (j[d][6] + (j[d][9] + j[d][12] * h) * h) * h) * h;
  return i;
}

void B(int a, int b, int c, double d[], __global double* e) {
  int f;
  double g, h, i;

  __global double(*j)[13] = (__global double(*)[13])e;

  g = ((double)a) / (64 - 1);
  h = ((double)b) / (64 - 1);
  i = ((double)c) / (64 - 1);

  for (f = 0; f < 5; f++) {
    d[f] = j[f][0] + (j[f][1] + (j[f][4] + (j[f][7] + j[f][10] * g) * g) * g) * g + (j[f][2] + (j[f][5] + (j[f][8] + j[f][11] * h) * h) * h) * h + (j[f][3] + (j[f][6] + (j[f][9] + j[f][12] * i) * i) * i) * i;
  }
}

__kernel void C(__global double* a, __global double* b, int c, int d, int e) {
  int f, g, h;
  double i[5], j[5];

  g = get_global_id(1);
  f = get_global_id(0);
  if (g >= d || f >= c)
    return;

  __global double(*k)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5] = (__global double(*)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5])a;

  B(f, g, 0, i, b);
  B(f, g, e - 1, j, b);
  for (h = 0; h < 5; h++) {
    k[0][g][f][h] = i[h];
    k[e - 1][g][f][h] = j[h];
  }
}

__kernel void D(__global double* a, __global double* b, int c, int d, int e) {
  int f, g, h;

  g = get_global_id(2);
  f = get_global_id(1);
  h = get_global_id(0);
  if (g >= e || f >= c)
    return;

  __global double(*i)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5] = (__global double(*)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5])a;

  i[g][0][f][h] = A(f, 0, g, h, b);
  i[g][d - 1][f][h] = A(f, d - 1, g, h, b);
}

__kernel void E(__global double* a, __global double* b, int c, int d, int e) {
  int f, g, h;

  g = get_global_id(2);
  f = get_global_id(1);
  h = get_global_id(0);
  if (g >= e || f >= d)
    return;

  __global double(*i)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5] = (__global double(*)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5])a;

  i[g][f][0][h] = A(0, f, g, h, b);
  i[g][f][c - 1][h] = A(c - 1, f, g, h, b);
}

__kernel void F(__global double* a, __global double* b, int c, int d, int e) {
  int f, g, h, i;
  double j, k, l;
  double m, n, o;
  double p[5], q[5], r[5];
  double s[5], t[5], u[5];

  h = get_global_id(2) + 1;
  g = get_global_id(1) + 1;
  f = get_global_id(0) + 1;
  if (h >= (e - 1) || g >= (d - 1) || f >= (c - 1))
    return;

  __global double(*v)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5] = (__global double(*)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5])a;

  l = ((double)h) / (e - 1);
  k = ((double)g) / (64 - 1);
  j = ((double)f) / (64 - 1);
  B(0, g, h, p, b);
  B(64 - 1, g, h, q, b);
  B(f, 0, h, r, b);
  B(f, 64 - 1, h, s, b);
  B(f, g, 0, t, b);
  B(f, g, e - 1, u, b);

  for (i = 0; i < 5; i++) {
    m = (1.0 - j) * p[i] + j * q[i];
    n = (1.0 - k) * r[i] + k * s[i];
    o = (1.0 - l) * t[i] + l * u[i];

    v[h][g][f][i] = m + n + o - m * n - n * o - o * m + m * n * o;
  }
}

__kernel void G(__global double* a, __global double* b, __global double* c, int d, int e, int f) {
  int g, h, i, j;
  double k, l, m;

  i = get_global_id(2);
  h = get_global_id(1);
  g = get_global_id(0);
  if (i >= f || h >= e || g >= d)
    return;

  __global double(*n)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5] = (__global double(*)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5])a;
  __global double(*o)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5] = (__global double(*)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5])b;
  __global double(*p)[13] = (__global double(*)[13])c;

  m = ((double)i) / (f - 1);
  l = ((double)h) / (64 - 1);
  k = ((double)g) / (64 - 1);
  for (j = 0; j < 5; j++) {
    n[i][h][g][j] = 0.0;

    o[i][h][g][j] = p[j][0] + (p[j][1] + (p[j][4] + (p[j][7] + p[j][10] * k) * k) * k) * k + (p[j][2] + (p[j][5] + (p[j][8] + p[j][11] * l) * l) * l) * l + (p[j][3] + (p[j][6] + (p[j][9] + p[j][12] * m) * m) * m) * m;
  }
}

__kernel void H(__global double* a, __global double* b, __global double* c, int d, int e, int f) {
  int g, h, i, j;
  double k;
  double l;
  double m;
  double n, o, p, q;
  double r, s, t, u;

  i = get_global_id(1) + 1;
  h = get_global_id(0) + 1;
  if (i >= (f - 1) || h >= (e - 1))
    return;

  __global double(*v)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5] = (__global double(*)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5])a;
  __global double(*w)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5] = (__global double(*)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5])b;

  int x = (i - 1) * 64 + (h - 1);
  int y = x * 64 * 5;
  __global double(*z)[5] = (__global double(*)[5]) & c[y];

  for (g = 0; g < d; g++) {
    z[g][0] = v[i][h][g][1];
    l = v[i][h][g][1] / v[i][h][g][0];
    k = 0.50 * (v[i][h][g][1] * v[i][h][g][1] + v[i][h][g][2] * v[i][h][g][2] + v[i][h][g][3] * v[i][h][g][3]) / v[i][h][g][0];
    z[g][1] = v[i][h][g][1] * l + 0.40e+00 * (v[i][h][g][4] - k);
    z[g][2] = v[i][h][g][2] * l;
    z[g][3] = v[i][h][g][3] * l;
    z[g][4] = (1.40e+00 * v[i][h][g][4] - 0.40e+00 * k) * l;
  }

  for (g = 1; g < (d - 1); g++) {
    for (j = 0; j < 5; j++) {
      w[i][h][g][j] = w[i][h][g][j] - (1.0 / (2.0 * (1.0 / (64 - 1)))) * (z[g + 1][j] - z[g - 1][j]);
    }
  }
  for (g = 1; g < d; g++) {
    m = 1.0 / v[i][h][g][0];

    n = m * v[i][h][g][1];
    o = m * v[i][h][g][2];
    p = m * v[i][h][g][3];
    q = m * v[i][h][g][4];

    m = 1.0 / v[i][h][g - 1][0];

    r = m * v[i][h][g - 1][1];
    s = m * v[i][h][g - 1][2];
    t = m * v[i][h][g - 1][3];
    u = m * v[i][h][g - 1][4];

    z[g][1] = (4.0 / 3.0) * (1.0 / (1.0 / (64 - 1))) * (n - r);
    z[g][2] = (1.0 / (1.0 / (64 - 1))) * (o - s);
    z[g][3] = (1.0 / (1.0 / (64 - 1))) * (p - t);
    z[g][4] = 0.50 * (1.0 - 1.40e+00 * 1.40e+00) * (1.0 / (1.0 / (64 - 1))) * ((n * n + o * o + p * p) - (r * r + s * s + t * t)) + (1.0 / 6.0) * (1.0 / (1.0 / (64 - 1))) * (n * n - r * r) + 1.40e+00 * 1.40e+00 * (1.0 / (1.0 / (64 - 1))) * (q - u);
  }

  for (g = 1; g < (d - 1); g++) {
    w[i][h][g][0] = w[i][h][g][0] + 0.75 * (1.0 / ((1.0 / (64 - 1)) * (1.0 / (64 - 1)))) * (v[i][h][g - 1][0] - 2.0 * v[i][h][g][0] + v[i][h][g + 1][0]);
    w[i][h][g][1] = w[i][h][g][1] + (1.0 / (1.0 / (64 - 1))) * 1.00e-01 * 1.00e+00 * (z[g + 1][1] - z[g][1]) + 0.75 * (1.0 / ((1.0 / (64 - 1)) * (1.0 / (64 - 1)))) * (v[i][h][g - 1][1] - 2.0 * v[i][h][g][1] + v[i][h][g + 1][1]);
    w[i][h][g][2] = w[i][h][g][2] + (1.0 / (1.0 / (64 - 1))) * 1.00e-01 * 1.00e+00 * (z[g + 1][2] - z[g][2]) + 0.75 * (1.0 / ((1.0 / (64 - 1)) * (1.0 / (64 - 1)))) * (v[i][h][g - 1][2] - 2.0 * v[i][h][g][2] + v[i][h][g + 1][2]);
    w[i][h][g][3] = w[i][h][g][3] + (1.0 / (1.0 / (64 - 1))) * 1.00e-01 * 1.00e+00 * (z[g + 1][3] - z[g][3]) + 0.75 * (1.0 / ((1.0 / (64 - 1)) * (1.0 / (64 - 1)))) * (v[i][h][g - 1][3] - 2.0 * v[i][h][g][3] + v[i][h][g + 1][3]);
    w[i][h][g][4] = w[i][h][g][4] + (1.0 / (1.0 / (64 - 1))) * 1.00e-01 * 1.00e+00 * (z[g + 1][4] - z[g][4]) + 0.75 * (1.0 / ((1.0 / (64 - 1)) * (1.0 / (64 - 1)))) * (v[i][h][g - 1][4] - 2.0 * v[i][h][g][4] + v[i][h][g + 1][4]);
  }

  for (j = 0; j < 5; j++) {
    w[i][h][1][j] = w[i][h][1][j] - ((max(max(0.75, 0.75), 1.00)) / 4.0) * (+5.0 * v[i][h][1][j] - 4.0 * v[i][h][2][j] + v[i][h][3][j]);
    w[i][h][2][j] = w[i][h][2][j] - ((max(max(0.75, 0.75), 1.00)) / 4.0) * (-4.0 * v[i][h][1][j] + 6.0 * v[i][h][2][j] - 4.0 * v[i][h][3][j] + v[i][h][4][j]);
  }

  for (g = 3; g < d - 3; g++) {
    for (j = 0; j < 5; j++) {
      w[i][h][g][j] = w[i][h][g][j] - ((max(max(0.75, 0.75), 1.00)) / 4.0) * (v[i][h][g - 2][j] - 4.0 * v[i][h][g - 1][j] + 6.0 * v[i][h][g][j] - 4.0 * v[i][h][g + 1][j] + v[i][h][g + 2][j]);
    }
  }

  for (j = 0; j < 5; j++) {
    w[i][h][d - 3][j] = w[i][h][d - 3][j] - ((max(max(0.75, 0.75), 1.00)) / 4.0) * (v[i][h][d - 5][j] - 4.0 * v[i][h][d - 4][j] + 6.0 * v[i][h][d - 3][j] - 4.0 * v[i][h][d - 2][j]);
    w[i][h][d - 2][j] = w[i][h][d - 2][j] - ((max(max(0.75, 0.75), 1.00)) / 4.0) * (v[i][h][d - 4][j] - 4.0 * v[i][h][d - 3][j] + 5.0 * v[i][h][d - 2][j]);
  }
}

__kernel void I(__global double* a, __global double* b, __global double* c, int d, int e, int f) {
  int g, h, i, j;
  double k;
  double l;
  double m;
  double n, o, p, q;
  double r, s, t, u;

  i = get_global_id(1) + 1;
  g = get_global_id(0) + 1;
  if (i >= (f - 1) || g >= (d - 1))
    return;

  __global double(*v)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5] = (__global double(*)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5])a;
  __global double(*w)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5] = (__global double(*)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5])b;

  int x = (i - 1) * 64 + (g - 1);
  int y = x * 64 * 5;
  __global double(*z)[5] = (__global double(*)[5]) & c[y];

  for (h = 0; h < e; h++) {
    z[h][0] = v[i][h][g][2];
    l = v[i][h][g][2] / v[i][h][g][0];
    k = 0.50 * (v[i][h][g][1] * v[i][h][g][1] + v[i][h][g][2] * v[i][h][g][2] + v[i][h][g][3] * v[i][h][g][3]) / v[i][h][g][0];
    z[h][1] = v[i][h][g][1] * l;
    z[h][2] = v[i][h][g][2] * l + 0.40e+00 * (v[i][h][g][4] - k);
    z[h][3] = v[i][h][g][3] * l;
    z[h][4] = (1.40e+00 * v[i][h][g][4] - 0.40e+00 * k) * l;
  }

  for (h = 1; h < (e - 1); h++) {
    for (j = 0; j < 5; j++) {
      w[i][h][g][j] = w[i][h][g][j] - (1.0 / (2.0 * (1.0 / (64 - 1)))) * (z[h + 1][j] - z[h - 1][j]);
    }
  }

  for (h = 1; h < e; h++) {
    m = 1.0 / v[i][h][g][0];

    n = m * v[i][h][g][1];
    o = m * v[i][h][g][2];
    p = m * v[i][h][g][3];
    q = m * v[i][h][g][4];

    m = 1.0 / v[i][h - 1][g][0];

    r = m * v[i][h - 1][g][1];
    s = m * v[i][h - 1][g][2];
    t = m * v[i][h - 1][g][3];
    u = m * v[i][h - 1][g][4];

    z[h][1] = (1.0 / (1.0 / (64 - 1))) * (n - r);
    z[h][2] = (4.0 / 3.0) * (1.0 / (1.0 / (64 - 1))) * (o - s);
    z[h][3] = (1.0 / (1.0 / (64 - 1))) * (p - t);
    z[h][4] = 0.50 * (1.0 - 1.40e+00 * 1.40e+00) * (1.0 / (1.0 / (64 - 1))) * ((n * n + o * o + p * p) - (r * r + s * s + t * t)) + (1.0 / 6.0) * (1.0 / (1.0 / (64 - 1))) * (o * o - s * s) + 1.40e+00 * 1.40e+00 * (1.0 / (1.0 / (64 - 1))) * (q - u);
  }

  for (h = 1; h < (e - 1); h++) {
    w[i][h][g][0] = w[i][h][g][0] + 0.75 * (1.0 / ((1.0 / (64 - 1)) * (1.0 / (64 - 1)))) * (v[i][h - 1][g][0] - 2.0 * v[i][h][g][0] + v[i][h + 1][g][0]);
    w[i][h][g][1] = w[i][h][g][1] + (1.0 / (1.0 / (64 - 1))) * 1.00e-01 * 1.00e+00 * (z[h + 1][1] - z[h][1]) + 0.75 * (1.0 / ((1.0 / (64 - 1)) * (1.0 / (64 - 1)))) * (v[i][h - 1][g][1] - 2.0 * v[i][h][g][1] + v[i][h + 1][g][1]);
    w[i][h][g][2] = w[i][h][g][2] + (1.0 / (1.0 / (64 - 1))) * 1.00e-01 * 1.00e+00 * (z[h + 1][2] - z[h][2]) + 0.75 * (1.0 / ((1.0 / (64 - 1)) * (1.0 / (64 - 1)))) * (v[i][h - 1][g][2] - 2.0 * v[i][h][g][2] + v[i][h + 1][g][2]);
    w[i][h][g][3] = w[i][h][g][3] + (1.0 / (1.0 / (64 - 1))) * 1.00e-01 * 1.00e+00 * (z[h + 1][3] - z[h][3]) + 0.75 * (1.0 / ((1.0 / (64 - 1)) * (1.0 / (64 - 1)))) * (v[i][h - 1][g][3] - 2.0 * v[i][h][g][3] + v[i][h + 1][g][3]);
    w[i][h][g][4] = w[i][h][g][4] + (1.0 / (1.0 / (64 - 1))) * 1.00e-01 * 1.00e+00 * (z[h + 1][4] - z[h][4]) + 0.75 * (1.0 / ((1.0 / (64 - 1)) * (1.0 / (64 - 1)))) * (v[i][h - 1][g][4] - 2.0 * v[i][h][g][4] + v[i][h + 1][g][4]);
  }

  for (j = 0; j < 5; j++) {
    w[i][1][g][j] = w[i][1][g][j] - ((max(max(0.75, 0.75), 1.00)) / 4.0) * (+5.0 * v[i][1][g][j] - 4.0 * v[i][2][g][j] + v[i][3][g][j]);
    w[i][2][g][j] = w[i][2][g][j] - ((max(max(0.75, 0.75), 1.00)) / 4.0) * (-4.0 * v[i][1][g][j] + 6.0 * v[i][2][g][j] - 4.0 * v[i][3][g][j] + v[i][4][g][j]);
  }

  for (h = 3; h < e - 3; h++) {
    for (j = 0; j < 5; j++) {
      w[i][h][g][j] = w[i][h][g][j] - ((max(max(0.75, 0.75), 1.00)) / 4.0) * (v[i][h - 2][g][j] - 4.0 * v[i][h - 1][g][j] + 6.0 * v[i][h][g][j] - 4.0 * v[i][h + 1][g][j] + v[i][h + 2][g][j]);
    }
  }

  for (j = 0; j < 5; j++) {
    w[i][e - 3][g][j] = w[i][e - 3][g][j] - ((max(max(0.75, 0.75), 1.00)) / 4.0) * (v[i][e - 5][g][j] - 4.0 * v[i][e - 4][g][j] + 6.0 * v[i][e - 3][g][j] - 4.0 * v[i][e - 2][g][j]);
    w[i][e - 2][g][j] = w[i][e - 2][g][j] - ((max(max(0.75, 0.75), 1.00)) / 4.0) * (v[i][e - 4][g][j] - 4.0 * v[i][e - 3][g][j] + 5.0 * v[i][e - 2][g][j]);
  }
}

__kernel void J(__global double* a, __global double* b, __global double* c, int d, int e, int f) {
  int g, h, i, j;
  double k;
  double l;
  double m;
  double n, o, p, q;
  double r, s, t, u;

  h = get_global_id(1) + 1;
  g = get_global_id(0) + 1;
  if (h >= (e - 1) || g >= (d - 1))
    return;

  __global double(*v)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5] = (__global double(*)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5])a;
  __global double(*w)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5] = (__global double(*)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5])b;

  int x = (h - 1) * 64 + (g - 1);
  int y = x * 64 * 5;
  __global double(*z)[5] = (__global double(*)[5]) & c[y];

  for (i = 0; i < f; i++) {
    z[i][0] = v[i][h][g][3];
    l = v[i][h][g][3] / v[i][h][g][0];
    k = 0.50 * (v[i][h][g][1] * v[i][h][g][1] + v[i][h][g][2] * v[i][h][g][2] + v[i][h][g][3] * v[i][h][g][3]) / v[i][h][g][0];
    z[i][1] = v[i][h][g][1] * l;
    z[i][2] = v[i][h][g][2] * l;
    z[i][3] = v[i][h][g][3] * l + 0.40e+00 * (v[i][h][g][4] - k);
    z[i][4] = (1.40e+00 * v[i][h][g][4] - 0.40e+00 * k) * l;
  }

  for (i = 1; i < f - 1; i++) {
    for (j = 0; j < 5; j++) {
      w[i][h][g][j] = w[i][h][g][j] - (1.0 / (2.0 * (1.0 / (64 - 1)))) * (z[i + 1][j] - z[i - 1][j]);
    }
  }

  for (i = 1; i < f; i++) {
    m = 1.0 / v[i][h][g][0];

    n = m * v[i][h][g][1];
    o = m * v[i][h][g][2];
    p = m * v[i][h][g][3];
    q = m * v[i][h][g][4];

    m = 1.0 / v[i - 1][h][g][0];

    r = m * v[i - 1][h][g][1];
    s = m * v[i - 1][h][g][2];
    t = m * v[i - 1][h][g][3];
    u = m * v[i - 1][h][g][4];

    z[i][1] = (1.0 / (1.0 / (64 - 1))) * (n - r);
    z[i][2] = (1.0 / (1.0 / (64 - 1))) * (o - s);
    z[i][3] = (4.0 / 3.0) * (1.0 / (1.0 / (64 - 1))) * (p - t);
    z[i][4] = 0.50 * (1.0 - 1.40e+00 * 1.40e+00) * (1.0 / (1.0 / (64 - 1))) * ((n * n + o * o + p * p) - (r * r + s * s + t * t)) + (1.0 / 6.0) * (1.0 / (1.0 / (64 - 1))) * (p * p - t * t) + 1.40e+00 * 1.40e+00 * (1.0 / (1.0 / (64 - 1))) * (q - u);
  }

  for (i = 1; i < f - 1; i++) {
    w[i][h][g][0] = w[i][h][g][0] + 1.00 * (1.0 / ((1.0 / (64 - 1)) * (1.0 / (64 - 1)))) * (v[i + 1][h][g][0] - 2.0 * v[i][h][g][0] + v[i - 1][h][g][0]);
    w[i][h][g][1] = w[i][h][g][1] + (1.0 / (1.0 / (64 - 1))) * 1.00e-01 * 1.00e+00 * (z[i + 1][1] - z[i][1]) + 1.00 * (1.0 / ((1.0 / (64 - 1)) * (1.0 / (64 - 1)))) * (v[i + 1][h][g][1] - 2.0 * v[i][h][g][1] + v[i - 1][h][g][1]);
    w[i][h][g][2] = w[i][h][g][2] + (1.0 / (1.0 / (64 - 1))) * 1.00e-01 * 1.00e+00 * (z[i + 1][2] - z[i][2]) + 1.00 * (1.0 / ((1.0 / (64 - 1)) * (1.0 / (64 - 1)))) * (v[i + 1][h][g][2] - 2.0 * v[i][h][g][2] + v[i - 1][h][g][2]);
    w[i][h][g][3] = w[i][h][g][3] + (1.0 / (1.0 / (64 - 1))) * 1.00e-01 * 1.00e+00 * (z[i + 1][3] - z[i][3]) + 1.00 * (1.0 / ((1.0 / (64 - 1)) * (1.0 / (64 - 1)))) * (v[i + 1][h][g][3] - 2.0 * v[i][h][g][3] + v[i - 1][h][g][3]);
    w[i][h][g][4] = w[i][h][g][4] + (1.0 / (1.0 / (64 - 1))) * 1.00e-01 * 1.00e+00 * (z[i + 1][4] - z[i][4]) + 1.00 * (1.0 / ((1.0 / (64 - 1)) * (1.0 / (64 - 1)))) * (v[i + 1][h][g][4] - 2.0 * v[i][h][g][4] + v[i - 1][h][g][4]);
  }

  for (j = 0; j < 5; j++) {
    w[1][h][g][j] = w[1][h][g][j] - ((max(max(0.75, 0.75), 1.00)) / 4.0) * (+5.0 * v[1][h][g][j] - 4.0 * v[2][h][g][j] + v[3][h][g][j]);
    w[2][h][g][j] = w[2][h][g][j] - ((max(max(0.75, 0.75), 1.00)) / 4.0) * (-4.0 * v[1][h][g][j] + 6.0 * v[2][h][g][j] - 4.0 * v[3][h][g][j] + v[4][h][g][j]);
  }

  for (i = 3; i < f - 3; i++) {
    for (j = 0; j < 5; j++) {
      w[i][h][g][j] = w[i][h][g][j] - ((max(max(0.75, 0.75), 1.00)) / 4.0) * (v[i - 2][h][g][j] - 4.0 * v[i - 1][h][g][j] + 6.0 * v[i][h][g][j] - 4.0 * v[i + 1][h][g][j] + v[i + 2][h][g][j]);
    }
  }

  for (j = 0; j < 5; j++) {
    w[f - 3][h][g][j] = w[f - 3][h][g][j] - ((max(max(0.75, 0.75), 1.00)) / 4.0) * (v[f - 5][h][g][j] - 4.0 * v[f - 4][h][g][j] + 6.0 * v[f - 3][h][g][j] - 4.0 * v[f - 2][h][g][j]);
    w[f - 2][h][g][j] = w[f - 2][h][g][j] - ((max(max(0.75, 0.75), 1.00)) / 4.0) * (v[f - 4][h][g][j] - 4.0 * v[f - 3][h][g][j] + 5.0 * v[f - 2][h][g][j]);
  }
}
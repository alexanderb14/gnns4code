void A(int a, int b, int c, double d[], __global double* e) {
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

__kernel void B(__global double* a, __global double* b, __global double* c, __local double* d, int e, int f, int g) {
  int h, i, j, k, l;
  double m;
  double n[5];
  __local double* o;

  j = get_global_id(0) + 1;
  l = get_local_id(0);
  o = &d[l * 5];

  for (k = 0; k < 5; k++) {
    o[k] = 0.0;
  }

  if (j < g - 1) {
    __global double(*p)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5] = (__global double(*)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5])a;

    for (i = 1; i < (f - 1); i++) {
      for (h = 1; h < (e - 1); h++) {
        A(h, i, j, n, b);
        for (k = 0; k < 5; k++) {
          m = (n[k] - p[j][i][h][k]);
          o[k] = o[k] + m * m;
        }
      }
    }
  }

  barrier(1);

  if (l == 0) {
    for (h = 1; h < get_local_size(0); h++) {
      __local double* q = &d[h * 5];
      for (k = 0; k < 5; k++) {
        o[k] += q[k];
      }
    }

    __global double* r = &c[get_group_id(0) * 5];
    for (k = 0; k < 5; k++) {
      r[k] = o[k];
    }
  }
}

__kernel void C(__global double* a, __global double* b, __global double* c, int d, int e, int f, int g, int h, int i) {
  int j, k, l;

  k = get_global_id(1) + f;
  j = get_global_id(0) + d;
  if (k >= g || j >= e)
    return;

  __global double(*m)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5] = (__global double(*)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5])a;
  __global double(*n)[64 + 2] = (__global double(*)[64 + 2])b;
  __global double(*o)[64 + 2] = (__global double(*)[64 + 2])c;

  l = h;

  n[k][j] = 0.40e+00 * (m[l][k][j][4] - 0.50 * (m[l][k][j][1] * m[l][k][j][1] + m[l][k][j][2] * m[l][k][j][2] + m[l][k][j][3] * m[l][k][j][3]) / m[l][k][j][0]);

  l = i - 1;

  o[k][j] = 0.40e+00 * (m[l][k][j][4] - 0.50 * (m[l][k][j][1] * m[l][k][j][1] + m[l][k][j][2] * m[l][k][j][2] + m[l][k][j][3] * m[l][k][j][3]) / m[l][k][j][0]);
}

__kernel void D(__global double* a, __global double* b, __global double* c, int d, int e, int f, int g, int h, int i) {
  int j, k;

  k = get_global_id(1) + h;
  j = get_global_id(0) + d;
  if (k >= i || j >= e)
    return;

  __global double(*l)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5] = (__global double(*)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5])a;
  __global double(*m)[64 + 2] = (__global double(*)[64 + 2])b;
  __global double(*n)[64 + 2] = (__global double(*)[64 + 2])c;

  m[k][j] = 0.40e+00 * (l[k][f][j][4] - 0.50 * (l[k][f][j][1] * l[k][f][j][1] + l[k][f][j][2] * l[k][f][j][2] + l[k][f][j][3] * l[k][f][j][3]) / l[k][f][j][0]);

  n[k][j] = 0.40e+00 * (l[k][g - 1][j][4] - 0.50 * (l[k][g - 1][j][1] * l[k][g - 1][j][1] + l[k][g - 1][j][2] * l[k][g - 1][j][2] + l[k][g - 1][j][3] * l[k][g - 1][j][3]) / l[k][g - 1][j][0]);
}

__kernel void E(__global double* a, __global double* b, __global double* c, int d, int e, int f, int g, int h, int i) {
  int j, k;

  k = get_global_id(1) + h;
  j = get_global_id(0) + f;
  if (k >= i || j >= g)
    return;

  __global double(*l)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5] = (__global double(*)[64 / 2 * 2 + 1][64 / 2 * 2 + 1][5])a;
  __global double(*m)[64 + 2] = (__global double(*)[64 + 2])b;
  __global double(*n)[64 + 2] = (__global double(*)[64 + 2])c;

  m[k][j] = 0.40e+00 * (l[k][j][d][4] - 0.50 * (l[k][j][d][1] * l[k][j][d][1] + l[k][j][d][2] * l[k][j][d][2] + l[k][j][d][3] * l[k][j][d][3]) / l[k][j][d][0]);

  n[k][j] = 0.40e+00 * (l[k][j][e - 1][4] - 0.50 * (l[k][j][e - 1][1] * l[k][j][e - 1][1] + l[k][j][e - 1][2] * l[k][j][e - 1][2] + l[k][j][e - 1][3] * l[k][j][e - 1][3]) / l[k][j][e - 1][0]);
}

__kernel void F(__global double* a, __global double* b, __global double* c, __local double* d, int e, int f, int g, int h) {
  int i, j, k;
  double l = 0.0;

  j = get_global_id(0) + g;
  k = get_local_id(0);

  if (j < h) {
    __global double(*m)[64 + 2] = (__global double(*)[64 + 2])a;
    __global double(*n)[64 + 2] = (__global double(*)[64 + 2])b;

    for (i = e; i < f; i++) {
      l = l + (m[j][i] + m[j][i + 1] + m[j + 1][i] + m[j + 1][i + 1] + n[j][i] + n[j][i + 1] + n[j + 1][i] + n[j + 1][i + 1]);
    }
  }
  d[k] = l;

  barrier(1);

  if (k == 0) {
    for (i = 1; i < get_local_size(0); i++) {
      l += d[i];
    }

    c[get_group_id(0)] = l;
  }
}
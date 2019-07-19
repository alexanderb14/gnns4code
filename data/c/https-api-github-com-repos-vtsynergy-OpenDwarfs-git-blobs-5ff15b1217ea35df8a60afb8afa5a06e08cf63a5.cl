__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d, __global float* e, __global float* f, int g, int h, float i) {
  int j = get_group_id(0);
  int k = get_group_id(1);

  int l = get_local_id(0);
  int m = get_local_id(1);

  int n = g * 16 * k + 16 * j + g * m + l;
  int o = g * 16 * k + 16 * j + l - g;
  int p = g * 16 * k + 16 * j + g * 16 + l;
  int q = g * 16 * k + 16 * j + g * m - 1;
  int r = g * 16 * k + 16 * j + g * m + 16;

  float s, t, u, v, w, x, y, z, aa, ab, ac;

  __local float ad[16][16];
  __local float ae[16][16];

  __local float af[16][16];
  __local float ag[16][16];
  __local float ah[16][16];
  __local float ai[16][16];

  af[m][l] = e[o];
  ag[m][l] = e[p];
  if (k == 0) {
    af[m][l] = e[16 * j + l];
  } else if (k == get_num_groups(1) - 1) {
    ag[m][l] = e[g * 16 * (get_num_groups(1) - 1) + 16 * j + g * (16 - 1) + l];
  }
  barrier(1);

  ai[m][l] = e[q];
  ah[m][l] = e[r];

  if (j == 0) {
    ai[m][l] = e[g * 16 * k + g * m];
  } else if (j == get_num_groups(0) - 1) {
    ah[m][l] = e[g * 16 * k + 16 * (get_num_groups(0) - 1) + g * m + 16 - 1];
  }

  barrier(1);

  ad[m][l] = e[n];

  barrier(1);

  w = ad[m][l];

  if (m == 0 && l == 0) {
    s = af[m][l] - w;
    v = ad[m + 1][l] - w;
    t = ai[m][l] - w;
    u = ad[m][l + 1] - w;
  } else if (m == 0 && l == 16 - 1) {
    s = af[m][l] - w;
    v = ad[m + 1][l] - w;
    t = ad[m][l - 1] - w;
    u = ah[m][l] - w;
  } else if (m == 16 - 1 && l == 16 - 1) {
    s = ad[m - 1][l] - w;
    v = ag[m][l] - w;
    t = ad[m][l - 1] - w;
    u = ah[m][l] - w;
  } else if (m == 16 - 1 && l == 0) {
    s = ad[m - 1][l] - w;
    v = ag[m][l] - w;
    t = ai[m][l] - w;
    u = ad[m][l + 1] - w;
  }

  else if (m == 0) {
    s = af[m][l] - w;
    v = ad[m + 1][l] - w;
    t = ad[m][l - 1] - w;
    u = ad[m][l + 1] - w;
  } else if (l == 16 - 1) {
    s = ad[m - 1][l] - w;
    v = ad[m + 1][l] - w;
    t = ad[m][l - 1] - w;
    u = ah[m][l] - w;
  } else if (m == 16 - 1) {
    s = ad[m - 1][l] - w;
    v = ag[m][l] - w;
    t = ad[m][l - 1] - w;
    u = ad[m][l + 1] - w;
  } else if (l == 0) {
    s = ad[m - 1][l] - w;
    v = ad[m + 1][l] - w;
    t = ai[m][l] - w;
    u = ad[m][l + 1] - w;
  } else {
    s = ad[m - 1][l] - w;
    v = ad[m + 1][l] - w;
    t = ad[m][l - 1] - w;
    u = ad[m][l + 1] - w;
  }

  x = (s * s + v * v + t * t + u * u) / (w * w);

  y = (s + v + t + u) / w;

  z = (0.5f * x) - ((1.0f / 16.0f) * (y * y));
  aa = 1 + (.25f * y);
  ab = z / (aa * aa);

  aa = (ab - i) / (i * (1 + i));
  ac = 1.0f / (1.0f + aa);

  if (ac < 0) {
    ae[m][l] = 0;
  } else if (ac > 1) {
    ae[m][l] = 1;
  } else {
    ae[m][l] = ac;
  }

  barrier(1);

  f[n] = ae[m][l];
  a[n] = u;
  b[n] = t;
  d[n] = v;
  c[n] = s;
}

__kernel void B(__global float* a, __global float* b, __global float* c, __global float* d, __global float* e, __global float* f, int g, int h, float i, float j) {
  int k = get_group_id(0);
  int l = get_group_id(1);

  int m = get_local_id(0);
  int n = get_local_id(1);

  int o = g * 16 * l + 16 * k + g * n + m;
  int p = g * 16 * l + 16 * k + g * 16 + m;
  int q = g * 16 * l + 16 * k + g * n + 16;
  float r, s, t, u, v, w;

  __local float x[16][16];
  __local float y[16][16];

  __local float z[16][16];
  __local float aa[16][16];
  __local float ab[16][16];

  ab[n][m] = e[o];

  barrier(1);

  if (l == get_num_groups(1) - 1) {
    x[n][m] = f[g * 16 * (get_num_groups(1) - 1) + 16 * k + g * (16 - 1) + m];
  } else
    x[n][m] = f[p];

  barrier(1);

  if (k == get_num_groups(0) - 1) {
    y[n][m] = f[g * 16 * l + 16 * (get_num_groups(0) - 1) + g * n + 16 - 1];
  } else
    y[n][m] = f[q];

  barrier(1);

  z[n][m] = f[o];

  barrier(1);

  r = z[n][m];

  if (n == 16 - 1 && m == 16 - 1) {
    s = r;
    t = x[n][m];
    v = r;
    u = y[n][m];
  } else if (m == 16 - 1) {
    s = r;
    t = z[n + 1][m];
    v = r;
    u = y[n][m];
  } else if (n == 16 - 1) {
    s = r;
    t = x[n][m];
    v = r;
    u = z[n][m + 1];
  } else {
    s = r;
    t = z[n + 1][m];
    v = r;
    u = z[n][m + 1];
  }

  w = s * c[o] + t * d[o] + v * b[o] + u * a[o];

  aa[n][m] = ab[n][m] + 0.25f * i * w;

  barrier(1);

  e[o] = aa[n][m];
}
__attribute__((num_simd_work_items(4))) __kernel void A(__global float* restrict a, __global float* restrict b, __global float* restrict c, __global float* restrict d, __global float* restrict e, __global float* restrict f, int g, int h, float i) {
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

  if (k == 0) {
    o = 16 * j + l;
  } else if (k == get_num_groups(1) - 1) {
    p = g * 16 * k + 16 * j + g * (16 - 1) + l;
  }

  if (j == 0) {
    q = g * 16 * k + g * m;
  } else if (j == get_num_groups(0) - 1) {
    r = g * 16 * k + 16 * j + g * m + 16 - 1;
  }

  int ad = g * 16 * k + 16 * j + g * (m + 1) + l;
  int ae = g * 16 * k + 16 * j + g * (m - 1) + l;
  int af = g * 16 * k + 16 * j + g * m + (l + 1);
  int ag = g * 16 * k + 16 * j + g * m + (l - 1);

  w = e[n];

  if (m == 0 && l == 0) {
    s = e[o] - w;
    v = e[ad] - w;
    t = e[q] - w;
    u = e[af] - w;
  } else if (m == 0 && l == 16 - 1) {
    s = e[o] - w;
    v = e[ad] - w;
    t = e[ag] - w;
    u = e[r] - w;
  } else if (m == 16 - 1 && l == 16 - 1) {
    s = e[ae] - w;
    v = e[p] - w;
    t = e[ag] - w;
    u = e[r] - w;
  } else if (m == 16 - 1 && l == 0) {
    s = e[ae] - w;
    v = e[p] - w;
    t = e[q] - w;
    u = e[af] - w;
  } else if (m == 0) {
    s = e[o] - w;
    v = e[ad] - w;
    t = e[ag] - w;
    u = e[af] - w;
  } else if (l == 16 - 1) {
    s = e[ae] - w;
    v = e[ad] - w;
    t = e[ag] - w;
    u = e[r] - w;
  } else if (m == 16 - 1) {
    s = e[ae] - w;
    v = e[p] - w;
    t = e[ag] - w;
    u = e[af] - w;
  } else if (l == 0) {
    s = e[ae] - w;
    v = e[ad] - w;
    t = e[q] - w;
    u = e[af] - w;
  } else {
    s = e[ae] - w;
    v = e[ad] - w;
    t = e[ag] - w;
    u = e[af] - w;
  }

  x = (s * s + v * v + t * t + u * u) / (w * w);

  y = (s + v + t + u) / w;

  z = (0.5f * x) - ((1.0f / 16.0f) * (y * y));
  aa = 1 + (.25f * y);
  ab = z / (aa * aa);

  aa = (ab - i) / (i * (1 + i));
  ac = 1.0f / (1.0f + aa);

  if (ac < 0) {
    f[n] = 0;
  } else if (ac > 1) {
    f[n] = 1;
  } else {
    f[n] = ac;
  }

  a[n] = u;
  b[n] = t;
  d[n] = v;
  c[n] = s;
}

__attribute__((num_simd_work_items(4))) __kernel void B(__global float* restrict a, __global float* restrict b, __global float* restrict c, __global float* restrict d, __global float* restrict e, __global float* restrict f, int g, int h, float i, float j) {
  int k = get_group_id(0);
  int l = get_group_id(1);

  int m = get_local_id(0);
  int n = get_local_id(1);

  int o = g * 16 * l + 16 * k + g * n + m;
  int p = g * 16 * l + 16 * k + g * 16 + m;
  int q = g * 16 * l + 16 * k + g * n + 16;
  float r, s, t, u, v, w;

  int x = g * 16 * l + 16 * k + g * (n + 1) + m;
  int y = g * 16 * l + 16 * k + g * n + (m + 1);

  r = f[o];
  s = r;
  v = r;

  if (n == 16 - 1 && m == 16 - 1) {
    if (l == get_num_groups(1) - 1)
      t = f[g * 16 * l + 16 * k + g * n + m];
    else
      t = f[p];

    if (k == get_num_groups(0) - 1)
      u = f[g * 16 * l + 16 * k + g * n + m];
    else
      u = f[q];
  } else if (m == 16 - 1) {
    t = f[x];

    if (k == get_num_groups(0) - 1)
      u = f[g * 16 * l + 16 * k + g * n + m];
    else
      u = f[q];
  } else if (n == 16 - 1) {
    if (l == get_num_groups(1) - 1)
      t = f[g * 16 * l + 16 * k + g * n + m];
    else
      t = f[p];
    u = f[y];
  } else {
    t = f[x];
    u = f[y];
  }

  w = s * c[o] + t * d[o] + v * b[o] + u * a[o];

  e[o] = e[o] + 0.25f * i * w;
}
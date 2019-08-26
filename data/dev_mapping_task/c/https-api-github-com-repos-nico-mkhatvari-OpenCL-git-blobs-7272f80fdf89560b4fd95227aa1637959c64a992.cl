__kernel void A(__global uchar* a, __global uchar* b, int c, int d, float e, float f) {
  int g = get_global_id(0);
  int h = get_global_id(1);
  int i = get_global_size(0);

  int j, k, l, m;
  int n;
  uchar o, p, q, r;
  float s, t;
  int u;

  s = convert_float(g * e);
  j = convert_int(s);
  k = j + 1;

  if (!(k < c))
    k = j;

  t = convert_float(h * f);
  l = convert_int(t);
  m = l + 1;

  if (!(m < d))
    m = l;

  n = (g + h * i) * 3;

  for (u = 0; u < 3; u++) {
    o = a[(j + l * c) * 3 + u];
    p = a[(j + m * c) * 3 + u];
    q = a[(k + l * c) * 3 + u];
    r = a[(k + m * c) * 3 + u];
    b[n + u] = convert_uchar((o * (k - s) * (m - t) + q * (s - j) * (m - t) + p * (k - s) * (t - l) + r * (s - j) * (t - l)));
  }
}
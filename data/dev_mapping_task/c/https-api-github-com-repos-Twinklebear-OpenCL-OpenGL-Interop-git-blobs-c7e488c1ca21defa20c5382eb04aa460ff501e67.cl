__kernel void A(int a, int b, __local float* c, __local float* d, __local float* e, __local float* f, __constant int* g, __constant int* h, __constant float* i, __constant float* j, __global float* k) {
  int l = get_local_id(0);

  int m = -1;
  int n = -1;

  for (int o = l; o < b; ++o) {
    if (g[o] == l && m == -1)
      m = o;
    else if (g[o] == l + 1 && n == -1) {
      n = o - 1;
      break;
    } else if (o == b - 1 && n == -1)
      n = o;
  }

  d[l] = 0.0f;
  c[l] = j[l];
  f[l] = j[l];

  barrier(1);

  local float p, q;
  if (l == 0) {
    p = 0.0f;
    for (int o = 0; o < a; ++o)
      p += c[o] * c[o];

    q = sqrt(p);
  }
  barrier(1);

  local float r, s, t;
  local int u;
  u = 0;
  while (u < 1000 && q >= 0.01f) {
    e[l] = 0.0f;
    for (int o = m; o <= n; ++o)
      e[l] += i[o] * f[h[o]];

    barrier(1);

    if (l == 0) {
      t = 0.0f;
      for (int o = 0; o < a; ++o)
        t += e[o] * f[o];

      r = p / t;
    }
    barrier(1);

    d[l] += r * f[l];
    c[l] -= r * e[l];
    barrier(1);

    if (l == 0) {
      s = 0.0f;
      for (int o = 0; o < a; ++o)
        s += c[o] * c[o];

      q = sqrt(s);
    }
    barrier(1);

    f[l] = c[l] + (s / p) * f[l];
    barrier(1);

    p = s;

    if (l == 0)
      ++u;

    barrier(1);
  }
  k[0] = u * 1.0f;
  k[1] = q;

  k[l + 2] = d[l];
}
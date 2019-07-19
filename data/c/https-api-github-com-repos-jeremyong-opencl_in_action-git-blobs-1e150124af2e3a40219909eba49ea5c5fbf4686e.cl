__kernel void A(int a, int b, __local float* c, __local float* d, __local float* e, __local float* f, __global int* g, __global int* h, __global float* i, __global float* j, __global float* k) {
  local float l, m, n, o;
  local int p;

  int q = get_local_id(0);
  int r = -1;
  int s = -1;
  float t;

  for (int u = q; u < b; u++) {
    if ((g[u] == q) && (r == -1))
      r = u;
    else if ((g[u] == q + 1) && (s == -1)) {
      s = u - 1;
      break;
    } else if ((u == b - 1) && (s == -1)) {
      s = u;
    }
  }

  d[q] = 0.0f;
  c[q] = j[q];
  f[q] = j[q];
  barrier(1);

  if (q == 0) {
    n = 0.0f;
    for (int u = 0; u < a; u++) {
      n += c[u] * c[u];
    }
    m = sqrt(n);
  }
  barrier(1);

  p = 0;
  while ((p < 1000) && (m >= 0.01)) {
    e[q] = 0.0f;
    for (int u = r; u <= s; u++) {
      e[q] += i[u] * f[h[u]];
    }
    barrier(1);

    if (q == 0) {
      t = 0.0f;
      for (int u = 0; u < a; u++) {
        t += e[u] * f[u];
      }
      l = n / t;
    }
    barrier(1);

    d[q] += l * f[q];
    c[q] -= l * e[q];
    barrier(1);

    if (q == 0) {
      o = 0.0f;
      for (int u = 0; u < a; u++) {
        o += c[u] * c[u];
      }
      m = sqrt(o);
    }
    barrier(1);

    f[q] = c[q] + (o / n) * f[q];
    barrier(1);

    n = o;

    if (q == 0) {
      p++;
    }
    barrier(1);
  }
  k[0] = p * 1.0f;
  k[1] = m;
}
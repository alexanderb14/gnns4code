inline double A(int a) {
  if (a != 0) {
    return (0.5 * log(6.283185 * a) + a * log(1.0 * a) - a);
  }
  return (0);
}

inline double B(int a, int b) {
  if ((b != 0) && (a != 0)) {
    return (A(a) - A(b) - A(a - b));
  }
  return (0.0);
}

inline double C(int a, int b, double c) {
  if (b != 0 && c != 1.0 && c != 0.0) {
    return (B(b, a) + a * log(c) + (b - a) * log(1 - c));
  } else if (b == 0) {
    return (a == 0 ? 0.0 : -__builtin_inff());
  } else if (c == 0.0) {
    return (a == 0 ? 0.0 : -__builtin_inff());
  } else if (c == 1.0) {
    return (a == b ? 0.0 : -__builtin_inff());
  }
  return (-__builtin_inff());
}

__kernel void D(int a, int b, __global int* c, __global int* d, __global int* e, __global int* f, __global int* g, __global int* h, __global double* i, __global double* j, __global double* k, __global double* l, __local int* m, __local int* n, __local int* o, __local int* p, __local int* q, __local int* r, __local double* s, __local double* t, __local double* u) {
  size_t v = get_global_id(0);
  int w;
  int x = b * a;
  size_t y = get_local_id(0);
  size_t z = get_local_size(0);
  size_t aa = get_group_id(0);
  double ab = 0.0;

  if (v < x) {
    m[y] = c[v];
    n[y] = d[v];
    o[y] = e[v];
    p[y] = f[v];
    q[y] = g[v];
    r[y] = h[v];
    s[y] = i[v];
    t[y] = j[v % a];
    u[y] = k[v % a];

    if ((o[y] >= 0) && (o[y] <= q[y]) && (m[y] <= r[y])) {
      ab = ((B(q[y], o[y]) + o[y] * log(u[y]) + (q[y] - o[y]) * log(1 - u[y])) + C(m[y], r[y], t[y]) + C(n[y], p[y], s[y]));
    } else {
      ab = -__builtin_inff();
    }
  }
  t[y] = ab;

  barrier(1);
  for (w = z / 2; w > 0; w >>= 1) {
    if (y < w) {
      t[y] += t[y + w];
    }
    barrier(1);
  }
  if (y == 0) {
    l[aa] = t[y];
  }
}
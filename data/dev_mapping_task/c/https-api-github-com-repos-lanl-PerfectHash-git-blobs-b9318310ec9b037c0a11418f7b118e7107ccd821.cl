typedef float real; __kernel void A(const uint a, __global int* b) {
  const uint c = get_global_id(0);

  if (c >= a)
    return;

  b[c] = -1;
}

__kernel void B(const real a, const real b, const uint c, __global const real* d, __global int* e) {
  const uint f = get_global_id(0);

  if (f >= c)
    return;

  e[(uint)((d[f] - a) / b)] = f;
}

__kernel void C(const uint a, __global uint* b, __local volatile uint* c, __global const int* d) {
  const uint e = get_global_id(0);
  const uint f = get_local_id(0);
  const uint g = get_local_size(0);
  const uint h = get_group_id(0);

  int i = -1;
  if (e < a)
    i = d[e];

  c[f] = i >= 0 ? 1 : 0;
  barrier(2);

  for (uint j = g >> 1; j > 32; j >>= 1) {
    if (f < j) {
      c[f] += c[f + j];
    }
    barrier(1);
  }

  if (e >= a)
    return;

  if (f < 32) {
    c[f] += c[f + 32];
    c[f] += c[f + 16];
    c[f] += c[f + 8];
    c[f] += c[f + 4];
    c[f] += c[f + 2];
    c[f] += c[f + 1];
  }

  if (f == 0) {
    b[h] = c[0];
  }
}

inline uint D(__local volatile uint* a, const uint b, const uint c) {
  if (c > 0)
    a[b] += a[b - 1];
  if (c > 1)
    a[b] += a[b - 2];
  if (c > 3)
    a[b] += a[b - 4];
  if (c > 7)
    a[b] += a[b - 8];
  if (c > 15)
    a[b] += a[b - 16];

  return (c > 0) ? a[b - 1] : 0;
}

inline uint E(__local volatile uint* a, const uint b, const uint c) {
  if (1) {
    if (c > 0)
      a[b] += a[b - 1];
    if (c > 1)
      a[b] += a[b - 2];
    if (c > 3)
      a[b] += a[b - 4];
    if (c > 7)
      a[b] += a[b - 8];
    if (c > 15)
      a[b] += a[b - 16];
    return a[b];
  }
}

inline uint F(__local uint* a, const uint b, const uint c, const uint d) {
  uint e = D(a, b, c);
  barrier(1);

  if (c == 31)
    a[d] = a[b];
  barrier(1);

  if (d == 0)
    E(a, b, c);
  barrier(1);

  if (d > 0)
    e += a[d - 1];
  barrier(1);

  a[b] = e;
  barrier(1);

  return e;
}

__kernel void G(__local uint* a, __global uint* b, const uint c) {
  size_t d = get_local_id(0);
  const uint e = get_group_id(0);
  const uint f = get_local_size(0);

  const uint g = d & 31;
  const uint h = d >> 5;
  const uint i = (c + f - 1) / f;

  uint j = 0;

  for (uint k = 0; k < i; ++k) {
    uint l = k * f + d;

    uint m = 0;
    if (l < c)
      m = b[l];
    a[d] = m;
    barrier(1);

    uint n = F(a, d, g, h);

    n += j;

    if (l < c)
      b[l] = n;

    if (d == (f - 1))
      a[d] = m + n;
    barrier(1);

    j = a[f - 1];
    barrier(1);
  }
}

inline uint H(uint a, uint b, uint c, uint d, uint e, uint f, uint g, __global uint* h, __local uint* i) {
  barrier(1);

  uint j = 0;
  if (a < g)
    j = h[a];
  i[c] = j;
  barrier(1);

  uint k = F(i, c, d, e);

  k += f;

  if (a < g)
    h[a] = k;

  if (c == (b - 1))
    i[c] = j + k;
  barrier(1);

  f = i[b - 1];

  return (f);
}

__kernel void I(__local uint* a, __global uint* b, __global uint* c, const uint d) {
  uint e = get_local_id(0);
  uint f = get_global_id(0);
  const uint g = get_group_id(0);
  const uint h = get_local_size(0);

  const uint i = e & 31;
  const uint j = e >> 5;

  c[g] = 0;

  uint k = 0;
  if (f < d)
    k = b[f];
  a[e] = k;
  barrier(1);

  uint l = F(a, e, i, j);

  c[g] = a[e];
}

__kernel void J(__global uint* a) {
  uint b = get_local_id(0);

  const uint c = b & 31;
  const uint d = b >> 5;
}

__kernel void K() {
  uint a = get_local_id(0);

  const uint b = a >> 5;
}

__kernel void L(const int a, __global const uint* b, __local uint* c, __global const int* d, __global const real* e, __global real* f) {
  const uint g = get_global_id(0);
  const uint h = get_local_id(0);
  const uint i = get_group_id(0);

  const uint j = h & 31;
  const uint k = h >> 5;

  int l = 0;
  if (g < a)
    l = d[g];
  c[h] = 0;
  if (l >= 0)
    c[h] = 1;
  barrier(1);

  uint m = D(c, h, j);
  barrier(1);

  if (j == 31)
    c[k] = c[h];
  barrier(1);

  if (k == 0)
    E(c, h, j);
  barrier(1);

  if (k > 0)
    m += c[k - 1];
  barrier(1);

  if (g >= a || l < 0)
    return;

  m += b[i];

  f[m] = e[l];
}
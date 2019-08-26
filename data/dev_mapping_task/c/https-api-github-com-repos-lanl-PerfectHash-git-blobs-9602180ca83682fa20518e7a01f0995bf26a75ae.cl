typedef float real; typedef struct {
  long level;
  float xval;
  float yval;
} cell;

inline uint A(__local volatile uint* a, const uint b, const uint c);
inline uint B(__local volatile uint* a, const uint b, const uint c);
inline uint C(__local uint* a, const uint b, const uint c, const uint d);

__kernel void D(const int a, __global int* b) {
  const int c = get_global_id(0);
  if (c < a)
    b[c] = -1;
}

int E(int a) {
  int b = 1;
  int c;
  for (c = 0; c < a; c++) {
    b *= 2;
  }
  return b;
}
__kernel void F(__global const cell* a, const int b, const int c, __global int* d, const int e) {
  const int f = get_global_id(0);
  if (f < c)
    d[(int)(((((a[f].xval - (1.0f / (2.0f * (real)e * (real)E(a[f].level)))) * (real)((E(b) * e)))) + (((a[f].yval - (1.0f / (2.0f * (real)e * (real)E(a[f].level)))) * (real)((E(b) * e)))) * (real)((E(b) * e))))] = f;
}

__kernel void G(const uint a, __global uint* b, __local volatile uint* c, __global const int* d) {
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

inline uint A(__local volatile uint* a, const uint b, const uint c) {
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

inline uint B(__local volatile uint* a, const uint b, const uint c) {
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

inline uint C(__local uint* e, const uint b, const uint c, const uint d) {
  uint f = A(e, b, c);
  barrier(1);

  if (c == 31)
    e[d] = e[b];
  barrier(1);

  if (d == 0)
    B(e, b, c);
  barrier(1);

  if (d > 0)
    f += e[d - 1];
  barrier(1);

  e[b] = f;
  barrier(1);

  return f;
}

__kernel void H(__local uint* a, __global uint* b, const uint c) {
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

    uint n = C(a, d, g, h);

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

__kernel void I(const int a, __global const uint* b, __local uint* c, __global const int* d, __global const cell* e, __global cell* f) {
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

  uint m = A(c, h, j);
  barrier(1);

  if (j == 31)
    c[k] = c[h];
  barrier(1);

  if (k == 0)
    B(c, h, j);
  barrier(1);

  if (k > 0)
    m += c[k - 1];
  barrier(1);

  if (g >= a || l < 0)
    return;

  m += b[i];

  f[m] = e[l];
}
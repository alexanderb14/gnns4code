inline int A(__local int* a, size_t b, const uint c) {
  if (c > 0)
    a[b] = a[b - 1] + a[b];
  if (c > 1)
    a[b] = a[b - 2] + a[b];
  if (c > 3)
    a[b] = a[b - 4] + a[b];
  if (c > 7)
    a[b] = a[b - 8] + a[b];
  if (c > 15)
    a[b] = a[b - 16] + a[b];

  return (c > 0) ? a[b - 1] : 0;
}

inline int B(__local int* a, size_t b, const uint c) {
  if (c > 0)
    a[b] = a[b - 1] + a[b];
  if (c > 1)
    a[b] = a[b - 2] + a[b];
  if (c > 3)
    a[b] = a[b - 4] + a[b];
  if (c > 7)
    a[b] = a[b - 8] + a[b];
  if (c > 15)
    a[b] = a[b - 16] + a[b];

  return a[b];
}

inline int C(__local int* a, const uint b, const uint c, const uint d) {
  int e = A(a, b, c);
  barrier(1);

  if (c > 30)
    a[d] = a[b];
  barrier(1);

  if (d < 1)
    B(a, b, c);
  barrier(1);

  if (d > 0)
    e = a[d - 1] + e;
  barrier(1);

  a[b] = e;
  barrier(1);

  return e;
}

__kernel void D(__local int* a, __global int* b, const uint c, uint d, const uint e) {
  size_t f = get_local_id(0);
  const uint g = get_group_id(0);
  const uint h = get_local_size(0);

  const uint i = f & 31;
  const uint j = f >> 5;

  int k = 0;

  for (uint l = 0; l < e; ++l) {
    const uint m = l * h + (g * c);
    const uint n = m + f;

    if (n > d - 1)
      return;

    int o = a[f] = b[n];
    barrier(1);

    int p = C(a, f, i, j);

    p = p + k;

    b[n] = p;

    if (f == (h - 1)) {
      a[f] = o + p;
    }
    barrier(1);

    k = a[h - 1];
    barrier(1);
  }
}
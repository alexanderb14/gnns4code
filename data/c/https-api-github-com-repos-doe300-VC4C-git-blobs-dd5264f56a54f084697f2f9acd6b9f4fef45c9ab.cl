__kernel void A(__global int* a, const uint b) {
  uint c = get_local_id(0) + (32 * get_group_id(0));
  for (uint d = 0; d < 4; d++) {
    if (c < b) {
      a[c] = (1 + c);
      c += 8;
    }
  }
}

__kernel void B(__global int* a, __global uint* b) {
  const uint c = get_global_id(0);
  uint d = *b;
  int e = a[d];
  int f = a[c];
  bool g;

  while ((g = ((f) < (e))) || (!(g || ((e) < (f))) && c < d)) {
    if (atomic_cmpxchg(b, d, c) == d)
      break;
    else
      d = *b;
    e = a[d];
  }
}

__kernel void C(__global int* a, __global uint* b) {
  const uint c = get_global_id(0);
  uint d = *b;
  int e = a[d];
  int f = a[c];
  bool g;

  while ((g = ((e) < (f))) || (!(g || ((f) < (e))) && c < d)) {
    if (atomic_cmpxchg(b, d, c) == d)
      break;
    else
      d = *b;
    e = a[d];
  }
}

__kernel void D(uint a, __global int* b, __global uint* c, __global int* d) {
  uint e = (uint)__clc_ceil(((float)a) / get_global_size(0));
  uint f = get_global_id(0) * e;
  uint g = min(a, f + e);
  uint h = f;
  int i = d[f];
  f++;
  while (f < g) {
    int j = d[f];

    bool k = ((j) < (i));

    i = k ? j : i;
    h = k ? f : h;
    f++;
  }
  b[get_global_id(0)] = i;
  c[get_global_id(0)] = h;
}

__kernel void E(__global int* a, __global uint* b, uint c) {
  int d = a[0];
  uint e = 0;
  for (uint f = 1; f < c; f++) {
    int g = a[f];

    if (((g) < (d))) {
      d = g;
      e = f;
    }
  }
  *b = e;
}

__kernel void F(uint a, __global int* b, __global uint* c, __global int* d) {
  uint e = (uint)__clc_ceil(((float)a) / get_global_size(0));
  uint f = get_global_id(0) * e;
  uint g = min(a, f + e);
  uint h = f;
  int i = d[f];
  f++;
  while (f < g) {
    int j = d[f];

    bool k = ((i) < (j));

    i = k ? j : i;
    h = k ? f : h;
    f++;
  }
  b[get_global_id(0)] = i;
  c[get_global_id(0)] = h;
}

__kernel void G(__global int* a, __global uint* b, uint c) {
  int d = a[0];
  uint e = 0;
  for (uint f = 1; f < c; f++) {
    int g = a[f];

    if (((d) < (g))) {
      d = g;
      e = f;
    }
  }
  *b = e;
}

__kernel void H(uint a, __local int* b, __local uint* c, __global uint* d, __global int* e, __global int* f) {
  const uint g = get_global_id(0);
  uint h = g;
  int i;
  uint j;
  if (g < a) {
    j = h;

    i = e[h];
    h += get_global_size(0);
  }
  bool k;
  bool l;
  while (h < a) {
    int m = e[h];
    k = ((i) < (m));

    i = k ? i : m;

    j = k ? j : h;

    h += get_global_size(0);
  }
  const uint n = get_local_id(0);
  b[n] = i;
  c[n] = j;
  barrier(1);
  uint o = a - (get_local_size(0) * get_group_id(0));
  for (uint p = 12 / 2; p > 0; p = p / 2) {
    if ((n < p) && ((n + p) < o)) {
      int q = b[n];
      int r = b[n + p];

      k = ((q) < (r));
      l = !k && !((r) < (q));

      b[n] = k ? q : r;
      uint s = c[n];
      uint t = c[n + p];
      c[n] = k ? s : (l ? min(s, t) : t);
    }
    barrier(1);
  }
  if (n == 0) {
    f[get_group_id(0)] = b[0];
    d[get_group_id(0)] = c[0];
  }
}

__kernel void I(uint a, __local int* b, __local uint* c, __global uint* d, __global int* e, __global int* f) {
  const uint g = get_global_id(0);
  uint h = g;
  int i;
  uint j;
  if (g < a) {
    j = h;

    i = e[h];
    h += get_global_size(0);
  }
  bool k;
  bool l;
  while (h < a) {
    int m = e[h];

    k = ((m) < (i));
    i = k ? i : m;

    j = k ? j : h;

    h += get_global_size(0);
  }
  const uint n = get_local_id(0);
  b[n] = i;
  c[n] = j;
  barrier(1);
  uint o = a - (get_local_size(0) * get_group_id(0));
  for (uint p = 12 / 2; p > 0; p = p / 2) {
    if ((n < p) && ((n + p) < o)) {
      int q = b[n];
      int r = b[n + p];

      k = ((r) < (q));
      l = !k && !((q) < (r));

      b[n] = k ? q : r;
      uint s = c[n];
      uint t = c[n + p];
      c[n] = k ? s : (l ? min(s, t) : t);
    }
    barrier(1);
  }
  if (n == 0) {
    f[get_group_id(0)] = b[0];
    d[get_group_id(0)] = c[0];
  }
}
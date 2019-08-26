__kernel void A(__global uint* a, __global uint* b, __global uint* c, __global uint* d, __global uint* e, __global uint* f, __global uint* g, uint h, uint i, uint j, uint k, uint l, uint m, uint n, uint o) {
  uint p = get_global_id(0);
  uint q = get_global_id(1);

  int r = i * q;

  uint s = d[(unsigned)(i * q + p)];
  uint t = e[(unsigned)(i * q + p)];
  uint u = 0;

  uint v = atomic_cmpxchg(b + (unsigned long long)(q * h + s), -1, 0);
  if (v != -1) {
    uint w = atom_inc(a + (unsigned long long)(q * j * (n + 1) + v * (n + 1)));

    uint x = (w + 1) > n;

    uint y = g[min(k, w)];

    uint z = x * (y) + (1 - x) * w;

    f[(unsigned)(i * q * 4 + 4 * p)] = t;
    f[(unsigned)(i * q * 4 + 4 * p + 1)] = w;
    f[(unsigned)(i * q * 4 + 4 * p + 2)] = z;
    f[(unsigned)(i * q * 4 + 4 * p + 3)] = s;

  } else {
    v = atom_inc(c + (unsigned)(q));
    b[(unsigned long long)(q * h + s)] = v;

    uint w = atom_inc(a + (unsigned long long)(q * j * (n + 1) + v * (n + 1)));

    uint x = (w + 1) > n;

    uint y = g[min(k, w)];

    uint z = x * (y) + (1 - x) * w;

    f[(unsigned)(i * q * 4 + 4 * p)] = t;
    f[(unsigned)(i * q * 4 + 4 * p + 1)] = w;
    f[(unsigned)(i * q * 4 + 4 * p + 2)] = z;
    f[(unsigned)(i * q * 4 + 4 * p + 3)] = s;
  }
}

__kernel void B(__global uint* a, __global uint* b, __global uint* c, uint d, uint e, uint f, uint g, uint h, uint i, uint j, uint k) {
  uint l = get_global_id(0);
  uint m = get_global_id(1);
  uint n = c[(unsigned)(d * l * 4 + 4 * m)];
  uint o = c[(unsigned)(d * l * 4 + 4 * m + 3)];
  uint p = a[max((unsigned)0, (unsigned)(unsigned long long)(l * e + o))];

  uint q = c[(unsigned)(d * l * 4 + 4 * m + 2)];

  if (q < j) {
    b[(unsigned long long)(l * f * (j + 1) + p * (j + 1) + 1) + q] = n + g;
  }
}

__kernel void C(__global uint* a, __global uint* b, __global uint* c, __global uint* d, uint e, uint f, uint g, uint h, uint i, uint j, uint k, uint l, uint m) {
  uint n = get_global_id(0);
  uint o = get_global_id(1);
  uint p = get_global_id(2);
  uint q;
  uint r;

  for (uint s = 0; s < m; s++) {
    q = c[(unsigned)(g * m * o + n * m + s)];
    r = a[(unsigned long long)(o * e + q)];
    if (r != -1) {
      d[(unsigned)(n * h + o * k * m + s * k + p)] = b[(unsigned long long)(o * f * (k + 1) + r * (k + 1) + 1) + p];
    }
  }
}

__kernel void D(__global uint* a, __global uint* b, uint c, uint d) {
  unsigned int e = get_group_id(0);
  uint f = get_local_id(0);

  uint g = (1 & (unsigned int)e) ? ((unsigned)(e * c) + f) : ((unsigned)(e * c) + f + (c - d));

  b[(unsigned)(e * d) + f] = a[g];
}

__kernel void E(__global uint* a, __global uint* b, uint c, uint d) {
  uint e = get_global_id(0);
  uint f = e & d;

  if (f != 0) {
    b[e] = (a[e] != a[e - 1]) ? e : -1;
  } else {
    b[e] = e;
  }
}
__kernel void F(__global uint* a, __global uint* b, __global uint* c, __local uint* d, __local uint* e, __local uint* f, __local uint* g, __local uint* h, __local uint* i, __local uint* j, uint k) {
  uint l = get_local_size(0);
  uint m = get_local_id(0);
  uint n = get_group_id(0);
  uint o, p, q, r;
  event_t s[4];
  j[0] = 0;
  j[1] = 0;

  p = 64 * m;
  for (o = 0; o < 64; o++) {
    h[p + o] = 0;
  }

  for (uint t = 0; t < (k / 512); t++) {
    s[0] = async_work_group_copy(d, a + n * k + t * 512, 512, 0);
    s[1] = async_work_group_copy(f, b + n * k + t * 512, 512, 0);

    wait_group_events(2, s);

    s[0] = async_work_group_copy(b + n * k + t * 512, h, 512, 0);
    s[1] = async_work_group_copy(a + n * k + t * 512, (__local uint*)h, 512, 0);

    q = 0;
    p = m * 64;
    for (o = 0; o < 64; o++) {
      r = f[p + o];

      e[p + q] = (r != -1) ? d[p + o] : 0;
      g[p + q] = (r != -1) ? r : 0;
      q += (r != -1) ? 1 : 0;
    }

    i[m] = q;
    barrier(1);

    uint u = 0;
    for (o = 0; o < m; o++) {
      u += i[o];
    }

    for (o = 0; o < q; o++) {
      d[u + o] = e[p + o];
      f[u + o] = g[p + o];
    }

    if (m == 0) {
      j[1] = 0;
      for (o = 0; o < l; o++) {
        j[1] += i[o];
      }
      j[0] += j[1];
    }

    wait_group_events(2, s);

    barrier(1 | 2);

    s[2] = async_work_group_copy(b + n * k + j[0] - j[1], f, j[1], 0);
    s[3] = async_work_group_copy(a + n * k + j[0] - j[1], d, j[1], 0);

    wait_group_events(2, s + 2);
  }

  if (m == 0) {
    c[n] = j[0];
  }
}

__kernel void G(__global uint* a, __global uint* b, __global uint* c, __global uint* d, uint e, uint f, uint g, uint h) {
  uint i = get_global_id(0);
  uint j = i & g;
  uint k = i >> h;

  if (j < (d[k] - 1)) {
    b[i] = c[i + 1] - c[i];
  } else if (j == (d[k] - 1)) {
    b[i] = (k)*f + f - c[i];
  }
}

__kernel void H(__global uint* a, __global int* b, __global uint* c, int d) {
  int e = get_global_id(0);

  int f = e * d;

  int g;
  int h = 1;
  uint i = c[f];
  int j = 0;

  for (int k = 1; k < d; k++) {
    g = (i != c[f + k]);

    a[f + j] = g ? i : a[f + j];
    b[f + j] = g ? h : b[f + j];

    i = g ? c[f + k] : i;
    h = (1 - g) * h;
    j += g;
    h++;
  }
  a[f + j] = i;
  b[f + j] = h;
}
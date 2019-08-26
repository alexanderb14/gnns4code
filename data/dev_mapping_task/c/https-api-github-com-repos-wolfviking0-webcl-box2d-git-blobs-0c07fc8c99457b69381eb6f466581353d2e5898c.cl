inline void A(uint* a, uint* b, uint* c, uint* d, uint e) {
  if ((*a > *c) == e) {
    uint f;
    f = *a;
    *a = *c;
    *c = f;
    f = *b;
    *b = *d;
    *d = f;
  }
}

inline void B(__local uint* a, __local uint* b, __local uint* c, __local uint* d, uint e) {
  if ((*a > *c) == e) {
    uint f;
    f = *a;
    *a = *c;
    *c = f;
    f = *b;
    *b = *d;
    *d = f;
  }
}

__kernel __attribute__((reqd_work_group_size(512U / 2, 1, 1))) void C(__global uint* a, __global uint* b, __global uint* c, __global uint* d, uint e, uint f) {
  __local uint g[512U];
  __local uint h[512U];

  c += get_group_id(0) * 512U + get_local_id(0);
  d += get_group_id(0) * 512U + get_local_id(0);
  a += get_group_id(0) * 512U + get_local_id(0);
  b += get_group_id(0) * 512U + get_local_id(0);
  g[get_local_id(0) + 0] = c[0];
  h[get_local_id(0) + 0] = d[0];
  g[get_local_id(0) + (512U / 2)] = c[(512U / 2)];
  h[get_local_id(0) + (512U / 2)] = d[(512U / 2)];

  for (uint i = 2; i < e; i <<= 1) {
    uint j = ((get_local_id(0) & (i / 2)) != 0);
    for (uint k = i / 2; k > 0; k >>= 1) {
      barrier(1);
      uint l = 2 * get_local_id(0) - (get_local_id(0) & (k - 1));
      B(&g[l + 0], &h[l + 0], &g[l + k], &h[l + k], j);
    }
  }

  {
    for (uint k = e / 2; k > 0; k >>= 1) {
      barrier(1);
      uint l = 2 * get_local_id(0) - (get_local_id(0) & (k - 1));
      B(&g[l + 0], &h[l + 0], &g[l + k], &h[l + k], f);
    }
  }

  barrier(1);
  a[0] = g[get_local_id(0) + 0];
  b[0] = h[get_local_id(0) + 0];
  a[(512U / 2)] = g[get_local_id(0) + (512U / 2)];
  b[(512U / 2)] = h[get_local_id(0) + (512U / 2)];
}
__kernel __attribute__((reqd_work_group_size(512U / 2, 1, 1))) void D(__global uint* a, __global uint* b, __global uint* c, __global uint* d) {
  __local uint e[512U];
  __local uint f[512U];

  c += get_group_id(0) * 512U + get_local_id(0);
  d += get_group_id(0) * 512U + get_local_id(0);
  a += get_group_id(0) * 512U + get_local_id(0);
  b += get_group_id(0) * 512U + get_local_id(0);
  e[get_local_id(0) + 0] = c[0];
  f[get_local_id(0) + 0] = d[0];
  e[get_local_id(0) + (512U / 2)] = c[(512U / 2)];
  f[get_local_id(0) + (512U / 2)] = d[(512U / 2)];

  uint g = get_global_id(0) & ((512U / 2) - 1);

  for (uint h = 2; h < 512U; h <<= 1) {
    uint i = (g & (h / 2)) != 0;
    for (uint j = h / 2; j > 0; j >>= 1) {
      barrier(1);
      uint k = 2 * get_local_id(0) - (get_local_id(0) & (j - 1));
      B(&e[k + 0], &f[k + 0], &e[k + j], &f[k + j], i);
    }
  }

  {
    uint i = (get_group_id(0) & 1);
    for (uint j = 512U / 2; j > 0; j >>= 1) {
      barrier(1);
      uint k = 2 * get_local_id(0) - (get_local_id(0) & (j - 1));
      B(&e[k + 0], &f[k + 0], &e[k + j], &f[k + j], i);
    }
  }

  barrier(1);
  a[0] = e[get_local_id(0) + 0];
  b[0] = f[get_local_id(0) + 0];
  a[(512U / 2)] = e[get_local_id(0) + (512U / 2)];
  b[(512U / 2)] = f[get_local_id(0) + (512U / 2)];
}

__kernel void E(__global uint* a, __global uint* b, __global uint* c, __global uint* d, uint e, uint f, uint g, uint h) {
  uint i = get_global_id(0);
  uint j = i & (e / 2 - 1);

  uint k = h ^ ((j & (f / 2)) != 0);
  uint l = 2 * i - (i & (g - 1));

  uint m = c[l + 0];
  uint n = d[l + 0];
  uint o = c[l + g];
  uint p = d[l + g];

  A(&m, &n, &o, &p, k);

  a[l + 0] = m;
  b[l + 0] = n;
  a[l + g] = o;
  b[l + g] = p;
}

__kernel __attribute__((reqd_work_group_size(512U / 2, 1, 1))) void F(__global uint* a, __global uint* b, __global uint* c, __global uint* d, uint e, uint f, uint g, uint h) {
  __local uint i[512U];
  __local uint j[512U];

  c += get_group_id(0) * 512U + get_local_id(0);
  d += get_group_id(0) * 512U + get_local_id(0);
  a += get_group_id(0) * 512U + get_local_id(0);
  b += get_group_id(0) * 512U + get_local_id(0);
  i[get_local_id(0) + 0] = c[0];
  j[get_local_id(0) + 0] = d[0];
  i[get_local_id(0) + (512U / 2)] = c[(512U / 2)];
  j[get_local_id(0) + (512U / 2)] = d[(512U / 2)];

  uint k = get_global_id(0) & ((e / 2) - 1);
  uint l = h ^ ((k & (g / 2)) != 0);
  for (; f > 0; f >>= 1) {
    barrier(1);
    uint m = 2 * get_local_id(0) - (get_local_id(0) & (f - 1));
    B(&i[m + 0], &j[m + 0], &i[m + f], &j[m + f], l);
  }

  barrier(1);
  a[0] = i[get_local_id(0) + 0];
  b[0] = j[get_local_id(0) + 0];
  a[(512U / 2)] = i[get_local_id(0) + (512U / 2)];
  b[(512U / 2)] = j[get_local_id(0) + (512U / 2)];
}
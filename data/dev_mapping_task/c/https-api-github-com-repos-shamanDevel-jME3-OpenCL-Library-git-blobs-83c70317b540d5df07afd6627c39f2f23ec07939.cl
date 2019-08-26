__kernel void A(__global uint* a, __global uint* b, __global uint* c, __global uint* d, uint e, __global uint* f, __global uint* g, uint h) {
  int i = get_global_id(0);
  int j = get_local_id(0);
  int k = get_num_groups(0);
  int l = get_group_id(0);

  __local uint m[256];
  __local uint n[256];

  m[j] = 0xFFFFFFFF;
  n[j] = 0xFFFFFFFF;
  if (i < h) {
    m[j] = a[i];
    n[j] = c[i];
  }
  barrier(1);

  __local uint o[256];
  for (uint p = e; p < (e + 4); p++) {
    uint q = m[j];
    uint r = n[j];
    uint s = !((q >> p) & 0x1);
    o[j] = s;
    barrier(1);
    if (j == 256 - 1) {
      for (int t = 1; t < 256; t++) {
        o[t] += o[t - 1];
      }
    }
    barrier(1);
    uint u = s ? o[j] - 1 : o[256 - 1] - o[j] + j;
    m[u] = q;
    n[u] = r;
    barrier(1);
  }

  if (i < h) {
    b[i] = m[j];
    d[i] = n[j];
  }
  barrier(1);

  __local uint v[(1 << 4)];
  if (j < (1 << 4)) {
    v[j] = 0;
  }
  m[j] = (m[j] >> e) & 0xF;
  barrier(1);

  if (j > 0 && m[j] != m[j - 1]) {
    v[m[j]] = j;
  }
  barrier(1);

  if (j < (1 << 4)) {
    g[l * (1 << 4) + j] = v[j];
  }
  barrier(1);

  if (j > 0 && m[j] != m[j - 1]) {
    v[m[j - 1]] = j - v[m[j - 1]];
  }
  barrier(1);

  if (j == 256 - 1) {
    v[m[256 - 1]] = 256 - v[m[256 - 1]];
  }
  barrier(1);

  if (j < (1 << 4)) {
    f[j * k + l] = v[j];
  }
}

__kernel void B(__global uint4* a, __global uint* b, uint c) {
  int d = get_global_id(0);
  int e = get_local_id(0);
  int f = get_group_id(0);

  uint4 g = 0;
  if (d < c) {
    g = a[d];
  }

  __local uint h[256];

  uint4 i;
  i.x = g.x;
  i.y = i.x + g.y;
  i.z = i.y + g.z;
  i.w = i.z + g.w;
  h[e] = i.w;
  barrier(1);

  if (e == 256 - 1) {
    for (int j = 1; j < 256; j++) {
      h[j] += h[j - 1];
    }
  }
  barrier(1);

  uint k = h[e] - i.w;
  if (d < c) {
    uint4 l;
    l.x = k;
    l.y = k + i.x;
    l.z = k + i.y;
    l.w = k + i.z;
    a[d] = l;
  }
  barrier(1);

  if (e == 256 - 1) {
    b[f] = k + i.w;
  }
}

__kernel void C(__global uint4* a, __global uint* b, uint c) {
  int d = get_global_id(0);
  int e = get_local_id(0);
  int f = get_group_id(0);

  __local uint g[256];

  g[e] = b[e];
  barrier(1);

  if (e == 256 - 1) {
    for (int h = 1; h < 256; h++) {
      g[h] += g[h - 1];
    }
  }
  barrier(1);

  if (f > 0 && d < c) {
    a[d] = a[d] + g[f - 1];
  }
}

__kernel void D(__global uint* a, __global uint* b, __global uint* c, __global uint* d, __global uint* e, __global uint* f, uint g, uint h) {
  int i = get_global_id(0);
  int j = get_local_id(0);
  int k = get_group_id(0);
  int l = get_num_groups(0);

  __local uint m[(1 << 4)];
  __local uint n[(1 << 4)];

  if (j < (1 << 4)) {
    n[j] = e[j * l + k];
    m[j] = f[k * (1 << 4) + j];
  }
  barrier(1);

  if (i >= h) {
    return;
  }

  uint o = a[i];
  uint p = c[i];
  uint q = (o >> g) & 0xF;
  uint r = n[q] + j - m[q];
  b[r] = o;
  d[r] = p;
}
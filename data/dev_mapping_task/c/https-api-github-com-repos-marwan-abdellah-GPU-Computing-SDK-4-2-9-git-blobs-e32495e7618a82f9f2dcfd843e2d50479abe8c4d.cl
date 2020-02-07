uint A(uint a, volatile __local uint* b, int c) {
  int d = get_local_id(0);
  int e = 2 * d - (d & (32 - 1));
  b[e] = 0;
  e += 32;
  b[e] = a;

  if (0 <= c) {
    b[e] += b[e - 1];
  }
  if (1 <= c) {
    b[e] += b[e - 2];
  }
  if (2 <= c) {
    b[e] += b[e - 4];
  }
  if (3 <= c) {
    b[e] += b[e - 8];
  }
  if (4 <= c) {
    b[e] += b[e - 16];
  }

  return b[e] - a;
}

uint4 B(uint4 a, __local uint* b) {
  uint c = get_local_id(0);

  uint4 d = a;
  uint e[3];
  e[0] = d.x;
  e[1] = d.y + e[0];
  e[2] = d.z + e[1];

  uint f = d.w + e[2];

  f = A(f, b, 4);
  barrier(1);

  if ((c & (32 - 1)) == 32 - 1) {
    b[c >> 5] = f + d.w + e[2];
  }
  barrier(1);

  if (c < 32)
    b[c] = A(b[c], b, 2);

  barrier(1);

  f += b[c >> 5];

  d.x = f;
  d.y = f + e[0];
  d.z = f + e[1];
  d.w = f + e[2];

  return d;
}

uint4 C(uint4 a, __local uint* b, __local uint* c) {
  int d = get_local_id(0);
  int e = get_local_size(0);

  uint4 f = B(a, b);

  if (d == e - 1) {
    c[0] = f.w + a.w;
  }
  barrier(1);

  uint4 g;
  int h = d * 4;
  g.x = (a.x) ? f.x : c[0] + h - f.x;
  g.y = (a.y) ? f.y : c[0] + h + 1 - f.y;
  g.z = (a.z) ? f.z : c[0] + h + 2 - f.z;
  g.w = (a.w) ? f.w : c[0] + h + 3 - f.w;

  return g;
}

void D(uint4* a, uint b, uint c, __local uint* d, __local uint* e) {
  int f = get_local_id(0);
  int g = get_local_size(0);

  for (uint h = c; h < (c + b); ++h) {
    uint4 i;
    i.x = !(((*a).x >> h) & 0x1);
    i.y = !(((*a).y >> h) & 0x1);
    i.z = !(((*a).z >> h) & 0x1);
    i.w = !(((*a).w >> h) & 0x1);

    uint4 j;

    j = C(i, d, e);

    d[(j.x & 3) * g + (j.x >> 2)] = (*a).x;
    d[(j.y & 3) * g + (j.y >> 2)] = (*a).y;
    d[(j.z & 3) * g + (j.z >> 2)] = (*a).z;
    d[(j.w & 3) * g + (j.w >> 2)] = (*a).w;
    barrier(1);

    (*a).x = d[f];
    (*a).y = d[f + g];
    (*a).z = d[f + 2 * g];
    (*a).w = d[f + 3 * g];

    barrier(1);
  }
}

__kernel void E(__global uint4* a, __global uint4* b, uint c, uint d, uint e, uint f, __local uint* g) {
  int h = get_global_id(0);
  __local uint i[1];

  uint4 j;
  j = a[h];

  barrier(1);

  D(&j, c, d, g, i);

  b[h] = j;
}
__kernel void F(__global uint2* a, __global uint* b, __global uint* c, uint d, uint e, uint f, __local uint* g) {
  __local uint h[16];

  uint i = get_group_id(0);
  uint j = get_local_id(0);
  uint k = get_local_size(0);

  uint2 l;

  l = a[get_global_id(0)];

  g[2 * j] = (l.x >> d) & 0xF;
  g[2 * j + 1] = (l.y >> d) & 0xF;

  if (j < 16) {
    h[j] = 0;
  }
  barrier(1);

  if ((j > 0) && (g[j] != g[j - 1])) {
    h[g[j]] = j;
  }
  if (g[j + k] != g[j + k - 1]) {
    h[g[j + k]] = j + k;
  }
  barrier(1);

  if (j < 16) {
    c[i * 16 + j] = h[j];
  }
  barrier(1);

  if ((j > 0) && (g[j] != g[j - 1])) {
    h[g[j - 1]] = j - h[g[j - 1]];
  }
  if (g[j + k] != g[j + k - 1]) {
    h[g[j + k - 1]] = j + k - h[g[j + k - 1]];
  }

  if (j == k - 1) {
    h[g[2 * k - 1]] = 2 * k - h[g[2 * k - 1]];
  }
  barrier(1);

  if (j < 16) {
    b[j * f + i] = h[j];
  }
}

__kernel void G(__global uint* a, __global uint* b, uint c, __local uint* d) {
  int e = get_local_id(0);

  int f = 0;
  int g = 1;

  d[f * c + e] = (e > 0) ? b[e - 1] : 0;

  for (int h = 1; h < c; h *= 2) {
    f = 1 - f;
    g = 1 - f;
    barrier(1);

    d[f * c + e] = d[g * c + e];

    if (e >= h)
      d[f * c + e] += d[g * c + e - h];
  }

  barrier(1);

  a[e] = d[f * c + e];
}
__kernel void H(__global uint* a, __global uint2* b, __global uint* c, __global uint* d, __global uint* e, uint f, uint g, uint h, __local uint2* i) {
  __local uint j[16];
  __local uint k[16];

  __local uint* l = (__local uint*)i;

  uint m = get_group_id(0);

  uint n = get_global_id(0);
  uint o = get_local_id(0);
  uint p = get_local_size(0);

  i[o] = b[n];

  if (o < 16) {
    j[o] = d[o * h + m];
    k[o] = c[m * 16 + o];
  }
  barrier(1);

  uint q = (l[o] >> f) & 0xF;
  uint r = j[q] + o - k[q];

  if (r < g) {
    a[r] = l[o];
  }

  q = (l[o + p] >> f) & 0xF;
  r = j[q] + o + p - k[q];

  if (r < g) {
    a[r] = l[o + p];
  }
}
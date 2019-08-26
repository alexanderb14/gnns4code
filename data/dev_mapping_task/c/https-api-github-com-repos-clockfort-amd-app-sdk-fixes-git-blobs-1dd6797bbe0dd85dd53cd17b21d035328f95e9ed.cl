inline uchar4 A(__global uchar* a, uchar4 b) {
  return (uchar4)bbbb;
}

uchar4 B(uchar4 a, unsigned int b) {
  uchar4 c = a;
  for (unsigned int d = 0; d < b; d++) {
    c = c.yzwx;
  }
  return c;
}

uchar4 C(uchar4 a, unsigned int b) {
  uchar4 c = a;
  for (uint d = 0; d < b; ++d) {
    c = c.wxyz;
  }
  return c;
}

unsigned char D(unsigned char a, unsigned char b) {
  unsigned char c = 0;
  for (unsigned int d = 0; d < 8; ++d) {
    if ((b & 1) == 1) {
      c ^= a;
    }
    unsigned char e = (a & 0x80);
    a <<= 1;
    if (e == 0x80) {
      a ^= 0x1b;
    }
    b >>= 1;
  }
  return c;
}

uchar4 E(__local uchar4* a, __private uint* b, unsigned int c, unsigned int d, unsigned int e) {
  unsigned int f = 4;

  uchar g, h, i, j;

  unsigned int k = d - e * c;

  g = D(a[k].x, b[(f - c) % f]);
  h = D(a[k].y, b[(f - c) % f]);
  i = D(a[k].z, b[(f - c) % f]);
  j = D(a[k].w, b[(f - c) % f]);

  for (unsigned int l = 1; l < 4; ++l) {
    g ^= D(a[l * e + k].x, b[(l + f - c) % f]);
    h ^= D(a[l * e + k].y, b[(l + f - c) % f]);
    i ^= D(a[l * e + k].z, b[(l + f - c) % f]);
    j ^= D(a[l * e + k].w, b[(l + f - c) % f]);
  }

  return (uchar4)(g, h, i, j);
}

__kernel void F(__global uchar4* a, __global uchar4* b, __global uchar4* c, __global uchar* d, __local uchar4* e, __local uchar4* f, const uint g, const uint h)

{
  unsigned int i = get_local_id(0);
  unsigned int j = get_local_id(1);

  unsigned int k = get_global_id(0);
  unsigned int l = get_global_id(1);

  unsigned int m = get_group_id(0);
  unsigned int n = get_group_id(1);

  unsigned int o = get_global_size(0);
  unsigned int p = get_global_size(1);

  unsigned int q = get_local_size(0);
  unsigned int r = get_local_size(1);

  unsigned int s = j * (q) + i;

  unsigned int t = s + (q * r * (m + n * (o / q)));

  unsigned int u = l * o + k;

  e[s] = b[u];

  e[s] ^= c[j];

  __private uint v[4];
  v[0] = 2;
  v[1] = 3;
  v[2] = 1;
  v[3] = 1;

  for (int w = 1; w < h; w++) {
    e[s] = A(d, e[s]);

    e[s] = B(e[s], j);
    barrier(1);

    f[s] = E(e, v, j, s, q);
    barrier(1);

    e[s] = f[s] ^ c[w * 4 + j];
  }

  e[s] = A(d, e[s]);

  e[s] = B(e[s], j);

  e[s] ^= c[j + h * 4];

  a[u] = e[s];
}

__kernel void G(__global uchar4* a, __global uchar4* b, __global uchar4* c, __global uchar* d, __local uchar4* e, __local uchar4* f, const uint g, const uint h)

{
  unsigned int i = get_local_id(0);
  unsigned int j = get_local_id(1);

  unsigned int k = get_global_id(0);
  unsigned int l = get_global_id(1);

  unsigned int m = get_group_id(0);
  unsigned int n = get_group_id(1);

  unsigned int o = get_global_size(0);
  unsigned int p = get_global_size(1);

  unsigned int q = get_local_size(0);
  unsigned int r = get_local_size(1);

  unsigned int s = j * (q) + i;

  unsigned int t = s + (q * r * (m + n * (o / q)));

  unsigned int u = l * o + k;

  e[s] = b[u];

  __private uint v[4];
  v[0] = 14;
  v[1] = 11;
  v[2] = 13;
  v[3] = 9;

  e[s] ^= c[4 * h + j];

  for (unsigned int w = h - 1; w > 0; --w) {
    e[s] = C(e[s], j);

    e[s] = A(d, e[s]);
    barrier(1);

    f[s] = e[s] ^ c[w * 4 + j];
    barrier(1);

    e[s] = E(f, v, j, s, q);
  }

  e[s] = C(e[s], j);

  e[s] = A(d, e[s]);

  a[u] = e[s] ^ c[j];
}
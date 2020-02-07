__kernel void A(__global const float* a, __global const float* b, const int c, const int d, __global float* e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);
  const int h = get_global_id(2);

  const int i = (((h * d) + g) * c) + f;

  e[i] = a[i] * b[i];
}
__kernel void B(__global const float* a, __global const float* b, const int c, const int d, __global float* e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);
  const int h = get_global_id(2);

  const int i = (g * c) + f;
  const int j = (((h * d) + g) * c) + f;

  e[j] = a[i] * b[j];
}
__kernel void C(__global const float* a, __global const float* b, const int c, const int d, __global float* e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);
  const int h = get_global_id(2);

  const int i = (((h * d) + g) * c) + f;

  e[i] = a[i] / b[i];
}
__kernel void D(__global const float* a, const int b, __global float* c, __global float* d, __global float* e) {
  const int f = get_global_id(0) * 12;
  const int g = get_global_id(1);

  const int h = (g * b) + f;

  c[h] = a[h];
  d[h] = a[h + 1];
  e[h] = a[h + 2];

  c[h + 1] = a[h + 3];
  d[h + 1] = a[h + 4];
  e[h + 1] = a[h + 5];

  c[h + 2] = a[h + 6];
  d[h + 2] = a[h + 7];
  e[h + 2] = a[h + 8];

  c[h + 3] = a[h + 9];
  d[h + 3] = a[h + 10];
  e[h + 3] = a[h + 11];
}
__kernel void E(__global const float* a, __global const float* b, const int c, const int d, __global float* e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);
  const int h = get_global_id(2);

  const int i = (((h * d) + g) * c) + f;

  e[i] = a[i] - b[i];
}
__kernel void F(__global const float* a, __global const float* b, const int c, const int d, __global float* e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);
  const int h = get_global_id(2);

  const int i = (((h * d) + g) * c) + f;

  e[i] = a[i] + b[i];
}
__kernel void G(__global const float* a, const int b, const int c, __global float* d) {
  int e = 9;

  const int f = get_global_id(0) * 16;
  const int g = get_global_id(1);
  const int h = get_global_id(2);

  const int i = (((h * c) + g) * b) + f;

  float16 j[9][9];
  float16 k;

  for (int l = 0; l < e; l++) {
    j[l][0] = vload16(0, a + i + b * l);
    j[l][8] = vload16(0, a + i + b * l + 8);
   j[l][1] = (float16)(l][0].s12345678, l][8].s12345678);
   j[l][2] = (float16)(l][0].s23456789, l][8].s23456789);
   j[l][3] = (float16)(l][0].s3456789a, l][8].s3456789a);
   j[l][4] = (float16)(l][0].s456789ab, l][8].s456789ab);
   j[l][5] = (float16)(l][0].s56789abc, l][8].s56789abc);
   j[l][6] = (float16)(l][0].s6789abcd, l][8].s6789abcd);
   j[l][7] = (float16)(l][0].s789abcde, l][8].s789abcde);
  }

  for (int l = 0; l < 9; l++) {
    for (int m = 0; m < 9; m++) {
      k += j[l][m];
    }
  }

  vstore16(k / 81, 0, d + i + 4);
}

__kernel void H(__global const float* a, __global const float* b, __global const float* c, __global const float* d, __global const float* e, __global const float* f, __global const float* g, __global const float* h, __global const float* i, const int j, const int k, __global float* l, __global float* m, __global float* n, __global float* o, __global float* p, __global float* q) {
  const int r = get_global_id(0);
  const int s = get_global_id(1);
  const int t = get_global_id(2);

  const int u = (((t * k) + s) * j) + r;

  l[u] = d[u] - (a[u] * a[u]);
  m[u] = e[u] - (a[u] * b[u]);
  n[u] = f[u] - (a[u] * c[u]);
  o[u] = g[u] - (b[u] * b[u]);
  p[u] = h[u] - (b[u] * c[u]);
  q[u] = i[u] - (c[u] * c[u]);
}

__kernel void I(__global const float* a, __global const float* b, __global const float* c, __global const float* d, __global const float* e, __global const float* f, __global const float* g, __global const float* h, __global const float* i, __global const float* j, __global const float* k, __global const float* l, const int m, const int n, __global float* o, __global float* p, __global float* q, __global float* r) {
  const int s = get_global_id(0);
  const int t = get_global_id(1);
  const int u = get_global_id(2);
  const float v = 0.0001f;

  const int w = (((u * n) + t) * m) + s;
  const int x = (t * m) + s;

  float y = j[w];
  float z = k[w];
  float aa = l[w];
  float ab = d[x] + v;
  float ac = e[x];
  float ad = f[x];
  float ae = e[x];
  float af = g[x] + v;
  float ag = h[x];
  float ah = f[x];
  float ai = h[x];
  float aj = i[x] + v;

  float ak = 1 / (ab * (aj * af - ai * ag) - ae * (aj * ac - ai * ad) + ah * (ag * ac - af * ad));

  o[w] = ak * (y * (aj * af - ai * ag) + z * (ah * ag - aj * ae) + aa * (ai * ae - ah * af));
  p[w] = ak * (y * (ai * ad - aj * ac) + z * (aj * ab - ah * ad) + aa * (ah * ac - ai * ab));
  q[w] = ak * (y * (ag * ac - af * ad) + z * (ae * ad - ag * ab) + aa * (af * ab - ae * ac));

  r[w] = r[w] - ((o[w] * a[x]) + (p[w] * b[x]) + (q[w] * c[x]));
}
__kernel void J(__global const uchar* a, __global const uchar* b, const int c, const int d, __global uchar* e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);
  const int h = get_global_id(2);

  const int i = mul24(mul24(h, d) + g, c) + f;

  e[i] = mul24(a[i], b[i]);
}
__kernel void K(__global const uchar* a, __global const uchar* b, const int c, const int d, __global uchar* e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);
  const int h = get_global_id(2);

  const int i = mul24(g, c) + f;
  const int j = mul24(mul24(h, d) + g, c) + f;

  e[j] = mul24(a[i], b[j]);
}
__kernel void L(__global const uchar* a, __global const uchar* b, const int c, const int d, __global uchar* e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);
  const int h = get_global_id(2);

  const int i = mul24(mul24(h, d) + g, c) + f;

  e[i] = a[i] / b[i];
}
__kernel void M(__global const uchar* a, const int b, __global uchar* c, __global uchar* d, __global uchar* e) {
  const int f = get_global_id(0) * 12;
  const int g = get_global_id(1);

  const int h = (g * b) + f;

  c[h] = a[h];
  d[h] = a[h + 1];
  e[h] = a[h + 2];

  c[h + 1] = a[h + 3];
  d[h + 1] = a[h + 4];
  e[h + 1] = a[h + 5];

  c[h + 2] = a[h + 6];
  d[h + 2] = a[h + 7];
  e[h + 2] = a[h + 8];

  c[h + 3] = a[h + 9];
  d[h + 3] = a[h + 10];
  e[h + 3] = a[h + 11];
}
__kernel void N(__global const uchar* a, __global const uchar* b, const int c, const int d, __global uchar* e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);
  const int h = get_global_id(2);

  const int i = mul24(mul24(h, d) + g, c) + f;

  e[i] = a[i] - b[i];
}
__kernel void O(__global const uchar* a, __global const uchar* b, const int c, const int d, __global uchar* e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);
  const int h = get_global_id(2);

  const int i = mul24(mul24(h, d) + g, c) + f;

  e[i] = a[i] + b[i];
}
__kernel void P(__global const uchar* a, __global const uchar* b, __global const uchar* c, __global const uchar* d, __global const uchar* e, __global const uchar* f, __global const uchar* g, __global const uchar* h, __global const uchar* i, const int j, const int k, __global uchar* l, __global uchar* m, __global uchar* n, __global uchar* o, __global uchar* p, __global uchar* q) {
  const int r = get_global_id(0);
  const int s = get_global_id(1);
  const int t = get_global_id(2);

  const int u = mul24(mul24(t, k) + s, j) + r;

  l[u] = d[u] - mul24(a[u], a[u]);
  m[u] = e[u] - mul24(a[u], b[u]);
  n[u] = f[u] - mul24(a[u], c[u]);
  o[u] = g[u] - mul24(b[u], b[u]);
  p[u] = h[u] - mul24(b[u], c[u]);
  q[u] = i[u] - mul24(c[u], c[u]);
}
__kernel void Q(__global const uchar* a, __global const uchar* b, __global const uchar* c, __global const uchar* d, __global const uchar* e, __global const uchar* f, __global const uchar* g, __global const uchar* h, __global const uchar* i, __global const uchar* j, __global const uchar* k, __global const uchar* l, const int m, const int n, __global uchar* o, __global uchar* p, __global uchar* q, __global uchar* r) {
  const int s = get_global_id(0);
  const int t = get_global_id(1);
  const int u = get_global_id(2);
  const int v = 1;

  const int w = (((u * n) + t) * m) + s;
  const int x = (t * m) + s;

  uchar y = j[w];
  uchar z = k[w];
  uchar aa = l[w];
  uchar ab = d[x] + v;
  uchar ac = e[x];
  uchar ad = f[x];
  uchar ae = e[x];
  uchar af = g[x] + v;
  uchar ag = h[x];
  uchar ah = f[x];
  uchar ai = h[x];
  uchar aj = i[x] + v;

  uchar ak = 1 / (ab * (aj * af - ai * ag) - ae * (aj * ac - ai * ad) + ah * (ag * ac - af * ad));

  o[w] = ak * (y * (aj * af - ai * ag) + z * (ah * ag - aj * ae) + aa * (ai * ae - ah * af));
  p[w] = ak * (y * (ai * ad - aj * ac) + z * (aj * ab - ah * ad) + aa * (ah * ac - ai * ab));
  q[w] = ak * (y * (ag * ac - af * ad) + z * (ae * ad - ag * ab) + aa * (af * ab - ae * ac));

  r[w] = r[w] - ((o[w] * a[x]) + (p[w] * b[x]) + (q[w] * c[x]));
}

__kernel void R(__global const uchar* a, __global uchar* b, unsigned int c, unsigned int d, int e, float f) {
  size_t g = get_global_id(0);
  size_t h = get_global_id(2);

  size_t i = mul24(mul24(h, d) + g, c);

  float j = 0;

  for (int k = -e; k <= e; k++) {
    j += (float)a[i + k];
  }
  b[i] = (uchar)(j * f);

  for (uint k = 1; k < c; k++) {
    j += (float)a[i + k + e];
    j -= (float)a[i + k - e - 1];

    b[i + k] = (uchar)(j * f);
  }
}

__kernel void S(__global uchar* a, __global uchar* b, unsigned int c, unsigned int d, int e, float f) {
  size_t g = get_global_id(0);
  size_t h = get_global_id(2);
  size_t i = mul24(mul24(h, d), c) + g;
  a = &a[i];
  b = &b[i];

  float j;
  j = (float)a[0] * (float)(e);
  for (int k = 0; k < e + 1; k++) {
    j += (float)a[k * c];
  }
  b[0] = (uchar)(j * f);
  for (int k = 1; k < e + 1; k++) {
    j += (float)a[(k + e) * c];
    j -= (float)a[0];
    b[k * c] = (uchar)(j * f);
  }

  for (int k = e + 1; k < d - e; k++) {
    j += (float)a[(k + e) * c];
    j -= (float)a[((k - e) * c) - c];
    b[k * c] = (uchar)(j * f);
  }

  for (int k = d - e; k < d; k++) {
    j += (float)a[(d - 1) * c];
    j -= (float)a[((k - e) * c) - c];
    b[k * c] = (uchar)(j * f);
  }
}
__kernel void A(__global const uchar* a, __global const uchar* b, __global const uchar* c, __global const uchar* d, __global const uchar* e, __global const uchar* f, __global const uchar* g, __global const uchar* h, const int i, const int j, __global uchar* k, __global uchar* l) {
  const int m = get_global_id(0);
  const int n = get_global_id(2);

  const int o = m * j;
  const int p = ((n * i) + m) * j;

  ushort q, r;

  for (int s = 0; s < n; s++) {
    q = (abs(a[o + s] - 255) + abs(b[o + s] - 255) + abs(c[o + s] - 255)) / 3;

    r = abs(g[o + s] - 255);

    q = q > 1835 ? 1835 : q;
    r = r > 524 ? 524 : r;
    k[p + s] = (uchar)(0.9f * q + (1 - 0.9f) * r);
  }
  for (int s = n; s < j; s++) {
    q = (abs(a[o + s] - d[o + s - n]) + abs(b[o + s] - e[o + s - n]) + abs(c[o + s] - f[o + s - n])) / 3;

    r = abs(g[o + s] - h[o + s - n]);

    q = q > 1835 ? 1835 : q;
    r = r > 524 ? 524 : r;
    k[p + s] = (uchar)(0.9f * q + (1 - 0.9f) * r);
  }

  for (int s = 0; s < j - n; s++) {
    q = (abs(d[o + s] - a[o + s + n]) + abs(e[o + s] - b[o + s + n]) + abs(f[o + s] - c[o + s + n])) * 0.333f;

    r = abs(h[o] - g[o + s + n]);

    q = q > 1835 ? 1835 : q;
    r = r > 524 ? 524 : r;
    l[p + s] = (uchar)(0.9f * q + (1 - 0.9f) * r);
  }
  for (int s = j - n; s < j; s++) {
    q = (abs(d[o + s] - 255) + abs(e[o + s] - 255) + abs(f[o + s] - 255)) * 0.333f;

    r = abs(h[o + s] - 255);

    q = q > 1835 ? 1835 : q;
    r = r > 524 ? 524 : r;
    l[p + s] = (uchar)(0.9f * q + (1 - 0.9f) * r);
  }
}
__kernel void B(__global const uchar* a, __global const uchar* b, __global const uchar* c, __global const uchar* d, __global const uchar* e, __global const uchar* f, __global const uchar* g, __global const uchar* h, const int i, const int j, __global uchar* k, __global uchar* l) {
  const int m = get_global_id(0) * 16;
  const int n = get_global_id(1);
  const int o = get_global_id(2);

  const int p = (n * j) + m;
  const int q = ((o * i) + n) * j + m;

  uchar16 r = vload16(0, a + p);
  uchar16 s = vload16(0, b + p);
  uchar16 t = vload16(0, c + p);
  uchar16 u = vload16(0, g + p);
  uchar16 v, w, x, y;

  ushort16 z, aa;

  if (m - o >= 0) {
    v = vload16(0, d + p - o);
    w = vload16(0, e + p - o);
    x = vload16(0, f + p - o);
    y = vload16(0, h + p - o);

    z = convert_ushort16(abs(r - v) + abs(s - w) + abs(t - x)) / (ushort)3;

    aa = convert_ushort16(abs(u - y));
  } else {
    z = convert_ushort16(abs(r - (uchar16)255) + abs(s - (uchar16)255) + abs(t - (uchar16)255)) / (ushort)3;

    aa = convert_ushort16(abs(u - (uchar16)255));
  }

  z = z > (ushort16)1835 ? (ushort16)1835 : z;
  aa = aa > (ushort16)524 ? (ushort16)524 : aa;
  ushort16 ab = z / (ushort)9 * (ushort)10 + aa / (ushort)10;
  vstore16(convert_uchar16(ab), 0, k + q);

  r = vload16(0, d + p);
  s = vload16(0, e + p);
  t = vload16(0, f + p);
  u = vload16(0, h + p);

  z = 0;
  aa = 0;

  if (m + o < j) {
    v = vload16(0, a + p + o);
    w = vload16(0, b + p + o);
    x = vload16(0, c + p + o);
    y = vload16(0, g + p + o);

    z = convert_ushort16(abs(r - v) + abs(s - w) + abs(t - x)) / (ushort)3;

    aa = convert_ushort16(abs(u - y));
  } else {
    z = convert_ushort16(abs(r - (uchar16)255) + abs(s - (uchar16)255) + abs(t - (uchar16)255)) / (ushort)3;

    aa = convert_ushort16(abs(u - (uchar16)255));
  }

  z = z > (ushort16)1835 ? (ushort16)1835 : z;
  aa = aa > (ushort16)524 ? (ushort16)524 : aa;
  ab = z / (ushort)9 * (ushort)10 + aa / (ushort)10;
  vstore16(convert_uchar16(ab), 0, l + q);
}
__kernel void C(__global const uchar* a, __global const uchar* b, __global const uchar* c, __global const uchar* d, __global const uchar* e, __global const uchar* f, __global const uchar* g, __global const uchar* h, const int i, const int j, __global uchar* k, __global uchar* l) {
  const int m = get_global_id(0);
  const int n = get_global_id(1);
  const int o = get_global_id(2);

  const int p = n * j + m;
  const int q = ((o * i) + n) * j + m;

  ushort r, s;

  if (m >= o) {
    r = (abs(a[p] - d[p - o]) + abs(b[p] - e[p - o]) + abs(c[p] - f[p - o])) / 3;

    s = abs(g[p] - h[p - o]);
  } else {
    r = (abs(a[p] - 255) + abs(b[p] - 255) + abs(c[p] - 255)) / 3;

    s = abs(g[p] - 255);
  }

  r = r > 1835 ? 1835 : r;
  s = s > 524 ? 524 : s;
  k[q] = (uchar)(0.9f * r + (1 - 0.9f) * s);

  r = 0;
  s = 0;

  if (m >= o) {
    r = (abs(d[p] - a[p + o]) + abs(e[p] - b[p + o]) + abs(f[p] - c[p + o])) / 3;

    s = abs(h[p] - g[p + o]);
  } else {
    r = (abs(d[p] - 255) + abs(e[p] - 255) + abs(f[p] - 255)) / 3;

    s = abs(h[p] - 255);
  }

  r = r > 1835 ? 1835 : r;
  s = s > 524 ? 524 : s;
  l[q] = (uchar)(0.9f * r + (1 - 0.9f) * s);
}
__kernel void D(__global const float* a, __global const float* b, __global const float* c, __global const float* d, __global const float* e, __global const float* f, __global const float* g, __global const float* h, const int i, const int j, __global float* k, __global float* l) {
  const int m = get_global_id(0);
  const int n = get_global_id(1);
  const int o = get_global_id(2);

  const int p = n * j + m;
  const int q = ((o * i) + n) * j + m;

  float r, s;

  if (m >= o) {
    r = (__clc_fabs(a[p] - d[p - o]) + __clc_fabs(b[p] - e[p - o]) + __clc_fabs(c[p] - f[p - o])) / 3;

    s = __clc_fabs(g[p] - h[p - o]);
  } else {
    r = (__clc_fabs(a[p] - 1.0f) + __clc_fabs(b[p] - 1.0f) + __clc_fabs(c[p] - 1.0f)) / 3;

    s = __clc_fabs(g[p] - 1.0f);
  }

  r = r > 0.028f ? 0.028f : r;
  s = s > 0.008f ? 0.008f : s;
  k[q] = (0.9f * r + (1 - 0.9f) * s);

  r = 0;
  s = 0;

  if (m >= o) {
    r = (__clc_fabs(d[p] - a[p + o]) + __clc_fabs(e[p] - b[p + o]) + __clc_fabs(f[p] - c[p + o])) / 3;

    s = __clc_fabs(h[p] - g[p + o]);
  } else {
    r = (__clc_fabs(d[p] - 1.0f) + __clc_fabs(e[p] - 1.0f) + __clc_fabs(f[p] - 1.0f)) / 3;

    s = __clc_fabs(h[p] - 1.0f);
  }

  r = r > 0.028f ? 0.028f : r;
  s = s > 0.008f ? 0.008f : s;
  l[q] = (0.9f * r + (1 - 0.9f) * s);
}
__kernel void E(__global const float* restrict a, __global const float* restrict b, __global const float* restrict c, __global const float* restrict d, const int e, const int f, __global float* restrict g, __global float* restrict h) {
  const int i = get_global_id(0) * 4;
  const int j = get_global_id(1);
  const int k = get_global_id(2);

  int l = j * f + i;
  const int m = ((k * e) + j) * f + i;

  float16 n, o = vload16(0, a + (l * 3));
  float4 p, q = vload4(0, c + l);

  float4 r = 0;
  float4 s = 0;

  if (i - k >= 0) {
    l = j * f + i - k;
    n = vload16(0, b + (l * 3));
    p = vload4(0, d + l);

    o = __clc_fabs(o - n);

    s = __clc_fabs(q - p);
  } else {
    o = __clc_fabs(o - 1.0f);

    s = __clc_fabs(q - 1.0f);
  }
  r = (float4)(os0 + os1 + os2, os3 + os4 + os5, os6 + os7 + os8, os9 + osa + osb) * 0.3333333333f;

  r = r > 0.028f ? 0.028f : r;
  s = s > 0.008f ? 0.008f : s;
  vstore4(0.9f * r + 0.1f * s, 0, g + m);

  l = j * f + i;
  o = vload16(0, b + (l * 3));
  q = vload4(0, d + l);

  s = 0;

  if (i + k < f) {
    l = j * f + i + k;
    n = vload16(0, a + (l * 3));
    p = vload4(0, c + l);

    o = __clc_fabs(o - n);

    s = __clc_fabs(q - p);
  } else {
    o = __clc_fabs(o - 1.0f);

    s = __clc_fabs(q - 1.0f);
  }
  r = (float4)(os0 + os1 + os2, os3 + os4 + os5, os6 + os7 + os8, os9 + osa + osb) * 0.3333333333f;

  r = r > 0.028f ? 0.028f : r;
  s = s > 0.008f ? 0.008f : s;
  vstore4(0.9f * r + 0.1f * s, 0, h + m);
}
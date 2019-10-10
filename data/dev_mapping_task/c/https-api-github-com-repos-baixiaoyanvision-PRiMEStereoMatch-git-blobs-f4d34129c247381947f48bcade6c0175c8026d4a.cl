__kernel void A(__global const uchar* a, __global const uchar* b, __global const uchar* c, __global const uchar* d, __global const uchar* e, __global const uchar* f, __global const uchar* g, __global const uchar* h, const int i, const int j, __global uchar* k, __global uchar* l) {
  const int m = get_global_id(0) * 16;
  const int n = get_global_id(1);
  const int o = get_global_id(2);

  const int p = (n * j) + m;
  const int q = ((o * i) + n) * j + m;

  uchar16 r = vload16(p, a);
  uchar16 s = vload16(p, b);
  uchar16 t = vload16(p, c);
  uchar16 u = vload16(p, g);
  uchar16 v, w, x, y;

  uchar16 z = 0;
  uchar16 aa = 0;

  if (m >= abs(o)) {
    v = vload16(p - o, d);
    w = vload16(p - o, e);
    x = vload16(p - o, f);
    y = vload16(p - o, h);

    z = (abs(r - v) + abs(s - w) + abs(t - x)) / (uchar)3;

    aa = abs(u - y);
  } else {
    z = (abs(r - (uchar)255) + abs(s - (uchar)255) + abs(t - (uchar)255)) / (uchar)3;

    aa = abs(u - (uchar)255);
  }

  z = z > (uchar)7 ? (uchar)7 : z;
  aa = aa > (uchar)2 ? (uchar)2 : aa;
  vstore16((uchar16)0.9f * z + (uchar16)(1 - 0.9f) * aa, q, k);

  r = vload16(p, d);
  s = vload16(p, e);
  t = vload16(p, f);
  u = vload16(p, h);

  z = 0;
  aa = 0;

  if (m >= abs(o)) {
    v = vload16(p - o, a);
    w = vload16(p - o, b);
    x = vload16(p - o, c);
    y = vload16(p - o, g);

    z = (abs(r - v) + abs(s - w) + abs(t - x)) / (uchar)3;

    aa = abs(u - y);
  } else {
    z = (abs(r - (uchar)255) + abs(s - (uchar)255) + abs(t - (uchar)255)) / (uchar)3;

    aa = abs(u - (uchar)255);
  }

  z = z > (uchar)7 ? (uchar)7 : z;
  aa = aa > (uchar)2 ? (uchar)2 : aa;
  vstore16((uchar16)0.9f * z + (uchar16)(1 - 0.9f) * aa, q, l);
}
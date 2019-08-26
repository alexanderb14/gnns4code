uint2 A(const uint2 a, const uint b) {
  return (uint2)((a.x << b) ^ (a.y >> (32 - b)), (a.y << b) ^ (a.x >> (32 - b)));
}
uint2 B(const uint2 a, const uint b) {
  return (uint2)((a.y << b) ^ (a.x >> (32 - b)), (a.x << b) ^ (a.y >> (32 - b)));
}
ulong C(const ulong a) {
  return (a << 1 | a >> 63);
}
__kernel void D(__global const uint* a, __global uint2* b) {
  uint c = get_global_id(0);
  uint d = get_global_id(0) - get_global_offset(0);
  uint e = get_global_size(0);

  uchar f[12];
  f[0] = ((__global uchar*)a)[0];
  *(ulong*)(&f[1]) = c;
  f[9] = ((__global uchar*)a)[9];
  f[10] = ((__global uchar*)a)[10];
  f[11] = ((__global uchar*)a)[11];

  b[0 * e + d] = (uint2)(((uint*)f)[0], ((uint*)f)[1]);
 b[1*e+d] = (uint2)(((uint*)f)[2],a3]);
 b[2*e+d] = (uint2)(a4],a5]);
 b[3*e+d] = (uint2)(a6],a7]);
 b[4*e+d] = (uint2)(a8],a9]);
 b[5*e+d] = (uint2)(a10],a11]);
 b[6*e+d] = (uint2)(a12],a13]);
 b[7*e+d] = (uint2)(a14],a15]);
 b[8*e+d] = (uint2)(a16],a17]);
 b[9*e+d] = (uint2)(a18],a19]);
 uchar4 g = (uchar4)(((__global uchar*)a[80], 1, 0, 0);
 b[10*e+d] = (uint2)(*((uint*)&g);
 b[11*e+d] = (uint2)(0,0);
 b[12*e+d] = (uint2)(0,0);
 b[13*e+d] = (uint2)(0,0);
 b[14*e+d] = (uint2)(0,0);
 b[15*e+d] = (uint2)(0,0);
 b[16*e+d] = (uint2)(0,0x80000000U);
 b[17*e+d] = (uint2)(0,0);
 b[18*e+d] = (uint2)(0,0);
 b[19*e+d] = (uint2)(0,0);
 b[20*e+d] = (uint2)(0,0);
 b[21*e+d] = (uint2)(0,0);
 b[22*e+d] = (uint2)(0,0);
 b[23*e+d] = (uint2)(0,0);
 b[24*e+d] = (uint2)(0,0);
}

__kernel void E(__global uint2* a) {
  uint b = get_global_id(0) - get_global_offset(0);
  uint c = get_global_size(0);

  a[4 * c + b] = (uint2)(1, 0);
  a[5 * c + b] = (uint2)(0, 0);
  a[6 * c + b] = (uint2)(0, 0);
  a[7 * c + b] = (uint2)(0, 0);
  a[8 * c + b] = (uint2)(0, 0);
  a[9 * c + b] = (uint2)(0, 0);
  a[10 * c + b] = (uint2)(0, 0);
  a[11 * c + b] = (uint2)(0, 0);
  a[12 * c + b] = (uint2)(0, 0);
  a[13 * c + b] = (uint2)(0, 0);
  a[14 * c + b] = (uint2)(0, 0);
  a[15 * c + b] = (uint2)(0, 0);
  a[16 * c + b] = (uint2)(0, 0x80000000U);
  a[17 * c + b] = (uint2)(0, 0);
  a[18 * c + b] = (uint2)(0, 0);
  a[19 * c + b] = (uint2)(0, 0);
  a[20 * c + b] = (uint2)(0, 0);
  a[21 * c + b] = (uint2)(0, 0);
  a[22 * c + b] = (uint2)(0, 0);
  a[23 * c + b] = (uint2)(0, 0);
  a[24 * c + b] = (uint2)(0, 0);
}
__kernel void F(__global uint2* a, const uint b) {
  uint c = get_global_id(0) - get_global_offset(0);
  uint d = get_global_size(0);

  uint2 e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac;
  uint2 ad, ae, af, ag, ah, ai, aj;

  e = a[0 * d + c];
  f = a[1 * d + c];
  g = a[2 * d + c];
  h = a[3 * d + c];
  i = a[4 * d + c];
  j = a[5 * d + c];
  k = a[6 * d + c];
  l = a[7 * d + c];
  m = a[8 * d + c];
  n = a[9 * d + c];
  o = a[10 * d + c];
  p = a[11 * d + c];
  q = a[12 * d + c];
  r = a[13 * d + c];
  s = a[14 * d + c];
  t = a[15 * d + c];
  u = a[16 * d + c];
  v = a[17 * d + c];
  w = a[18 * d + c];
  x = a[19 * d + c];
  y = a[20 * d + c];
  z = a[21 * d + c];
  aa = a[22 * d + c];
  ab = a[23 * d + c];
  ac = a[24 * d + c];
  ;
  *((ulong*)&ad) = *((ulong*)&e) ^ *((ulong*)&j) ^ *((ulong*)&o) * *((ulong*)&t) * *((ulong*)&y) ^ C(*((ulong*)&g) ^ *((ulong*)&l) ^ *((ulong*)&q) * *((ulong*)&v) * *((ulong*)&aa));
  *((ulong*)&ae) = *((ulong*)&f) ^ *((ulong*)&k) ^ *((ulong*)&p) * *((ulong*)&u) * *((ulong*)&z) ^ C(*((ulong*)&h) ^ *((ulong*)&m) ^ *((ulong*)&r) * *((ulong*)&w) * *((ulong*)&ab));
  *((ulong*)&af) = *((ulong*)&g) ^ *((ulong*)&l) ^ *((ulong*)&q) * *((ulong*)&v) * *((ulong*)&aa) ^ C(*((ulong*)&i) ^ *((ulong*)&n) ^ *((ulong*)&s) * *((ulong*)&x) * *((ulong*)&ac));
  *((ulong*)&ag) = *((ulong*)&h) ^ *((ulong*)&m) ^ *((ulong*)&r) * *((ulong*)&w) * *((ulong*)&ab) ^ C(*((ulong*)&e) ^ *((ulong*)&j) ^ *((ulong*)&o) * *((ulong*)&t) * *((ulong*)&y));
  *((ulong*)&ah) = *((ulong*)&i) ^ *((ulong*)&n) ^ *((ulong*)&s) * *((ulong*)&x) * *((ulong*)&ac) ^ C(*((ulong*)&f) ^ *((ulong*)&k) ^ *((ulong*)&p) * *((ulong*)&u) * *((ulong*)&z));
  ai = f ^ ad;
  e ^= ah;
  f = B(k ^ ad, 12);
  k = A(n ^ ag, 20);
  n = B(aa ^ ae, 29);
  aa = B(s ^ ag, 7);
  s = A(y ^ ah, 18);
  y = B(g ^ ae, 30);
  g = B(q ^ ae, 11);
  q = A(r ^ af, 25);
  r = A(x ^ ag, 8);
  x = B(ab ^ af, 24);
  ab = B(t ^ ah, 9);
  t = A(i ^ ag, 27);
  i = A(ac ^ ag, 14);
  ac = A(z ^ ad, 2);
  z = B(m ^ af, 23);
  m = B(u ^ ad, 13);
  u = B(j ^ ah, 4);
  j = A(h ^ af, 28);
  h = A(w ^ af, 21);
  w = A(v ^ ae, 15);
  v = A(p ^ ad, 10);
  p = A(l ^ ae, 6);
  l = A(o ^ ah, 3);
  o = A(ai, 1);
  ai = e;
  aj = f;
  e = bitselect(e ^ g, e, f);
  f = bitselect(f ^ h, f, g);
  g = bitselect(g ^ i, g, h);
  h = bitselect(h ^ ai, h, i);
  i = bitselect(i ^ aj, i, ai);
  ai = j;
  aj = k;
  j = bitselect(j ^ l, j, k);
  k = bitselect(k ^ m, k, l);
  l = bitselect(l ^ n, l, m);
  m = bitselect(m ^ ai, m, n);
  n = bitselect(n ^ aj, n, ai);
  ai = o;
  aj = p;
  o = bitselect(o ^ q, o, p);
  p = bitselect(p ^ r, p, q);
  q = bitselect(q ^ s, q, r);
  r = bitselect(r ^ ai, r, s);
  s = bitselect(s ^ aj, s, ai);
  ai = t;
  aj = u;
  t = bitselect(t ^ v, t, u);
  u = bitselect(u ^ w, u, v);
  v = bitselect(v ^ x, v, w);
  w = bitselect(w ^ ai, w, x);
  x = bitselect(x ^ aj, x, ai);
  ai = y;
  aj = z;
  y = bitselect(y ^ aa, y, z);
  z = bitselect(z ^ ab, z, aa);
  aa = bitselect(aa ^ ac, aa, ab);
  ab = bitselect(ab ^ ai, ab, ac);
  ac = bitselect(ac ^ aj, ac, ai);
  e.x ^= 0x00000001;
  ;
  a[0 * d + c] = e;
  a[1 * d + c] = f;
  a[2 * d + c] = g;
  a[3 * d + c] = h;
  a[4 * d + c] = i;
  a[5 * d + c] = j;
  a[6 * d + c] = k;
  a[7 * d + c] = l;
  a[8 * d + c] = m;
  a[9 * d + c] = n;
  a[10 * d + c] = o;
  a[11 * d + c] = p;
  a[12 * d + c] = q;
  a[13 * d + c] = r;
  a[14 * d + c] = s;
  a[15 * d + c] = t;
  a[16 * d + c] = u;
  a[17 * d + c] = v;
  a[18 * d + c] = w;
  a[19 * d + c] = x;
  a[20 * d + c] = y;
  a[21 * d + c] = z;
  a[22 * d + c] = aa;
  a[23 * d + c] = ab;
  a[24 * d + c] = ac;
  ;
}

__kernel void G(__global ulong* a, __global const ulong4* b, const uint c) {
  uint d = get_global_size(0) / 6;
  uint e = get_global_id(0) % d;
  uint f = get_global_id(0) / d * 4;

  ulong g, h, i, j;
  g = a[(f)*d + e];
  h = a[(f + 1) * d + e];
  i = a[(f + 2) * d + e];
  j = a[(f + 3) * d + e];

  ulong4 k = b[g % c] ^ b[h % c] ^ b[i % c] ^ b[j % c];

  a[(f)*d + e] = g ^ k.s0;
  a[(f + 1) * d + e] = h ^ k.s1;
  a[(f + 2) * d + e] = i ^ k.s2;
  a[(f + 3) * d + e] = j ^ k.s3;
}

__kernel void H(__global ulong* restrict a, __global uint2* b, const ulong c) {
  ulong d = get_global_id(0);
  uint e = get_global_id(0) - get_global_offset(0);
  uint f = get_global_size(0);

  uint2 g;
  g = b[(3) * f + e];
  if (*((ulong*)&g) <= c)
    a[a[0x0F]++] = d;
}
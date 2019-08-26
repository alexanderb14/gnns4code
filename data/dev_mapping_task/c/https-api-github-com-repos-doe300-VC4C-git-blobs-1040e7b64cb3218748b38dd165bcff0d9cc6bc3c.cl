typedef struct {
  uchar v[15];
  uchar length;
} phpass_password;

typedef struct { uint v[4]; } phpass_hash;
inline void A(uint8 a, __private uint8* b, __private uint8* c) {
  uint8 d = a << 3;

  uint8 e;
  uint8 f = (uint8)0xefcdab89;
  uint8 g = (uint8)0x98badcfe;
  uint8 h;

  e = (uint8)0xd76aa477 + c[0];
  e = rotate(e, (uint)7);
  e += f;
  h = (g ^ (e & (uint8)0x77777777)) + c[1] + (uint8)0xf8fa0bcc;
  h = rotate(h, (uint)12);
  h += e;
  g = bitselect((f), (e), (h)) + c[2] + (uint8)0xbcdb4dd9;
  g = rotate(g, (uint)17);
  g += h;
  f = bitselect((e), (h), (g)) + c[3] + (uint8)0xb18b7a77;
  f = rotate(f, (uint)22);
  f += g;
  e = rotate(e + c[4] + (uint8)0xf57c0faf + bitselect((h), (g), (f)), (uint)(uint)7) + f;
  ;
  h = rotate(h + c[5] + (uint8)0x4787c62a + bitselect((g), (f), (e)), (uint)(uint)12) + e;
  ;
  g = rotate(g + c[6] + (uint8)0xa8304613 + bitselect((f), (e), (h)), (uint)(uint)17) + h;
  ;
  f = rotate(f + c[7] + (uint8)0xfd469501 + bitselect((e), (h), (g)), (uint)(uint)22) + g;
  ;
  e = rotate(e + 0 + (uint8)0x698098d8 + bitselect((h), (g), (f)), (uint)(uint)7) + f;
  ;
  h = rotate(h + 0 + (uint8)0x8b44f7af + bitselect((g), (f), (e)), (uint)(uint)12) + e;
  ;
  g = rotate(g + 0 + (uint8)0xffff5bb1 + bitselect((f), (e), (h)), (uint)(uint)17) + h;
  ;
  f = rotate(f + 0 + (uint8)0x895cd7be + bitselect((e), (h), (g)), (uint)(uint)22) + g;
  ;
  e = rotate(e + 0 + (uint8)0x6b901122 + bitselect((h), (g), (f)), (uint)(uint)7) + f;
  ;
  h = rotate(h + 0 + (uint8)0xfd987193 + bitselect((g), (f), (e)), (uint)(uint)12) + e;
  ;
  g = rotate(g + d + (uint8)0xa679438e + bitselect((f), (e), (h)), (uint)(uint)17) + h;
  ;
  f = rotate(f + 0 + (uint8)0x49b40821 + bitselect((e), (h), (g)), (uint)(uint)22) + g;
  ;

  e = rotate(e + c[1] + (uint8)0xf61e2562 + bitselect((g), (f), (h)), (uint)(uint)5) + f;
  ;
  h = rotate(h + c[6] + (uint8)0xc040b340 + bitselect((f), (e), (g)), (uint)(uint)9) + e;
  ;
  g = rotate(g + 0 + (uint8)0x265e5a51 + bitselect((e), (h), (f)), (uint)(uint)14) + h;
  ;
  f = rotate(f + c[0] + (uint8)0xe9b6c7aa + bitselect((h), (g), (e)), (uint)(uint)20) + g;
  ;
  e = rotate(e + c[5] + (uint8)0xd62f105d + bitselect((g), (f), (h)), (uint)(uint)5) + f;
  ;
  h = rotate(h + 0 + (uint8)0x2441453 + bitselect((f), (e), (g)), (uint)(uint)9) + e;
  ;
  g = rotate(g + 0 + (uint8)0xd8a1e681 + bitselect((e), (h), (f)), (uint)(uint)14) + h;
  ;
  f = rotate(f + c[4] + (uint8)0xe7d3fbc8 + bitselect((h), (g), (e)), (uint)(uint)20) + g;
  ;
  e = rotate(e + 0 + (uint8)0x21e1cde6 + bitselect((g), (f), (h)), (uint)(uint)5) + f;
  ;
  h = rotate(h + d + (uint8)0xc33707d6 + bitselect((f), (e), (g)), (uint)(uint)9) + e;
  ;
  g = rotate(g + c[3] + (uint8)0xf4d50d87 + bitselect((e), (h), (f)), (uint)(uint)14) + h;
  ;
  f = rotate(f + 0 + (uint8)0x455a14ed + bitselect((h), (g), (e)), (uint)(uint)20) + g;
  ;
  e = rotate(e + 0 + (uint8)0xa9e3e905 + bitselect((g), (f), (h)), (uint)(uint)5) + f;
  ;
  h = rotate(h + c[2] + (uint8)0xfcefa3f8 + bitselect((f), (e), (g)), (uint)(uint)9) + e;
  ;
  g = rotate(g + c[7] + (uint8)0x676f02d9 + bitselect((e), (h), (f)), (uint)(uint)14) + h;
  ;
  f = rotate(f + 0 + (uint8)0x8d2a4c8a + bitselect((h), (g), (e)), (uint)(uint)20) + g;
  ;

  e = rotate(e + c[5] + (uint8)0xfffa3942 + (((f) ^ (g)) ^ (h)), (uint)(uint)4) + f;
  ;
  h = rotate(h + 0 + (uint8)0x8771f681 + ((e) ^ ((f) ^ (g))), (uint)(uint)11) + e;
  ;
  g = rotate(g + 0 + (uint8)0x6d9d6122 + (((h) ^ (e)) ^ (f)), (uint)(uint)16) + h;
  ;
  f = rotate(f + d + (uint8)0xfde5380c + ((g) ^ ((h) ^ (e))), (uint)(uint)23) + g;
  ;
  e = rotate(e + c[1] + (uint8)0xa4beea44 + (((f) ^ (g)) ^ (h)), (uint)(uint)4) + f;
  ;
  h = rotate(h + c[4] + (uint8)0x4bdecfa9 + ((e) ^ ((f) ^ (g))), (uint)(uint)11) + e;
  ;
  g = rotate(g + c[7] + (uint8)0xf6bb4b60 + (((h) ^ (e)) ^ (f)), (uint)(uint)16) + h;
  ;
  f = rotate(f + 0 + (uint8)0xbebfbc70 + ((g) ^ ((h) ^ (e))), (uint)(uint)23) + g;
  ;
  e = rotate(e + 0 + (uint8)0x289b7ec6 + (((f) ^ (g)) ^ (h)), (uint)(uint)4) + f;
  ;
  h = rotate(h + c[0] + (uint8)0xeaa127fa + ((e) ^ ((f) ^ (g))), (uint)(uint)11) + e;
  ;
  g = rotate(g + c[3] + (uint8)0xd4ef3085 + (((h) ^ (e)) ^ (f)), (uint)(uint)16) + h;
  ;
  f = rotate(f + c[6] + (uint8)0x4881d05 + ((g) ^ ((h) ^ (e))), (uint)(uint)23) + g;
  ;
  e = rotate(e + 0 + (uint8)0xd9d4d039 + (((f) ^ (g)) ^ (h)), (uint)(uint)4) + f;
  ;
  h = rotate(h + 0 + (uint8)0xe6db99e5 + ((e) ^ ((f) ^ (g))), (uint)(uint)11) + e;
  ;
  g = rotate(g + 0 + (uint8)0x1fa27cf8 + (((h) ^ (e)) ^ (f)), (uint)(uint)16) + h;
  ;
  f = rotate(f + c[2] + (uint8)0xc4ac5665 + ((g) ^ ((h) ^ (e))), (uint)(uint)23) + g;
  ;

  e = rotate(e + c[0] + (uint8)0xf4292244 + ((g) ^ ((f) | (~h))), (uint)(uint)6) + f;
  ;
  h = rotate(h + c[7] + (uint8)0x432aff97 + ((f) ^ ((e) | (~g))), (uint)(uint)10) + e;
  ;
  g = rotate(g + d + (uint8)0xab9423a7 + ((e) ^ ((h) | (~f))), (uint)(uint)15) + h;
  ;
  f = rotate(f + c[5] + (uint8)0xfc93a039 + ((h) ^ ((g) | (~e))), (uint)(uint)21) + g;
  ;
  e = rotate(e + 0 + (uint8)0x655b59c3 + ((g) ^ ((f) | (~h))), (uint)(uint)6) + f;
  ;
  h = rotate(h + c[3] + (uint8)0x8f0ccc92 + ((f) ^ ((e) | (~g))), (uint)(uint)10) + e;
  ;
  g = rotate(g + 0 + (uint8)0xffeff47d + ((e) ^ ((h) | (~f))), (uint)(uint)15) + h;
  ;
  f = rotate(f + c[1] + (uint8)0x85845dd1 + ((h) ^ ((g) | (~e))), (uint)(uint)21) + g;
  ;
  e = rotate(e + 0 + (uint8)0x6fa87e4f + ((g) ^ ((f) | (~h))), (uint)(uint)6) + f;
  ;
  h = rotate(h + 0 + (uint8)0xfe2ce6e0 + ((f) ^ ((e) | (~g))), (uint)(uint)10) + e;
  ;
  g = rotate(g + c[6] + (uint8)0xa3014314 + ((e) ^ ((h) | (~f))), (uint)(uint)15) + h;
  ;
  f = rotate(f + 0 + (uint8)0x4e0811a1 + ((h) ^ ((g) | (~e))), (uint)(uint)21) + g;
  ;
  e = rotate(e + c[4] + (uint8)0xf7537e82 + ((g) ^ ((f) | (~h))), (uint)(uint)6) + f;
  ;
  h = rotate(h + 0 + (uint8)0xbd3af235 + ((f) ^ ((e) | (~g))), (uint)(uint)10) + e;
  ;
  g = rotate(g + c[2] + (uint8)0x2ad7d2bb + ((e) ^ ((h) | (~f))), (uint)(uint)15) + h;
  ;
  f = rotate(f + 0 + (uint8)0xeb86d391 + ((h) ^ ((g) | (~e))), (uint)(uint)21) + g;
  ;

  b[0] = e + (uint8)0x67452301;
  b[1] = f + (uint8)0xefcdab89;
  b[2] = g + (uint8)0x98badcfe;
  b[3] = h + (uint8)0x10325476;
}

inline void B(__private uint8* a) {
  uint8 b = (uint8)(0, 0, 0, 0, 0, 0, 0, 0);
  for (int c = 0; c < 8; c++)
    a[c] = b;
}
inline void C(__private uint* a) {
  for (int b = 0; b < 8; b++)
    a[b] = 0;
}

__kernel void D(__global const phpass_password* a, __global phpass_hash* b, __global const char* c) {
  uint8 d[8], e;
  uint f[8], g, h = get_global_id(0);
  uint i = 1 << c[8 + 3];

  B(d);

  __global const uchar* j = a[h * 8 + 0].v;
  __global const uchar* k = a[h * 8 + 1].v;
  __global const uchar* l = a[h * 8 + 2].v;
  __global const uchar* m = a[h * 8 + 3].v;

  __global const uchar* n = a[h * 8 + 4].v;
  __global const uchar* o = a[h * 8 + 5].v;
  __global const uchar* p = a[h * 8 + 6].v;
  __global const uchar* q = a[h * 8 + 7].v;

  e.s0 = (uint)a[h * 8 + 0].length;
  e.s1 = (uint)a[h * 8 + 1].length;
  e.s2 = (uint)a[h * 8 + 2].length;
  e.s3 = (uint)a[h * 8 + 3].length;

  e.s4 = (uint)a[h * 8 + 4].length;
  e.s5 = (uint)a[h * 8 + 5].length;
  e.s6 = (uint)a[h * 8 + 6].length;
  e.s7 = (uint)a[h * 8 + 7].length;

  __private uchar* r = (uchar*)f;
  C(f);
  for (g = 0; g < 8; g++)
    r[g] = c[g];
  for (g = 8; g < 8 + e.s0; g++)
    r[g] = j[g - 8];
  for (g = 0; g < 8; g++)
    d[g].s0 = f[g];
  ;
  C(f);
  for (g = 0; g < 8; g++)
    r[g] = c[g];
  for (g = 8; g < 8 + e.s1; g++)
    r[g] = k[g - 8];
  for (g = 0; g < 8; g++)
    d[g].s1 = f[g];
  ;
  C(f);
  for (g = 0; g < 8; g++)
    r[g] = c[g];
  for (g = 8; g < 8 + e.s2; g++)
    r[g] = l[g - 8];
  for (g = 0; g < 8; g++)
    d[g].s2 = f[g];
  ;
  C(f);
  for (g = 0; g < 8; g++)
    r[g] = c[g];
  for (g = 8; g < 8 + e.s3; g++)
    r[g] = m[g - 8];
  for (g = 0; g < 8; g++)
    d[g].s3 = f[g];
  ;
  C(f);
  for (g = 0; g < 8; g++)
    r[g] = c[g];
  for (g = 8; g < 8 + e.s4; g++)
    r[g] = n[g - 8];
  for (g = 0; g < 8; g++)
    d[g].s4 = f[g];
  ;
  C(f);
  for (g = 0; g < 8; g++)
    r[g] = c[g];
  for (g = 8; g < 8 + e.s5; g++)
    r[g] = o[g - 8];
  for (g = 0; g < 8; g++)
    d[g].s5 = f[g];
  ;
  C(f);
  for (g = 0; g < 8; g++)
    r[g] = c[g];
  for (g = 8; g < 8 + e.s6; g++)
    r[g] = p[g - 8];
  for (g = 0; g < 8; g++)
    d[g].s6 = f[g];
  ;
  C(f);
  for (g = 0; g < 8; g++)
    r[g] = c[g];
  for (g = 8; g < 8 + e.s7; g++)
    r[g] = q[g - 8];
  for (g = 0; g < 8; g++)
    d[g].s7 = f[g];
  ;

  uint8 s = e + (uint8)(8);

  d[s.s0 / 4].s0 |= (((uint)0x80) << ((s.s0 & 0x3) << 3));
  d[s.s1 / 4].s1 |= (((uint)0x80) << ((s.s1 & 0x3) << 3));
  d[s.s2 / 4].s2 |= (((uint)0x80) << ((s.s2 & 0x3) << 3));
  d[s.s3 / 4].s3 |= (((uint)0x80) << ((s.s3 & 0x3) << 3));
  d[s.s4 / 4].s4 |= (((uint)0x80) << ((s.s4 & 0x3) << 3));
  d[s.s5 / 4].s5 |= (((uint)0x80) << ((s.s5 & 0x3) << 3));
  d[s.s6 / 4].s6 |= (((uint)0x80) << ((s.s6 & 0x3) << 3));
  d[s.s7 / 4].s7 |= (((uint)0x80) << ((s.s7 & 0x3) << 3));

  A(s, d, d);
  C(f);
  for (g = 0; g < e.s0; g++)
    r[g] = j[g];
  for (g = 0; g < 4; g++)
    d[g + 4].s0 = f[g];
  ;
  C(f);
  for (g = 0; g < e.s1; g++)
    r[g] = k[g];
  for (g = 0; g < 4; g++)
    d[g + 4].s1 = f[g];
  ;
  C(f);
  for (g = 0; g < e.s2; g++)
    r[g] = l[g];
  for (g = 0; g < 4; g++)
    d[g + 4].s2 = f[g];
  ;
  C(f);
  for (g = 0; g < e.s3; g++)
    r[g] = m[g];
  for (g = 0; g < 4; g++)
    d[g + 4].s3 = f[g];
  ;
  C(f);
  for (g = 0; g < e.s4; g++)
    r[g] = n[g];
  for (g = 0; g < 4; g++)
    d[g + 4].s4 = f[g];
  ;
  C(f);
  for (g = 0; g < e.s5; g++)
    r[g] = o[g];
  for (g = 0; g < 4; g++)
    d[g + 4].s5 = f[g];
  ;
  C(f);
  for (g = 0; g < e.s6; g++)
    r[g] = p[g];
  for (g = 0; g < 4; g++)
    d[g + 4].s6 = f[g];
  ;
  C(f);
  for (g = 0; g < e.s7; g++)
    r[g] = q[g];
  for (g = 0; g < 4; g++)
    d[g + 4].s7 = f[g];
  ;

  s = (uint8)(16) + e;
  d[s.s0 / 4].s0 |= (((uint)0x80) << ((s.s0 & 0x3) << 3));
  d[s.s1 / 4].s1 |= (((uint)0x80) << ((s.s1 & 0x3) << 3));
  d[s.s2 / 4].s2 |= (((uint)0x80) << ((s.s2 & 0x3) << 3));
  d[s.s3 / 4].s3 |= (((uint)0x80) << ((s.s3 & 0x3) << 3));
  d[s.s4 / 4].s4 |= (((uint)0x80) << ((s.s4 & 0x3) << 3));
  d[s.s5 / 4].s5 |= (((uint)0x80) << ((s.s5 & 0x3) << 3));
  d[s.s6 / 4].s6 |= (((uint)0x80) << ((s.s6 & 0x3) << 3));
  d[s.s7 / 4].s7 |= (((uint)0x80) << ((s.s7 & 0x3) << 3));
  uint8 t, u, v, w, x, y, z, aa, ab, ac, ad, ae;
  uint8 af = s << 3;
  x = d[0];
  y = d[1];
  z = d[2];
  aa = d[3];
  ab = d[4];
  ac = d[5];
  ad = d[6];
  ae = d[7];
  do {
    u = (uint8)0xefcdab89;
    v = (uint8)0x98badcfe;

    t = (uint8)0xd76aa477 + x;
    t = rotate(t, (uint)7);
    t += u;
    w = (v ^ (t & (uint8)0x77777777)) + y + (uint8)0xf8fa0bcc;
    w = rotate(w, (uint)12);
    w += t;
    v = bitselect((u), (t), (w)) + z + (uint8)0xbcdb4dd9;
    v = rotate(v, (uint)17);
    v += w;
    u = bitselect((t), (w), (v)) + aa + (uint8)0xb18b7a77;
    u = rotate(u, (uint)22);
    u += v;
    t = rotate(t + ab + (uint8)0xf57c0faf + bitselect((w), (v), (u)), (uint)(uint)7) + u;
    ;
    w = rotate(w + ac + (uint8)0x4787c62a + bitselect((v), (u), (t)), (uint)(uint)12) + t;
    ;
    v = rotate(v + ad + (uint8)0xa8304613 + bitselect((u), (t), (w)), (uint)(uint)17) + w;
    ;
    u = rotate(u + ae + (uint8)0xfd469501 + bitselect((t), (w), (v)), (uint)(uint)22) + v;
    ;
    { t = rotate(t + (uint8)0x698098d8 + bitselect((w), (v), (u)), (uint)7) + u; };
    { w = rotate(w + (uint8)0x8b44f7af + bitselect((v), (u), (t)), (uint)12) + t; };
    { v = rotate(v + (uint8)0xffff5bb1 + bitselect((u), (t), (w)), (uint)17) + w; };
    { u = rotate(u + (uint8)0x895cd7be + bitselect((t), (w), (v)), (uint)22) + v; };
    { t = rotate(t + (uint8)0x6b901122 + bitselect((w), (v), (u)), (uint)7) + u; };
    { w = rotate(w + (uint8)0xfd987193 + bitselect((v), (u), (t)), (uint)12) + t; };
    v = rotate(v + af + (uint8)0xa679438e + bitselect((u), (t), (w)), (uint)(uint)17) + w;
    ;
    { u = rotate(u + (uint8)0x49b40821 + bitselect((t), (w), (v)), (uint)22) + v; };

    t = rotate(t + y + (uint8)0xf61e2562 + bitselect((v), (u), (w)), (uint)(uint)5) + u;
    ;
    w = rotate(w + ad + (uint8)0xc040b340 + bitselect((u), (t), (v)), (uint)(uint)9) + t;
    ;
    { v = rotate(v + (uint8)0x265e5a51 + bitselect((t), (w), (u)), (uint)14) + w; };
    u = rotate(u + x + (uint8)0xe9b6c7aa + bitselect((w), (v), (t)), (uint)(uint)20) + v;
    ;
    t = rotate(t + ac + (uint8)0xd62f105d + bitselect((v), (u), (w)), (uint)(uint)5) + u;
    ;
    { w = rotate(w + (uint8)0x2441453 + bitselect((u), (t), (v)), (uint)9) + t; };
    { v = rotate(v + (uint8)0xd8a1e681 + bitselect((t), (w), (u)), (uint)14) + w; };
    u = rotate(u + ab + (uint8)0xe7d3fbc8 + bitselect((w), (v), (t)), (uint)(uint)20) + v;
    ;
    { t = rotate(t + (uint8)0x21e1cde6 + bitselect((v), (u), (w)), (uint)5) + u; };
    w = rotate(w + af + (uint8)0xc33707d6 + bitselect((u), (t), (v)), (uint)(uint)9) + t;
    ;
    v = rotate(v + aa + (uint8)0xf4d50d87 + bitselect((t), (w), (u)), (uint)(uint)14) + w;
    ;
    { u = rotate(u + (uint8)0x455a14ed + bitselect((w), (v), (t)), (uint)20) + v; };
    { t = rotate(t + (uint8)0xa9e3e905 + bitselect((v), (u), (w)), (uint)5) + u; };
    w = rotate(w + z + (uint8)0xfcefa3f8 + bitselect((u), (t), (v)), (uint)(uint)9) + t;
    ;
    v = rotate(v + ae + (uint8)0x676f02d9 + bitselect((t), (w), (u)), (uint)(uint)14) + w;
    ;
    { u = rotate(u + (uint8)0x8d2a4c8a + bitselect((w), (v), (t)), (uint)20) + v; };

    t = rotate(t + ac + (uint8)0xfffa3942 + (((u) ^ (v)) ^ (w)), (uint)(uint)4) + u;
    ;
    { w = rotate(w + (uint8)0x8771f681 + (((t) ^ (u)) ^ (v)), (uint)11) + t; };
    { v = rotate(v + (uint8)0x6d9d6122 + (((w) ^ (t)) ^ (u)), (uint)16) + w; };
    u = rotate(u + af + (uint8)0xfde5380c + (((v) ^ (w)) ^ (t)), (uint)(uint)23) + v;
    ;
    t = rotate(t + y + (uint8)0xa4beea44 + (((u) ^ (v)) ^ (w)), (uint)(uint)4) + u;
    ;
    w = rotate(w + ab + (uint8)0x4bdecfa9 + (((t) ^ (u)) ^ (v)), (uint)(uint)11) + t;
    ;
    v = rotate(v + ae + (uint8)0xf6bb4b60 + (((w) ^ (t)) ^ (u)), (uint)(uint)16) + w;
    ;
    { u = rotate(u + (uint8)0xbebfbc70 + (((v) ^ (w)) ^ (t)), (uint)23) + v; };
    { t = rotate(t + (uint8)0x289b7ec6 + (((u) ^ (v)) ^ (w)), (uint)4) + u; };
    w = rotate(w + x + (uint8)0xeaa127fa + (((t) ^ (u)) ^ (v)), (uint)(uint)11) + t;
    ;
    v = rotate(v + aa + (uint8)0xd4ef3085 + (((w) ^ (t)) ^ (u)), (uint)(uint)16) + w;
    ;
    u = rotate(u + ad + (uint8)0x4881d05 + (((v) ^ (w)) ^ (t)), (uint)(uint)23) + v;
    ;
    { t = rotate(t + (uint8)0xd9d4d039 + (((u) ^ (v)) ^ (w)), (uint)4) + u; };
    { w = rotate(w + (uint8)0xe6db99e5 + (((t) ^ (u)) ^ (v)), (uint)11) + t; };
    { v = rotate(v + (uint8)0x1fa27cf8 + (((w) ^ (t)) ^ (u)), (uint)16) + w; };
    u = rotate(u + z + (uint8)0xc4ac5665 + (((v) ^ (w)) ^ (t)), (uint)(uint)23) + v;
    ;

    t = rotate(t + x + (uint8)0xf4292244 + ((v) ^ ((u) | (~w))), (uint)(uint)6) + u;
    ;
    w = rotate(w + ae + (uint8)0x432aff97 + ((u) ^ ((t) | (~v))), (uint)(uint)10) + t;
    ;
    v = rotate(v + af + (uint8)0xab9423a7 + ((t) ^ ((w) | (~u))), (uint)(uint)15) + w;
    ;
    u = rotate(u + ac + (uint8)0xfc93a039 + ((w) ^ ((v) | (~t))), (uint)(uint)21) + v;
    ;
    { t = rotate(t + (uint8)0x655b59c3 + ((v) ^ ((u) | (~w))), (uint)6) + u; };
    w = rotate(w + aa + (uint8)0x8f0ccc92 + ((u) ^ ((t) | (~v))), (uint)(uint)10) + t;
    ;
    { v = rotate(v + (uint8)0xffeff47d + ((t) ^ ((w) | (~u))), (uint)15) + w; };
    u = rotate(u + y + (uint8)0x85845dd1 + ((w) ^ ((v) | (~t))), (uint)(uint)21) + v;
    ;
    { t = rotate(t + (uint8)0x6fa87e4f + ((v) ^ ((u) | (~w))), (uint)6) + u; };
    { w = rotate(w + (uint8)0xfe2ce6e0 + ((u) ^ ((t) | (~v))), (uint)10) + t; };
    v = rotate(v + ad + (uint8)0xa3014314 + ((t) ^ ((w) | (~u))), (uint)(uint)15) + w;
    ;
    { u = rotate(u + (uint8)0x4e0811a1 + ((w) ^ ((v) | (~t))), (uint)21) + v; };
    t = rotate(t + ab + (uint8)0xf7537e82 + ((v) ^ ((u) | (~w))), (uint)(uint)6) + u;
    ;
    { w = rotate(w + (uint8)0xbd3af235 + ((u) ^ ((t) | (~v))), (uint)10) + t; };
    v = rotate(v + z + (uint8)0x2ad7d2bb + ((t) ^ ((w) | (~u))), (uint)(uint)15) + w;
    ;
    { u = rotate(u + (uint8)0xeb86d391 + ((w) ^ ((v) | (~t))), (uint)21) + v; };

    x = t + (uint8)0x67452301;
    y = u + (uint8)0xefcdab89;
    z = v + (uint8)0x98badcfe;
    aa = w + (uint8)0x10325476;
  } while (--i);
  b[h * 8 + 0].v[0] = x.s0;
  b[h * 8 + 0].v[1] = y.s0;
  b[h * 8 + 0].v[2] = z.s0;
  b[h * 8 + 0].v[3] = aa.s0;
  b[h * 8 + 1].v[0] = x.s1;
  b[h * 8 + 1].v[1] = y.s1;
  b[h * 8 + 1].v[2] = z.s1;
  b[h * 8 + 1].v[3] = aa.s1;
  b[h * 8 + 2].v[0] = x.s2;
  b[h * 8 + 2].v[1] = y.s2;
  b[h * 8 + 2].v[2] = z.s2;
  b[h * 8 + 2].v[3] = aa.s2;
  b[h * 8 + 3].v[0] = x.s3;
  b[h * 8 + 3].v[1] = y.s3;
  b[h * 8 + 3].v[2] = z.s3;
  b[h * 8 + 3].v[3] = aa.s3;
  b[h * 8 + 4].v[0] = x.s4;
  b[h * 8 + 4].v[1] = y.s4;
  b[h * 8 + 4].v[2] = z.s4;
  b[h * 8 + 4].v[3] = aa.s4;
  b[h * 8 + 5].v[0] = x.s5;
  b[h * 8 + 5].v[1] = y.s5;
  b[h * 8 + 5].v[2] = z.s5;
  b[h * 8 + 5].v[3] = aa.s5;
  b[h * 8 + 6].v[0] = x.s6;
  b[h * 8 + 6].v[1] = y.s6;
  b[h * 8 + 6].v[2] = z.s6;
  b[h * 8 + 6].v[3] = aa.s6;
  b[h * 8 + 7].v[0] = x.s7;
  b[h * 8 + 7].v[1] = y.s7;
  b[h * 8 + 7].v[2] = z.s7;
  b[h * 8 + 7].v[3] = aa.s7;
}
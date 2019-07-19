inline uint A(uint16 a) {
  uint b;
  uint c = (__builtin_astype(__builtin_astype(a.s0, uchar4).wzyx, uint));
  uint d = (__builtin_astype(__builtin_astype(a.s1, uchar4).wzyx, uint));
  uint e = (__builtin_astype(__builtin_astype(a.s2, uchar4).wzyx, uint));
  uint f = (__builtin_astype(__builtin_astype(a.s3, uchar4).wzyx, uint));
  uint g = (__builtin_astype(__builtin_astype(a.s4, uchar4).wzyx, uint));
  uint h = (__builtin_astype(__builtin_astype(a.s5, uchar4).wzyx, uint));
  uint i = (__builtin_astype(__builtin_astype(a.s6, uchar4).wzyx, uint));
  uint j = (__builtin_astype(__builtin_astype(a.s7, uchar4).wzyx, uint));
  uint k = (__builtin_astype(__builtin_astype(a.s8, uchar4).wzyx, uint));
  uint l = (__builtin_astype(__builtin_astype(a.s9, uchar4).wzyx, uint));
  uint m = (__builtin_astype(__builtin_astype(a.sA, uchar4).wzyx, uint));
  uint n = (__builtin_astype(__builtin_astype(a.sB, uchar4).wzyx, uint));
  uint o = (__builtin_astype(__builtin_astype(a.sC, uchar4).wzyx, uint));
  uint p = (__builtin_astype(__builtin_astype(a.sD, uchar4).wzyx, uint));
  uint q = (__builtin_astype(__builtin_astype(a.sE, uchar4).wzyx, uint));
  uint r = (__builtin_astype(__builtin_astype(a.sF, uchar4).wzyx, uint));

  uint s = 0x6A09E667;
  uint t = 0xBB67AE85;
  uint u = 0x3C6EF372;
  uint v = 0xA54FF53A;
  uint w = 0x510E527F;
  uint x = 0x9B05688C;
  uint y = 0x1F83D9AB;
  uint z = 0x5BE0CD19;

  {
    b = z + (rotate(w, (uint)26) ^ rotate(w, (uint)21) ^ rotate(w, (uint)7)) + bitselect(y, x, w) + (0x428A2F98 + c);
    v += b;
    z = b + (rotate(s, (uint)30) ^ rotate(s, (uint)19) ^ rotate(s, (uint)10)) + bitselect(u, s, u ^ t);
  };
  {
    b = y + (rotate(v, (uint)26) ^ rotate(v, (uint)21) ^ rotate(v, (uint)7)) + bitselect(x, w, v) + (0x71374491 + d);
    u += b;
    y = b + (rotate(z, (uint)30) ^ rotate(z, (uint)19) ^ rotate(z, (uint)10)) + bitselect(t, z, t ^ s);
  };
  {
    b = x + (rotate(u, (uint)26) ^ rotate(u, (uint)21) ^ rotate(u, (uint)7)) + bitselect(w, v, u) + (0xB5C0FBCF + e);
    t += b;
    x = b + (rotate(y, (uint)30) ^ rotate(y, (uint)19) ^ rotate(y, (uint)10)) + bitselect(s, y, s ^ z);
  };
  {
    b = w + (rotate(t, (uint)26) ^ rotate(t, (uint)21) ^ rotate(t, (uint)7)) + bitselect(v, u, t) + (0xE9B5DBA5 + f);
    s += b;
    w = b + (rotate(x, (uint)30) ^ rotate(x, (uint)19) ^ rotate(x, (uint)10)) + bitselect(z, x, z ^ y);
  };
  {
    b = v + (rotate(s, (uint)26) ^ rotate(s, (uint)21) ^ rotate(s, (uint)7)) + bitselect(u, t, s) + (0x3956C25B + g);
    z += b;
    v = b + (rotate(w, (uint)30) ^ rotate(w, (uint)19) ^ rotate(w, (uint)10)) + bitselect(y, w, y ^ x);
  };
  {
    b = u + (rotate(z, (uint)26) ^ rotate(z, (uint)21) ^ rotate(z, (uint)7)) + bitselect(t, s, z) + (0x59F111F1 + h);
    y += b;
    u = b + (rotate(v, (uint)30) ^ rotate(v, (uint)19) ^ rotate(v, (uint)10)) + bitselect(x, v, x ^ w);
  };
  {
    b = t + (rotate(y, (uint)26) ^ rotate(y, (uint)21) ^ rotate(y, (uint)7)) + bitselect(s, z, y) + (0x923F82A4 + i);
    x += b;
    t = b + (rotate(u, (uint)30) ^ rotate(u, (uint)19) ^ rotate(u, (uint)10)) + bitselect(w, u, w ^ v);
  };
  {
    b = s + (rotate(x, (uint)26) ^ rotate(x, (uint)21) ^ rotate(x, (uint)7)) + bitselect(z, y, x) + (0xAB1C5ED5 + j);
    w += b;
    s = b + (rotate(t, (uint)30) ^ rotate(t, (uint)19) ^ rotate(t, (uint)10)) + bitselect(v, t, v ^ u);
  };
  {
    b = z + (rotate(w, (uint)26) ^ rotate(w, (uint)21) ^ rotate(w, (uint)7)) + bitselect(y, x, w) + (0xD807AA98 + k);
    v += b;
    z = b + (rotate(s, (uint)30) ^ rotate(s, (uint)19) ^ rotate(s, (uint)10)) + bitselect(u, s, u ^ t);
  };
  {
    b = y + (rotate(v, (uint)26) ^ rotate(v, (uint)21) ^ rotate(v, (uint)7)) + bitselect(x, w, v) + (0x12835B01 + l);
    u += b;
    y = b + (rotate(z, (uint)30) ^ rotate(z, (uint)19) ^ rotate(z, (uint)10)) + bitselect(t, z, t ^ s);
  };
  {
    b = x + (rotate(u, (uint)26) ^ rotate(u, (uint)21) ^ rotate(u, (uint)7)) + bitselect(w, v, u) + (0x243185BE + m);
    t += b;
    x = b + (rotate(y, (uint)30) ^ rotate(y, (uint)19) ^ rotate(y, (uint)10)) + bitselect(s, y, s ^ z);
  };
  {
    b = w + (rotate(t, (uint)26) ^ rotate(t, (uint)21) ^ rotate(t, (uint)7)) + bitselect(v, u, t) + (0x550C7DC3 + n);
    s += b;
    w = b + (rotate(x, (uint)30) ^ rotate(x, (uint)19) ^ rotate(x, (uint)10)) + bitselect(z, x, z ^ y);
  };
  {
    b = v + (rotate(s, (uint)26) ^ rotate(s, (uint)21) ^ rotate(s, (uint)7)) + bitselect(u, t, s) + (0x72BE5D74 + o);
    z += b;
    v = b + (rotate(w, (uint)30) ^ rotate(w, (uint)19) ^ rotate(w, (uint)10)) + bitselect(y, w, y ^ x);
  };
  {
    b = u + (rotate(z, (uint)26) ^ rotate(z, (uint)21) ^ rotate(z, (uint)7)) + bitselect(t, s, z) + (0x80DEB1FE + p);
    y += b;
    u = b + (rotate(v, (uint)30) ^ rotate(v, (uint)19) ^ rotate(v, (uint)10)) + bitselect(x, v, x ^ w);
  };
  {
    b = t + (rotate(y, (uint)26) ^ rotate(y, (uint)21) ^ rotate(y, (uint)7)) + bitselect(s, z, y) + (0x9BDC06A7 + q);
    x += b;
    t = b + (rotate(u, (uint)30) ^ rotate(u, (uint)19) ^ rotate(u, (uint)10)) + bitselect(w, u, w ^ v);
  };
  {
    b = s + (rotate(x, (uint)26) ^ rotate(x, (uint)21) ^ rotate(x, (uint)7)) + bitselect(z, y, x) + (0xC19BF174 + r);
    w += b;
    s = b + (rotate(t, (uint)30) ^ rotate(t, (uint)19) ^ rotate(t, (uint)10)) + bitselect(v, t, v ^ u);
  };

  {
    b = z + (rotate(w, (uint)26) ^ rotate(w, (uint)21) ^ rotate(w, (uint)7)) + bitselect(y, x, w) + (0xE49B69C1 + (c = (rotate(q, (uint)15) ^ rotate(q, (uint)13) ^ ((q) >> 10)) + l + (rotate(d, (uint)25) ^ rotate(d, (uint)14) ^ ((d) >> 3)) + c));
    v += b;
    z = b + (rotate(s, (uint)30) ^ rotate(s, (uint)19) ^ rotate(s, (uint)10)) + bitselect(u, s, u ^ t);
  };
  {
    b = y + (rotate(v, (uint)26) ^ rotate(v, (uint)21) ^ rotate(v, (uint)7)) + bitselect(x, w, v) + (0xEFBE4786 + (d = (rotate(r, (uint)15) ^ rotate(r, (uint)13) ^ ((r) >> 10)) + m + (rotate(e, (uint)25) ^ rotate(e, (uint)14) ^ ((e) >> 3)) + d));
    u += b;
    y = b + (rotate(z, (uint)30) ^ rotate(z, (uint)19) ^ rotate(z, (uint)10)) + bitselect(t, z, t ^ s);
  };
  {
    b = x + (rotate(u, (uint)26) ^ rotate(u, (uint)21) ^ rotate(u, (uint)7)) + bitselect(w, v, u) + (0x0FC19DC6 + (e = (rotate(c, (uint)15) ^ rotate(c, (uint)13) ^ ((c) >> 10)) + n + (rotate(f, (uint)25) ^ rotate(f, (uint)14) ^ ((f) >> 3)) + e));
    t += b;
    x = b + (rotate(y, (uint)30) ^ rotate(y, (uint)19) ^ rotate(y, (uint)10)) + bitselect(s, y, s ^ z);
  };
  {
    b = w + (rotate(t, (uint)26) ^ rotate(t, (uint)21) ^ rotate(t, (uint)7)) + bitselect(v, u, t) + (0x240CA1CC + (f = (rotate(d, (uint)15) ^ rotate(d, (uint)13) ^ ((d) >> 10)) + o + (rotate(g, (uint)25) ^ rotate(g, (uint)14) ^ ((g) >> 3)) + f));
    s += b;
    w = b + (rotate(x, (uint)30) ^ rotate(x, (uint)19) ^ rotate(x, (uint)10)) + bitselect(z, x, z ^ y);
  };
  {
    b = v + (rotate(s, (uint)26) ^ rotate(s, (uint)21) ^ rotate(s, (uint)7)) + bitselect(u, t, s) + (0x2DE92C6F + (g = (rotate(e, (uint)15) ^ rotate(e, (uint)13) ^ ((e) >> 10)) + p + (rotate(h, (uint)25) ^ rotate(h, (uint)14) ^ ((h) >> 3)) + g));
    z += b;
    v = b + (rotate(w, (uint)30) ^ rotate(w, (uint)19) ^ rotate(w, (uint)10)) + bitselect(y, w, y ^ x);
  };
  {
    b = u + (rotate(z, (uint)26) ^ rotate(z, (uint)21) ^ rotate(z, (uint)7)) + bitselect(t, s, z) + (0x4A7484AA + (h = (rotate(f, (uint)15) ^ rotate(f, (uint)13) ^ ((f) >> 10)) + q + (rotate(i, (uint)25) ^ rotate(i, (uint)14) ^ ((i) >> 3)) + h));
    y += b;
    u = b + (rotate(v, (uint)30) ^ rotate(v, (uint)19) ^ rotate(v, (uint)10)) + bitselect(x, v, x ^ w);
  };
  {
    b = t + (rotate(y, (uint)26) ^ rotate(y, (uint)21) ^ rotate(y, (uint)7)) + bitselect(s, z, y) + (0x5CB0A9DC + (i = (rotate(g, (uint)15) ^ rotate(g, (uint)13) ^ ((g) >> 10)) + r + (rotate(j, (uint)25) ^ rotate(j, (uint)14) ^ ((j) >> 3)) + i));
    x += b;
    t = b + (rotate(u, (uint)30) ^ rotate(u, (uint)19) ^ rotate(u, (uint)10)) + bitselect(w, u, w ^ v);
  };
  {
    b = s + (rotate(x, (uint)26) ^ rotate(x, (uint)21) ^ rotate(x, (uint)7)) + bitselect(z, y, x) + (0x76F988DA + (j = (rotate(h, (uint)15) ^ rotate(h, (uint)13) ^ ((h) >> 10)) + c + (rotate(k, (uint)25) ^ rotate(k, (uint)14) ^ ((k) >> 3)) + j));
    w += b;
    s = b + (rotate(t, (uint)30) ^ rotate(t, (uint)19) ^ rotate(t, (uint)10)) + bitselect(v, t, v ^ u);
  };
  {
    b = z + (rotate(w, (uint)26) ^ rotate(w, (uint)21) ^ rotate(w, (uint)7)) + bitselect(y, x, w) + (0x983E5152 + (k = (rotate(i, (uint)15) ^ rotate(i, (uint)13) ^ ((i) >> 10)) + d + (rotate(l, (uint)25) ^ rotate(l, (uint)14) ^ ((l) >> 3)) + k));
    v += b;
    z = b + (rotate(s, (uint)30) ^ rotate(s, (uint)19) ^ rotate(s, (uint)10)) + bitselect(u, s, u ^ t);
  };
  {
    b = y + (rotate(v, (uint)26) ^ rotate(v, (uint)21) ^ rotate(v, (uint)7)) + bitselect(x, w, v) + (0xA831C66D + (l = (rotate(j, (uint)15) ^ rotate(j, (uint)13) ^ ((j) >> 10)) + e + (rotate(m, (uint)25) ^ rotate(m, (uint)14) ^ ((m) >> 3)) + l));
    u += b;
    y = b + (rotate(z, (uint)30) ^ rotate(z, (uint)19) ^ rotate(z, (uint)10)) + bitselect(t, z, t ^ s);
  };
  {
    b = x + (rotate(u, (uint)26) ^ rotate(u, (uint)21) ^ rotate(u, (uint)7)) + bitselect(w, v, u) + (0xB00327C8 + (m = (rotate(k, (uint)15) ^ rotate(k, (uint)13) ^ ((k) >> 10)) + f + (rotate(n, (uint)25) ^ rotate(n, (uint)14) ^ ((n) >> 3)) + m));
    t += b;
    x = b + (rotate(y, (uint)30) ^ rotate(y, (uint)19) ^ rotate(y, (uint)10)) + bitselect(s, y, s ^ z);
  };
  {
    b = w + (rotate(t, (uint)26) ^ rotate(t, (uint)21) ^ rotate(t, (uint)7)) + bitselect(v, u, t) + (0xBF597FC7 + (n = (rotate(l, (uint)15) ^ rotate(l, (uint)13) ^ ((l) >> 10)) + g + (rotate(o, (uint)25) ^ rotate(o, (uint)14) ^ ((o) >> 3)) + n));
    s += b;
    w = b + (rotate(x, (uint)30) ^ rotate(x, (uint)19) ^ rotate(x, (uint)10)) + bitselect(z, x, z ^ y);
  };
  {
    b = v + (rotate(s, (uint)26) ^ rotate(s, (uint)21) ^ rotate(s, (uint)7)) + bitselect(u, t, s) + (0xC6E00BF3 + (o = (rotate(m, (uint)15) ^ rotate(m, (uint)13) ^ ((m) >> 10)) + h + (rotate(p, (uint)25) ^ rotate(p, (uint)14) ^ ((p) >> 3)) + o));
    z += b;
    v = b + (rotate(w, (uint)30) ^ rotate(w, (uint)19) ^ rotate(w, (uint)10)) + bitselect(y, w, y ^ x);
  };
  {
    b = u + (rotate(z, (uint)26) ^ rotate(z, (uint)21) ^ rotate(z, (uint)7)) + bitselect(t, s, z) + (0xD5A79147 + (p = (rotate(n, (uint)15) ^ rotate(n, (uint)13) ^ ((n) >> 10)) + i + (rotate(q, (uint)25) ^ rotate(q, (uint)14) ^ ((q) >> 3)) + p));
    y += b;
    u = b + (rotate(v, (uint)30) ^ rotate(v, (uint)19) ^ rotate(v, (uint)10)) + bitselect(x, v, x ^ w);
  };
  {
    b = t + (rotate(y, (uint)26) ^ rotate(y, (uint)21) ^ rotate(y, (uint)7)) + bitselect(s, z, y) + (0x06CA6351 + (q = (rotate(o, (uint)15) ^ rotate(o, (uint)13) ^ ((o) >> 10)) + j + (rotate(r, (uint)25) ^ rotate(r, (uint)14) ^ ((r) >> 3)) + q));
    x += b;
    t = b + (rotate(u, (uint)30) ^ rotate(u, (uint)19) ^ rotate(u, (uint)10)) + bitselect(w, u, w ^ v);
  };
  {
    b = s + (rotate(x, (uint)26) ^ rotate(x, (uint)21) ^ rotate(x, (uint)7)) + bitselect(z, y, x) + (0x14292967 + (r = (rotate(p, (uint)15) ^ rotate(p, (uint)13) ^ ((p) >> 10)) + k + (rotate(c, (uint)25) ^ rotate(c, (uint)14) ^ ((c) >> 3)) + r));
    w += b;
    s = b + (rotate(t, (uint)30) ^ rotate(t, (uint)19) ^ rotate(t, (uint)10)) + bitselect(v, t, v ^ u);
  };

  {
    b = z + (rotate(w, (uint)26) ^ rotate(w, (uint)21) ^ rotate(w, (uint)7)) + bitselect(y, x, w) + (0x27B70A85 + (c = (rotate(q, (uint)15) ^ rotate(q, (uint)13) ^ ((q) >> 10)) + l + (rotate(d, (uint)25) ^ rotate(d, (uint)14) ^ ((d) >> 3)) + c));
    v += b;
    z = b + (rotate(s, (uint)30) ^ rotate(s, (uint)19) ^ rotate(s, (uint)10)) + bitselect(u, s, u ^ t);
  };
  {
    b = y + (rotate(v, (uint)26) ^ rotate(v, (uint)21) ^ rotate(v, (uint)7)) + bitselect(x, w, v) + (0x2E1B2138 + (d = (rotate(r, (uint)15) ^ rotate(r, (uint)13) ^ ((r) >> 10)) + m + (rotate(e, (uint)25) ^ rotate(e, (uint)14) ^ ((e) >> 3)) + d));
    u += b;
    y = b + (rotate(z, (uint)30) ^ rotate(z, (uint)19) ^ rotate(z, (uint)10)) + bitselect(t, z, t ^ s);
  };
  {
    b = x + (rotate(u, (uint)26) ^ rotate(u, (uint)21) ^ rotate(u, (uint)7)) + bitselect(w, v, u) + (0x4D2C6DFC + (e = (rotate(c, (uint)15) ^ rotate(c, (uint)13) ^ ((c) >> 10)) + n + (rotate(f, (uint)25) ^ rotate(f, (uint)14) ^ ((f) >> 3)) + e));
    t += b;
    x = b + (rotate(y, (uint)30) ^ rotate(y, (uint)19) ^ rotate(y, (uint)10)) + bitselect(s, y, s ^ z);
  };
  {
    b = w + (rotate(t, (uint)26) ^ rotate(t, (uint)21) ^ rotate(t, (uint)7)) + bitselect(v, u, t) + (0x53380D13 + (f = (rotate(d, (uint)15) ^ rotate(d, (uint)13) ^ ((d) >> 10)) + o + (rotate(g, (uint)25) ^ rotate(g, (uint)14) ^ ((g) >> 3)) + f));
    s += b;
    w = b + (rotate(x, (uint)30) ^ rotate(x, (uint)19) ^ rotate(x, (uint)10)) + bitselect(z, x, z ^ y);
  };
  {
    b = v + (rotate(s, (uint)26) ^ rotate(s, (uint)21) ^ rotate(s, (uint)7)) + bitselect(u, t, s) + (0x650A7354 + (g = (rotate(e, (uint)15) ^ rotate(e, (uint)13) ^ ((e) >> 10)) + p + (rotate(h, (uint)25) ^ rotate(h, (uint)14) ^ ((h) >> 3)) + g));
    z += b;
    v = b + (rotate(w, (uint)30) ^ rotate(w, (uint)19) ^ rotate(w, (uint)10)) + bitselect(y, w, y ^ x);
  };
  {
    b = u + (rotate(z, (uint)26) ^ rotate(z, (uint)21) ^ rotate(z, (uint)7)) + bitselect(t, s, z) + (0x766A0ABB + (h = (rotate(f, (uint)15) ^ rotate(f, (uint)13) ^ ((f) >> 10)) + q + (rotate(i, (uint)25) ^ rotate(i, (uint)14) ^ ((i) >> 3)) + h));
    y += b;
    u = b + (rotate(v, (uint)30) ^ rotate(v, (uint)19) ^ rotate(v, (uint)10)) + bitselect(x, v, x ^ w);
  };
  {
    b = t + (rotate(y, (uint)26) ^ rotate(y, (uint)21) ^ rotate(y, (uint)7)) + bitselect(s, z, y) + (0x81C2C92E + (i = (rotate(g, (uint)15) ^ rotate(g, (uint)13) ^ ((g) >> 10)) + r + (rotate(j, (uint)25) ^ rotate(j, (uint)14) ^ ((j) >> 3)) + i));
    x += b;
    t = b + (rotate(u, (uint)30) ^ rotate(u, (uint)19) ^ rotate(u, (uint)10)) + bitselect(w, u, w ^ v);
  };
  {
    b = s + (rotate(x, (uint)26) ^ rotate(x, (uint)21) ^ rotate(x, (uint)7)) + bitselect(z, y, x) + (0x92722C85 + (j = (rotate(h, (uint)15) ^ rotate(h, (uint)13) ^ ((h) >> 10)) + c + (rotate(k, (uint)25) ^ rotate(k, (uint)14) ^ ((k) >> 3)) + j));
    w += b;
    s = b + (rotate(t, (uint)30) ^ rotate(t, (uint)19) ^ rotate(t, (uint)10)) + bitselect(v, t, v ^ u);
  };
  {
    b = z + (rotate(w, (uint)26) ^ rotate(w, (uint)21) ^ rotate(w, (uint)7)) + bitselect(y, x, w) + (0xA2BFE8A1 + (k = (rotate(i, (uint)15) ^ rotate(i, (uint)13) ^ ((i) >> 10)) + d + (rotate(l, (uint)25) ^ rotate(l, (uint)14) ^ ((l) >> 3)) + k));
    v += b;
    z = b + (rotate(s, (uint)30) ^ rotate(s, (uint)19) ^ rotate(s, (uint)10)) + bitselect(u, s, u ^ t);
  };
  {
    b = y + (rotate(v, (uint)26) ^ rotate(v, (uint)21) ^ rotate(v, (uint)7)) + bitselect(x, w, v) + (0xA81A664B + (l = (rotate(j, (uint)15) ^ rotate(j, (uint)13) ^ ((j) >> 10)) + e + (rotate(m, (uint)25) ^ rotate(m, (uint)14) ^ ((m) >> 3)) + l));
    u += b;
    y = b + (rotate(z, (uint)30) ^ rotate(z, (uint)19) ^ rotate(z, (uint)10)) + bitselect(t, z, t ^ s);
  };
  {
    b = x + (rotate(u, (uint)26) ^ rotate(u, (uint)21) ^ rotate(u, (uint)7)) + bitselect(w, v, u) + (0xC24B8B70 + (m = (rotate(k, (uint)15) ^ rotate(k, (uint)13) ^ ((k) >> 10)) + f + (rotate(n, (uint)25) ^ rotate(n, (uint)14) ^ ((n) >> 3)) + m));
    t += b;
    x = b + (rotate(y, (uint)30) ^ rotate(y, (uint)19) ^ rotate(y, (uint)10)) + bitselect(s, y, s ^ z);
  };
  {
    b = w + (rotate(t, (uint)26) ^ rotate(t, (uint)21) ^ rotate(t, (uint)7)) + bitselect(v, u, t) + (0xC76C51A3 + (n = (rotate(l, (uint)15) ^ rotate(l, (uint)13) ^ ((l) >> 10)) + g + (rotate(o, (uint)25) ^ rotate(o, (uint)14) ^ ((o) >> 3)) + n));
    s += b;
    w = b + (rotate(x, (uint)30) ^ rotate(x, (uint)19) ^ rotate(x, (uint)10)) + bitselect(z, x, z ^ y);
  };
  {
    b = v + (rotate(s, (uint)26) ^ rotate(s, (uint)21) ^ rotate(s, (uint)7)) + bitselect(u, t, s) + (0xD192E819 + (o = (rotate(m, (uint)15) ^ rotate(m, (uint)13) ^ ((m) >> 10)) + h + (rotate(p, (uint)25) ^ rotate(p, (uint)14) ^ ((p) >> 3)) + o));
    z += b;
    v = b + (rotate(w, (uint)30) ^ rotate(w, (uint)19) ^ rotate(w, (uint)10)) + bitselect(y, w, y ^ x);
  };
  {
    b = u + (rotate(z, (uint)26) ^ rotate(z, (uint)21) ^ rotate(z, (uint)7)) + bitselect(t, s, z) + (0xD6990624 + (p = (rotate(n, (uint)15) ^ rotate(n, (uint)13) ^ ((n) >> 10)) + i + (rotate(q, (uint)25) ^ rotate(q, (uint)14) ^ ((q) >> 3)) + p));
    y += b;
    u = b + (rotate(v, (uint)30) ^ rotate(v, (uint)19) ^ rotate(v, (uint)10)) + bitselect(x, v, x ^ w);
  };
  {
    b = t + (rotate(y, (uint)26) ^ rotate(y, (uint)21) ^ rotate(y, (uint)7)) + bitselect(s, z, y) + (0xF40E3585 + (q = (rotate(o, (uint)15) ^ rotate(o, (uint)13) ^ ((o) >> 10)) + j + (rotate(r, (uint)25) ^ rotate(r, (uint)14) ^ ((r) >> 3)) + q));
    x += b;
    t = b + (rotate(u, (uint)30) ^ rotate(u, (uint)19) ^ rotate(u, (uint)10)) + bitselect(w, u, w ^ v);
  };
  {
    b = s + (rotate(x, (uint)26) ^ rotate(x, (uint)21) ^ rotate(x, (uint)7)) + bitselect(z, y, x) + (0x106AA070 + (r = (rotate(p, (uint)15) ^ rotate(p, (uint)13) ^ ((p) >> 10)) + k + (rotate(c, (uint)25) ^ rotate(c, (uint)14) ^ ((c) >> 3)) + r));
    w += b;
    s = b + (rotate(t, (uint)30) ^ rotate(t, (uint)19) ^ rotate(t, (uint)10)) + bitselect(v, t, v ^ u);
  };

  {
    b = z + (rotate(w, (uint)26) ^ rotate(w, (uint)21) ^ rotate(w, (uint)7)) + bitselect(y, x, w) + (0x19A4C116 + (c = (rotate(q, (uint)15) ^ rotate(q, (uint)13) ^ ((q) >> 10)) + l + (rotate(d, (uint)25) ^ rotate(d, (uint)14) ^ ((d) >> 3)) + c));
    v += b;
    z = b + (rotate(s, (uint)30) ^ rotate(s, (uint)19) ^ rotate(s, (uint)10)) + bitselect(u, s, u ^ t);
  };
  {
    b = y + (rotate(v, (uint)26) ^ rotate(v, (uint)21) ^ rotate(v, (uint)7)) + bitselect(x, w, v) + (0x1E376C08 + (d = (rotate(r, (uint)15) ^ rotate(r, (uint)13) ^ ((r) >> 10)) + m + (rotate(e, (uint)25) ^ rotate(e, (uint)14) ^ ((e) >> 3)) + d));
    u += b;
    y = b + (rotate(z, (uint)30) ^ rotate(z, (uint)19) ^ rotate(z, (uint)10)) + bitselect(t, z, t ^ s);
  };
  {
    b = x + (rotate(u, (uint)26) ^ rotate(u, (uint)21) ^ rotate(u, (uint)7)) + bitselect(w, v, u) + (0x2748774C + (e = (rotate(c, (uint)15) ^ rotate(c, (uint)13) ^ ((c) >> 10)) + n + (rotate(f, (uint)25) ^ rotate(f, (uint)14) ^ ((f) >> 3)) + e));
    t += b;
    x = b + (rotate(y, (uint)30) ^ rotate(y, (uint)19) ^ rotate(y, (uint)10)) + bitselect(s, y, s ^ z);
  };
  {
    b = w + (rotate(t, (uint)26) ^ rotate(t, (uint)21) ^ rotate(t, (uint)7)) + bitselect(v, u, t) + (0x34B0BCB5 + (f = (rotate(d, (uint)15) ^ rotate(d, (uint)13) ^ ((d) >> 10)) + o + (rotate(g, (uint)25) ^ rotate(g, (uint)14) ^ ((g) >> 3)) + f));
    s += b;
    w = b + (rotate(x, (uint)30) ^ rotate(x, (uint)19) ^ rotate(x, (uint)10)) + bitselect(z, x, z ^ y);
  };
  {
    b = v + (rotate(s, (uint)26) ^ rotate(s, (uint)21) ^ rotate(s, (uint)7)) + bitselect(u, t, s) + (0x391C0CB3 + (g = (rotate(e, (uint)15) ^ rotate(e, (uint)13) ^ ((e) >> 10)) + p + (rotate(h, (uint)25) ^ rotate(h, (uint)14) ^ ((h) >> 3)) + g));
    z += b;
    v = b + (rotate(w, (uint)30) ^ rotate(w, (uint)19) ^ rotate(w, (uint)10)) + bitselect(y, w, y ^ x);
  };
  {
    b = u + (rotate(z, (uint)26) ^ rotate(z, (uint)21) ^ rotate(z, (uint)7)) + bitselect(t, s, z) + (0x4ED8AA4A + (h = (rotate(f, (uint)15) ^ rotate(f, (uint)13) ^ ((f) >> 10)) + q + (rotate(i, (uint)25) ^ rotate(i, (uint)14) ^ ((i) >> 3)) + h));
    y += b;
    u = b + (rotate(v, (uint)30) ^ rotate(v, (uint)19) ^ rotate(v, (uint)10)) + bitselect(x, v, x ^ w);
  };
  {
    b = t + (rotate(y, (uint)26) ^ rotate(y, (uint)21) ^ rotate(y, (uint)7)) + bitselect(s, z, y) + (0x5B9CCA4F + (i = (rotate(g, (uint)15) ^ rotate(g, (uint)13) ^ ((g) >> 10)) + r + (rotate(j, (uint)25) ^ rotate(j, (uint)14) ^ ((j) >> 3)) + i));
    x += b;
    t = b + (rotate(u, (uint)30) ^ rotate(u, (uint)19) ^ rotate(u, (uint)10)) + bitselect(w, u, w ^ v);
  };
  {
    b = s + (rotate(x, (uint)26) ^ rotate(x, (uint)21) ^ rotate(x, (uint)7)) + bitselect(z, y, x) + (0x682E6FF3 + (j = (rotate(h, (uint)15) ^ rotate(h, (uint)13) ^ ((h) >> 10)) + c + (rotate(k, (uint)25) ^ rotate(k, (uint)14) ^ ((k) >> 3)) + j));
    w += b;
    s = b + (rotate(t, (uint)30) ^ rotate(t, (uint)19) ^ rotate(t, (uint)10)) + bitselect(v, t, v ^ u);
  };
  {
    b = z + (rotate(w, (uint)26) ^ rotate(w, (uint)21) ^ rotate(w, (uint)7)) + bitselect(y, x, w) + (0x748F82EE + (k = (rotate(i, (uint)15) ^ rotate(i, (uint)13) ^ ((i) >> 10)) + d + (rotate(l, (uint)25) ^ rotate(l, (uint)14) ^ ((l) >> 3)) + k));
    v += b;
    z = b + (rotate(s, (uint)30) ^ rotate(s, (uint)19) ^ rotate(s, (uint)10)) + bitselect(u, s, u ^ t);
  };
  {
    b = y + (rotate(v, (uint)26) ^ rotate(v, (uint)21) ^ rotate(v, (uint)7)) + bitselect(x, w, v) + (0x78A5636F + (l = (rotate(j, (uint)15) ^ rotate(j, (uint)13) ^ ((j) >> 10)) + e + (rotate(m, (uint)25) ^ rotate(m, (uint)14) ^ ((m) >> 3)) + l));
    u += b;
    y = b + (rotate(z, (uint)30) ^ rotate(z, (uint)19) ^ rotate(z, (uint)10)) + bitselect(t, z, t ^ s);
  };
  {
    b = x + (rotate(u, (uint)26) ^ rotate(u, (uint)21) ^ rotate(u, (uint)7)) + bitselect(w, v, u) + (0x84C87814 + (m = (rotate(k, (uint)15) ^ rotate(k, (uint)13) ^ ((k) >> 10)) + f + (rotate(n, (uint)25) ^ rotate(n, (uint)14) ^ ((n) >> 3)) + m));
    t += b;
    x = b + (rotate(y, (uint)30) ^ rotate(y, (uint)19) ^ rotate(y, (uint)10)) + bitselect(s, y, s ^ z);
  };
  {
    b = w + (rotate(t, (uint)26) ^ rotate(t, (uint)21) ^ rotate(t, (uint)7)) + bitselect(v, u, t) + (0x8CC70208 + (n = (rotate(l, (uint)15) ^ rotate(l, (uint)13) ^ ((l) >> 10)) + g + (rotate(o, (uint)25) ^ rotate(o, (uint)14) ^ ((o) >> 3)) + n));
    s += b;
    w = b + (rotate(x, (uint)30) ^ rotate(x, (uint)19) ^ rotate(x, (uint)10)) + bitselect(z, x, z ^ y);
  };
  {
    b = v + (rotate(s, (uint)26) ^ rotate(s, (uint)21) ^ rotate(s, (uint)7)) + bitselect(u, t, s) + (0x90BEFFFA + (o = (rotate(m, (uint)15) ^ rotate(m, (uint)13) ^ ((m) >> 10)) + h + (rotate(p, (uint)25) ^ rotate(p, (uint)14) ^ ((p) >> 3)) + o));
    z += b;
    v = b + (rotate(w, (uint)30) ^ rotate(w, (uint)19) ^ rotate(w, (uint)10)) + bitselect(y, w, y ^ x);
  };
  {
    b = u + (rotate(z, (uint)26) ^ rotate(z, (uint)21) ^ rotate(z, (uint)7)) + bitselect(t, s, z) + (0xA4506CEB + (p = (rotate(n, (uint)15) ^ rotate(n, (uint)13) ^ ((n) >> 10)) + i + (rotate(q, (uint)25) ^ rotate(q, (uint)14) ^ ((q) >> 3)) + p));
    y += b;
    u = b + (rotate(v, (uint)30) ^ rotate(v, (uint)19) ^ rotate(v, (uint)10)) + bitselect(x, v, x ^ w);
  };
  {
    b = t + (rotate(y, (uint)26) ^ rotate(y, (uint)21) ^ rotate(y, (uint)7)) + bitselect(s, z, y) + (0xBEF9A3F7 + ((rotate(o, (uint)15) ^ rotate(o, (uint)13) ^ ((o) >> 10)) + j + (rotate(r, (uint)25) ^ rotate(r, (uint)14) ^ ((r) >> 3)) + q));
    x += b;
    t = b + (rotate(u, (uint)30) ^ rotate(u, (uint)19) ^ rotate(u, (uint)10)) + bitselect(w, u, w ^ v);
  };
  {
    b = s + (rotate(x, (uint)26) ^ rotate(x, (uint)21) ^ rotate(x, (uint)7)) + bitselect(z, y, x) + (0xC67178F2 + ((rotate(p, (uint)15) ^ rotate(p, (uint)13) ^ ((p) >> 10)) + k + (rotate(c, (uint)25) ^ rotate(c, (uint)14) ^ ((c) >> 3)) + r));
    w += b;
    s = b + (rotate(t, (uint)30) ^ rotate(t, (uint)19) ^ rotate(t, (uint)10)) + bitselect(v, t, v ^ u);
  };

  s += 0x6A09E667;
  t += 0xBB67AE85;
  u += 0x3C6EF372;
  v += 0xA54FF53A;
  w += 0x510E527F;
  x += 0x9B05688C;
  y += 0x1F83D9AB;
  z += 0x5BE0CD19;
  uint aa = z;

  {
    b = z + (rotate(w, (uint)26) ^ rotate(w, (uint)21) ^ rotate(w, (uint)7)) + bitselect(y, x, w) + (0x428A2F98 + 0x80000000);
    v += b;
    z = b + (rotate(s, (uint)30) ^ rotate(s, (uint)19) ^ rotate(s, (uint)10)) + bitselect(u, s, u ^ t);
  };
  {
    b = y + (rotate(v, (uint)26) ^ rotate(v, (uint)21) ^ rotate(v, (uint)7)) + bitselect(x, w, v) + (0x71374491 + 0);
    u += b;
    y = b + (rotate(z, (uint)30) ^ rotate(z, (uint)19) ^ rotate(z, (uint)10)) + bitselect(t, z, t ^ s);
  };
  {
    b = x + (rotate(u, (uint)26) ^ rotate(u, (uint)21) ^ rotate(u, (uint)7)) + bitselect(w, v, u) + (0xB5C0FBCF + 0);
    t += b;
    x = b + (rotate(y, (uint)30) ^ rotate(y, (uint)19) ^ rotate(y, (uint)10)) + bitselect(s, y, s ^ z);
  };
  {
    b = w + (rotate(t, (uint)26) ^ rotate(t, (uint)21) ^ rotate(t, (uint)7)) + bitselect(v, u, t) + (0xE9B5DBA5 + 0);
    s += b;
    w = b + (rotate(x, (uint)30) ^ rotate(x, (uint)19) ^ rotate(x, (uint)10)) + bitselect(z, x, z ^ y);
  };
  {
    b = v + (rotate(s, (uint)26) ^ rotate(s, (uint)21) ^ rotate(s, (uint)7)) + bitselect(u, t, s) + (0x3956C25B + 0);
    z += b;
    v = b + (rotate(w, (uint)30) ^ rotate(w, (uint)19) ^ rotate(w, (uint)10)) + bitselect(y, w, y ^ x);
  };
  {
    b = u + (rotate(z, (uint)26) ^ rotate(z, (uint)21) ^ rotate(z, (uint)7)) + bitselect(t, s, z) + (0x59F111F1 + 0);
    y += b;
    u = b + (rotate(v, (uint)30) ^ rotate(v, (uint)19) ^ rotate(v, (uint)10)) + bitselect(x, v, x ^ w);
  };
  {
    b = t + (rotate(y, (uint)26) ^ rotate(y, (uint)21) ^ rotate(y, (uint)7)) + bitselect(s, z, y) + (0x923F82A4 + 0);
    x += b;
    t = b + (rotate(u, (uint)30) ^ rotate(u, (uint)19) ^ rotate(u, (uint)10)) + bitselect(w, u, w ^ v);
  };
  {
    b = s + (rotate(x, (uint)26) ^ rotate(x, (uint)21) ^ rotate(x, (uint)7)) + bitselect(z, y, x) + (0xAB1C5ED5 + 0);
    w += b;
    s = b + (rotate(t, (uint)30) ^ rotate(t, (uint)19) ^ rotate(t, (uint)10)) + bitselect(v, t, v ^ u);
  };
  {
    b = z + (rotate(w, (uint)26) ^ rotate(w, (uint)21) ^ rotate(w, (uint)7)) + bitselect(y, x, w) + (0xD807AA98 + 0);
    v += b;
    z = b + (rotate(s, (uint)30) ^ rotate(s, (uint)19) ^ rotate(s, (uint)10)) + bitselect(u, s, u ^ t);
  };
  {
    b = y + (rotate(v, (uint)26) ^ rotate(v, (uint)21) ^ rotate(v, (uint)7)) + bitselect(x, w, v) + (0x12835B01 + 0);
    u += b;
    y = b + (rotate(z, (uint)30) ^ rotate(z, (uint)19) ^ rotate(z, (uint)10)) + bitselect(t, z, t ^ s);
  };
  {
    b = x + (rotate(u, (uint)26) ^ rotate(u, (uint)21) ^ rotate(u, (uint)7)) + bitselect(w, v, u) + (0x243185BE + 0);
    t += b;
    x = b + (rotate(y, (uint)30) ^ rotate(y, (uint)19) ^ rotate(y, (uint)10)) + bitselect(s, y, s ^ z);
  };
  {
    b = w + (rotate(t, (uint)26) ^ rotate(t, (uint)21) ^ rotate(t, (uint)7)) + bitselect(v, u, t) + (0x550C7DC3 + 0);
    s += b;
    w = b + (rotate(x, (uint)30) ^ rotate(x, (uint)19) ^ rotate(x, (uint)10)) + bitselect(z, x, z ^ y);
  };
  {
    b = v + (rotate(s, (uint)26) ^ rotate(s, (uint)21) ^ rotate(s, (uint)7)) + bitselect(u, t, s) + (0x72BE5D74 + 0);
    z += b;
    v = b + (rotate(w, (uint)30) ^ rotate(w, (uint)19) ^ rotate(w, (uint)10)) + bitselect(y, w, y ^ x);
  };
  {
    b = u + (rotate(z, (uint)26) ^ rotate(z, (uint)21) ^ rotate(z, (uint)7)) + bitselect(t, s, z) + (0x80DEB1FE + 0);
    y += b;
    u = b + (rotate(v, (uint)30) ^ rotate(v, (uint)19) ^ rotate(v, (uint)10)) + bitselect(x, v, x ^ w);
  };
  {
    b = t + (rotate(y, (uint)26) ^ rotate(y, (uint)21) ^ rotate(y, (uint)7)) + bitselect(s, z, y) + (0x9BDC06A7 + 0);
    x += b;
    t = b + (rotate(u, (uint)30) ^ rotate(u, (uint)19) ^ rotate(u, (uint)10)) + bitselect(w, u, w ^ v);
  };
  {
    b = s + (rotate(x, (uint)26) ^ rotate(x, (uint)21) ^ rotate(x, (uint)7)) + bitselect(z, y, x) + (0xC19BF174 + 512);
    w += b;
    s = b + (rotate(t, (uint)30) ^ rotate(t, (uint)19) ^ rotate(t, (uint)10)) + bitselect(v, t, v ^ u);
  };

  {
    b = z + (rotate(w, (uint)26) ^ rotate(w, (uint)21) ^ rotate(w, (uint)7)) + bitselect(y, x, w) + (0xE49B69C1U + 0x80000000U);
    v += b;
    z = b + (rotate(s, (uint)30) ^ rotate(s, (uint)19) ^ rotate(s, (uint)10)) + bitselect(u, s, u ^ t);
  };
  {
    b = y + (rotate(v, (uint)26) ^ rotate(v, (uint)21) ^ rotate(v, (uint)7)) + bitselect(x, w, v) + (0xEFBE4786U + 0x01400000U);
    u += b;
    y = b + (rotate(z, (uint)30) ^ rotate(z, (uint)19) ^ rotate(z, (uint)10)) + bitselect(t, z, t ^ s);
  };
  {
    b = x + (rotate(u, (uint)26) ^ rotate(u, (uint)21) ^ rotate(u, (uint)7)) + bitselect(w, v, u) + (0x0FC19DC6U + 0x00205000U);
    t += b;
    x = b + (rotate(y, (uint)30) ^ rotate(y, (uint)19) ^ rotate(y, (uint)10)) + bitselect(s, y, s ^ z);
  };
  {
    b = w + (rotate(t, (uint)26) ^ rotate(t, (uint)21) ^ rotate(t, (uint)7)) + bitselect(v, u, t) + (0x240CA1CCU + 0x00005088U);
    s += b;
    w = b + (rotate(x, (uint)30) ^ rotate(x, (uint)19) ^ rotate(x, (uint)10)) + bitselect(z, x, z ^ y);
  };
  {
    b = v + (rotate(s, (uint)26) ^ rotate(s, (uint)21) ^ rotate(s, (uint)7)) + bitselect(u, t, s) + (0x2DE92C6FU + 0x22000800U);
    z += b;
    v = b + (rotate(w, (uint)30) ^ rotate(w, (uint)19) ^ rotate(w, (uint)10)) + bitselect(y, w, y ^ x);
  };
  {
    b = u + (rotate(z, (uint)26) ^ rotate(z, (uint)21) ^ rotate(z, (uint)7)) + bitselect(t, s, z) + (0x4A7484AAU + 0x22550014U);
    y += b;
    u = b + (rotate(v, (uint)30) ^ rotate(v, (uint)19) ^ rotate(v, (uint)10)) + bitselect(x, v, x ^ w);
  };
  {
    b = t + (rotate(y, (uint)26) ^ rotate(y, (uint)21) ^ rotate(y, (uint)7)) + bitselect(s, z, y) + (0x5CB0A9DCU + 0x05089742U);
    x += b;
    t = b + (rotate(u, (uint)30) ^ rotate(u, (uint)19) ^ rotate(u, (uint)10)) + bitselect(w, u, w ^ v);
  };
  {
    b = s + (rotate(x, (uint)26) ^ rotate(x, (uint)21) ^ rotate(x, (uint)7)) + bitselect(z, y, x) + (0x76F988DAU + 0xa0000020U);
    w += b;
    s = b + (rotate(t, (uint)30) ^ rotate(t, (uint)19) ^ rotate(t, (uint)10)) + bitselect(v, t, v ^ u);
  };
  {
    b = z + (rotate(w, (uint)26) ^ rotate(w, (uint)21) ^ rotate(w, (uint)7)) + bitselect(y, x, w) + (0x983E5152U + 0x5a880000U);
    v += b;
    z = b + (rotate(s, (uint)30) ^ rotate(s, (uint)19) ^ rotate(s, (uint)10)) + bitselect(u, s, u ^ t);
  };
  {
    b = y + (rotate(v, (uint)26) ^ rotate(v, (uint)21) ^ rotate(v, (uint)7)) + bitselect(x, w, v) + (0xA831C66DU + 0x005c9400U);
    u += b;
    y = b + (rotate(z, (uint)30) ^ rotate(z, (uint)19) ^ rotate(z, (uint)10)) + bitselect(t, z, t ^ s);
  };
  {
    b = x + (rotate(u, (uint)26) ^ rotate(u, (uint)21) ^ rotate(u, (uint)7)) + bitselect(w, v, u) + (0xB00327C8U + 0x0016d49dU);
    t += b;
    x = b + (rotate(y, (uint)30) ^ rotate(y, (uint)19) ^ rotate(y, (uint)10)) + bitselect(s, y, s ^ z);
  };
  {
    b = w + (rotate(t, (uint)26) ^ rotate(t, (uint)21) ^ rotate(t, (uint)7)) + bitselect(v, u, t) + (0xBF597FC7U + 0xfa801f00U);
    s += b;
    w = b + (rotate(x, (uint)30) ^ rotate(x, (uint)19) ^ rotate(x, (uint)10)) + bitselect(z, x, z ^ y);
  };
  {
    b = v + (rotate(s, (uint)26) ^ rotate(s, (uint)21) ^ rotate(s, (uint)7)) + bitselect(u, t, s) + (0xC6E00BF3U + 0xd33225d0U);
    z += b;
    v = b + (rotate(w, (uint)30) ^ rotate(w, (uint)19) ^ rotate(w, (uint)10)) + bitselect(y, w, y ^ x);
  };
  {
    b = u + (rotate(z, (uint)26) ^ rotate(z, (uint)21) ^ rotate(z, (uint)7)) + bitselect(t, s, z) + (0xD5A79147U + 0x11675959U);
    y += b;
    u = b + (rotate(v, (uint)30) ^ rotate(v, (uint)19) ^ rotate(v, (uint)10)) + bitselect(x, v, x ^ w);
  };
  {
    b = t + (rotate(y, (uint)26) ^ rotate(y, (uint)21) ^ rotate(y, (uint)7)) + bitselect(s, z, y) + (0x06CA6351U + 0xf6e6bfdaU);
    x += b;
    t = b + (rotate(u, (uint)30) ^ rotate(u, (uint)19) ^ rotate(u, (uint)10)) + bitselect(w, u, w ^ v);
  };
  {
    b = s + (rotate(x, (uint)26) ^ rotate(x, (uint)21) ^ rotate(x, (uint)7)) + bitselect(z, y, x) + (0x14292967U + 0xb30c1549U);
    w += b;
    s = b + (rotate(t, (uint)30) ^ rotate(t, (uint)19) ^ rotate(t, (uint)10)) + bitselect(v, t, v ^ u);
  };
  {
    b = z + (rotate(w, (uint)26) ^ rotate(w, (uint)21) ^ rotate(w, (uint)7)) + bitselect(y, x, w) + (0x27B70A85U + 0x08b2b050U);
    v += b;
    z = b + (rotate(s, (uint)30) ^ rotate(s, (uint)19) ^ rotate(s, (uint)10)) + bitselect(u, s, u ^ t);
  };
  {
    b = y + (rotate(v, (uint)26) ^ rotate(v, (uint)21) ^ rotate(v, (uint)7)) + bitselect(x, w, v) + (0x2E1B2138U + 0x9d7c4c27U);
    u += b;
    y = b + (rotate(z, (uint)30) ^ rotate(z, (uint)19) ^ rotate(z, (uint)10)) + bitselect(t, z, t ^ s);
  };
  {
    b = x + (rotate(u, (uint)26) ^ rotate(u, (uint)21) ^ rotate(u, (uint)7)) + bitselect(w, v, u) + (0x4D2C6DFCU + 0x0ce2a393U);
    t += b;
    x = b + (rotate(y, (uint)30) ^ rotate(y, (uint)19) ^ rotate(y, (uint)10)) + bitselect(s, y, s ^ z);
  };
  {
    b = w + (rotate(t, (uint)26) ^ rotate(t, (uint)21) ^ rotate(t, (uint)7)) + bitselect(v, u, t) + (0x53380D13U + 0x88e6e1eaU);
    s += b;
    w = b + (rotate(x, (uint)30) ^ rotate(x, (uint)19) ^ rotate(x, (uint)10)) + bitselect(z, x, z ^ y);
  };
  {
    b = v + (rotate(s, (uint)26) ^ rotate(s, (uint)21) ^ rotate(s, (uint)7)) + bitselect(u, t, s) + (0x650A7354U + 0xa52b4335U);
    z += b;
    v = b + (rotate(w, (uint)30) ^ rotate(w, (uint)19) ^ rotate(w, (uint)10)) + bitselect(y, w, y ^ x);
  };
  {
    b = u + (rotate(z, (uint)26) ^ rotate(z, (uint)21) ^ rotate(z, (uint)7)) + bitselect(t, s, z) + (0x766A0ABBU + 0x67a16f49U);
    y += b;
    u = b + (rotate(v, (uint)30) ^ rotate(v, (uint)19) ^ rotate(v, (uint)10)) + bitselect(x, v, x ^ w);
  };
  {
    b = t + (rotate(y, (uint)26) ^ rotate(y, (uint)21) ^ rotate(y, (uint)7)) + bitselect(s, z, y) + (0x81C2C92EU + 0xd732016fU);
    x += b;
    t = b + (rotate(u, (uint)30) ^ rotate(u, (uint)19) ^ rotate(u, (uint)10)) + bitselect(w, u, w ^ v);
  };
  {
    b = s + (rotate(x, (uint)26) ^ rotate(x, (uint)21) ^ rotate(x, (uint)7)) + bitselect(z, y, x) + (0x92722C85U + 0x4eeb2e91U);
    w += b;
    s = b + (rotate(t, (uint)30) ^ rotate(t, (uint)19) ^ rotate(t, (uint)10)) + bitselect(v, t, v ^ u);
  };
  {
    b = z + (rotate(w, (uint)26) ^ rotate(w, (uint)21) ^ rotate(w, (uint)7)) + bitselect(y, x, w) + (0xA2BFE8A1U + 0x5dbf55e5U);
    v += b;
    z = b + (rotate(s, (uint)30) ^ rotate(s, (uint)19) ^ rotate(s, (uint)10)) + bitselect(u, s, u ^ t);
  };
  {
    b = y + (rotate(v, (uint)26) ^ rotate(v, (uint)21) ^ rotate(v, (uint)7)) + bitselect(x, w, v) + (0xA81A664BU + 0x8eee2335U);
    u += b;
    y = b + (rotate(z, (uint)30) ^ rotate(z, (uint)19) ^ rotate(z, (uint)10)) + bitselect(t, z, t ^ s);
  };
  {
    b = x + (rotate(u, (uint)26) ^ rotate(u, (uint)21) ^ rotate(u, (uint)7)) + bitselect(w, v, u) + (0xC24B8B70U + 0xe2bc5ec2U);
    t += b;
    x = b + (rotate(y, (uint)30) ^ rotate(y, (uint)19) ^ rotate(y, (uint)10)) + bitselect(s, y, s ^ z);
  };
  {
    b = w + (rotate(t, (uint)26) ^ rotate(t, (uint)21) ^ rotate(t, (uint)7)) + bitselect(v, u, t) + (0xC76C51A3U + 0xa83f4394U);
    s += b;
    w = b + (rotate(x, (uint)30) ^ rotate(x, (uint)19) ^ rotate(x, (uint)10)) + bitselect(z, x, z ^ y);
  };
  {
    b = v + (rotate(s, (uint)26) ^ rotate(s, (uint)21) ^ rotate(s, (uint)7)) + bitselect(u, t, s) + (0xD192E819U + 0x45ad78f7U);
    z += b;
    v = b + (rotate(w, (uint)30) ^ rotate(w, (uint)19) ^ rotate(w, (uint)10)) + bitselect(y, w, y ^ x);
  };
  {
    b = u + (rotate(z, (uint)26) ^ rotate(z, (uint)21) ^ rotate(z, (uint)7)) + bitselect(t, s, z) + (0xD6990624U + 0x36f3d0cdU);
    y += b;
    u = b + (rotate(v, (uint)30) ^ rotate(v, (uint)19) ^ rotate(v, (uint)10)) + bitselect(x, v, x ^ w);
  };
  {
    b = t + (rotate(y, (uint)26) ^ rotate(y, (uint)21) ^ rotate(y, (uint)7)) + bitselect(s, z, y) + (0xF40E3585U + 0xd99c05e8U);
    x += b;
    t = b + (rotate(u, (uint)30) ^ rotate(u, (uint)19) ^ rotate(u, (uint)10)) + bitselect(w, u, w ^ v);
  };
  {
    b = s + (rotate(x, (uint)26) ^ rotate(x, (uint)21) ^ rotate(x, (uint)7)) + bitselect(z, y, x) + (0x106AA070U + 0xb0511dc7U);
    w += b;
    s = b + (rotate(t, (uint)30) ^ rotate(t, (uint)19) ^ rotate(t, (uint)10)) + bitselect(v, t, v ^ u);
  };
  {
    b = z + (rotate(w, (uint)26) ^ rotate(w, (uint)21) ^ rotate(w, (uint)7)) + bitselect(y, x, w) + (0x19A4C116U + 0x69bc7ac4U);
    v += b;
    z = b + (rotate(s, (uint)30) ^ rotate(s, (uint)19) ^ rotate(s, (uint)10)) + bitselect(u, s, u ^ t);
  };
  {
    b = y + (rotate(v, (uint)26) ^ rotate(v, (uint)21) ^ rotate(v, (uint)7)) + bitselect(x, w, v) + (0x1E376C08U + 0xbd11375bU);
    u += b;
    y = b + (rotate(z, (uint)30) ^ rotate(z, (uint)19) ^ rotate(z, (uint)10)) + bitselect(t, z, t ^ s);
  };
  {
    b = x + (rotate(u, (uint)26) ^ rotate(u, (uint)21) ^ rotate(u, (uint)7)) + bitselect(w, v, u) + (0x2748774CU + 0xe3ba71e5U);
    t += b;
    x = b + (rotate(y, (uint)30) ^ rotate(y, (uint)19) ^ rotate(y, (uint)10)) + bitselect(s, y, s ^ z);
  };
  {
    b = w + (rotate(t, (uint)26) ^ rotate(t, (uint)21) ^ rotate(t, (uint)7)) + bitselect(v, u, t) + (0x34B0BCB5U + 0x3b209ff2U);
    s += b;
    w = b + (rotate(x, (uint)30) ^ rotate(x, (uint)19) ^ rotate(x, (uint)10)) + bitselect(z, x, z ^ y);
  };
  {
    b = v + (rotate(s, (uint)26) ^ rotate(s, (uint)21) ^ rotate(s, (uint)7)) + bitselect(u, t, s) + (0x391C0CB3U + 0x18feee17U);
    z += b;
    v = b + (rotate(w, (uint)30) ^ rotate(w, (uint)19) ^ rotate(w, (uint)10)) + bitselect(y, w, y ^ x);
  };
  {
    b = u + (rotate(z, (uint)26) ^ rotate(z, (uint)21) ^ rotate(z, (uint)7)) + bitselect(t, s, z) + (0x4ED8AA4AU + 0xe25ad9e7U);
    y += b;
    u = b + (rotate(v, (uint)30) ^ rotate(v, (uint)19) ^ rotate(v, (uint)10)) + bitselect(x, v, x ^ w);
  };
  {
    b = t + (rotate(y, (uint)26) ^ rotate(y, (uint)21) ^ rotate(y, (uint)7)) + bitselect(s, z, y) + (0x5B9CCA4FU + 0x13375046U);
    x += b;
    t = b + (rotate(u, (uint)30) ^ rotate(u, (uint)19) ^ rotate(u, (uint)10)) + bitselect(w, u, w ^ v);
  };
  {
    b = s + (rotate(x, (uint)26) ^ rotate(x, (uint)21) ^ rotate(x, (uint)7)) + bitselect(z, y, x) + (0x682E6FF3U + 0x0515089dU);
    w += b;
    s = b + (rotate(t, (uint)30) ^ rotate(t, (uint)19) ^ rotate(t, (uint)10)) + bitselect(v, t, v ^ u);
  };
  {
    b = z + (rotate(w, (uint)26) ^ rotate(w, (uint)21) ^ rotate(w, (uint)7)) + bitselect(y, x, w) + (0x748F82EEU + 0x4f0d0f04U);
    v += b;
    z = b + (rotate(s, (uint)30) ^ rotate(s, (uint)19) ^ rotate(s, (uint)10)) + bitselect(u, s, u ^ t);
  };
  {
    b = y + (rotate(v, (uint)26) ^ rotate(v, (uint)21) ^ rotate(v, (uint)7)) + bitselect(x, w, v) + (0x78A5636FU + 0x2627484eU);
    u += b;
    y = b + (rotate(z, (uint)30) ^ rotate(z, (uint)19) ^ rotate(z, (uint)10)) + bitselect(t, z, t ^ s);
  };
  {
    b = x + (rotate(u, (uint)26) ^ rotate(u, (uint)21) ^ rotate(u, (uint)7)) + bitselect(w, v, u) + (0x84C87814U + 0x310128d2U);
    t += b;
    x = b + (rotate(y, (uint)30) ^ rotate(y, (uint)19) ^ rotate(y, (uint)10)) + bitselect(s, y, s ^ z);
  };
  {
    b = w + (rotate(t, (uint)26) ^ rotate(t, (uint)21) ^ rotate(t, (uint)7)) + bitselect(v, u, t) + (0x8CC70208U + 0xc668b434U);
    s += b;
    w = b + (rotate(x, (uint)30) ^ rotate(x, (uint)19) ^ rotate(x, (uint)10)) + bitselect(z, x, z ^ y);
  };
  { z += v + (rotate(s, (uint)26) ^ rotate(s, (uint)21) ^ rotate(s, (uint)7)) + bitselect(u, t, s) + (0x420841ccU + 0x90BEFFFAU); };

  return z + aa;
}
inline ulong B(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (8));
  return __builtin_astype((uint2)(bitselect(b.s0, b.s1, (uint)(1 << (8)) - 1), bitselect(b.s0, b.s1, (uint)(~((1 << (8)) - 1)))), ulong);
}
inline ulong C(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (9));
  return __builtin_astype((uint2)(bitselect(b.s0, b.s1, (uint)(1 << (9)) - 1), bitselect(b.s0, b.s1, (uint)(~((1 << (9)) - 1)))), ulong);
}
inline ulong D(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (10));
  return __builtin_astype((uint2)(bitselect(b.s0, b.s1, (uint)(1 << (10)) - 1), bitselect(b.s0, b.s1, (uint)(~((1 << (10)) - 1)))), ulong);
}
inline ulong E(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (13));
  return __builtin_astype((uint2)(bitselect(b.s0, b.s1, (uint)(1 << (13)) - 1), bitselect(b.s0, b.s1, (uint)(~((1 << (13)) - 1)))), ulong);
}
inline ulong F(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (14));
  return __builtin_astype((uint2)(bitselect(b.s0, b.s1, (uint)(1 << (14)) - 1), bitselect(b.s0, b.s1, (uint)(~((1 << (14)) - 1)))), ulong);
}
inline ulong G(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (17));
  return __builtin_astype((uint2)(bitselect(b.s0, b.s1, (uint)(1 << (17)) - 1), bitselect(b.s0, b.s1, (uint)(~((1 << (17)) - 1)))), ulong);
}
inline ulong H(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (19));
  return __builtin_astype((uint2)(bitselect(b.s0, b.s1, (uint)(1 << (19)) - 1), bitselect(b.s0, b.s1, (uint)(~((1 << (19)) - 1)))), ulong);
}
inline ulong I(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (22));
  return __builtin_astype((uint2)(bitselect(b.s0, b.s1, (uint)(1 << (22)) - 1), bitselect(b.s0, b.s1, (uint)(~((1 << (22)) - 1)))), ulong);
}
inline ulong J(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (24));
  return __builtin_astype((uint2)(bitselect(b.s0, b.s1, (uint)(1 << (24)) - 1), bitselect(b.s0, b.s1, (uint)(~((1 << (24)) - 1)))), ulong);
}
inline ulong K(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (25));
  return __builtin_astype((uint2)(bitselect(b.s0, b.s1, (uint)(1 << (25)) - 1), bitselect(b.s0, b.s1, (uint)(~((1 << (25)) - 1)))), ulong);
}
inline ulong L(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (27));
  return __builtin_astype((uint2)(bitselect(b.s0, b.s1, (uint)(1 << (27)) - 1), bitselect(b.s0, b.s1, (uint)(~((1 << (27)) - 1)))), ulong);
}
inline ulong M(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (29));
  return __builtin_astype((uint2)(bitselect(b.s0, b.s1, (uint)(1 << (29)) - 1), bitselect(b.s0, b.s1, (uint)(~((1 << (29)) - 1)))), ulong);
}
inline ulong N(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (30));
  return __builtin_astype((uint2)(bitselect(b.s0, b.s1, (uint)(1 << (30)) - 1), bitselect(b.s0, b.s1, (uint)(~((1 << (30)) - 1)))), ulong);
}
inline ulong O(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (33 - 32));
  return __builtin_astype((uint2)(bitselect(b.s1, b.s0, (uint)(1 << (33 - 32)) - 1), bitselect(b.s1, b.s0, (uint)(~((1 << (33 - 32)) - 1)))), ulong);
}
inline ulong P(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (34 - 32));
  return __builtin_astype((uint2)(bitselect(b.s1, b.s0, (uint)(1 << (34 - 32)) - 1), bitselect(b.s1, b.s0, (uint)(~((1 << (34 - 32)) - 1)))), ulong);
}
inline ulong Q(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (35 - 32));
  return __builtin_astype((uint2)(bitselect(b.s1, b.s0, (uint)(1 << (35 - 32)) - 1), bitselect(b.s1, b.s0, (uint)(~((1 << (35 - 32)) - 1)))), ulong);
}
inline ulong R(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (36 - 32));
  return __builtin_astype((uint2)(bitselect(b.s1, b.s0, (uint)(1 << (36 - 32)) - 1), bitselect(b.s1, b.s0, (uint)(~((1 << (36 - 32)) - 1)))), ulong);
}
inline ulong S(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (37 - 32));
  return __builtin_astype((uint2)(bitselect(b.s1, b.s0, (uint)(1 << (37 - 32)) - 1), bitselect(b.s1, b.s0, (uint)(~((1 << (37 - 32)) - 1)))), ulong);
}
inline ulong T(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (39 - 32));
  return __builtin_astype((uint2)(bitselect(b.s1, b.s0, (uint)(1 << (39 - 32)) - 1), bitselect(b.s1, b.s0, (uint)(~((1 << (39 - 32)) - 1)))), ulong);
}
inline ulong U(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (42 - 32));
  return __builtin_astype((uint2)(bitselect(b.s1, b.s0, (uint)(1 << (42 - 32)) - 1), bitselect(b.s1, b.s0, (uint)(~((1 << (42 - 32)) - 1)))), ulong);
}
inline ulong V(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (43 - 32));
  return __builtin_astype((uint2)(bitselect(b.s1, b.s0, (uint)(1 << (43 - 32)) - 1), bitselect(b.s1, b.s0, (uint)(~((1 << (43 - 32)) - 1)))), ulong);
}
inline ulong W(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (44 - 32));
  return __builtin_astype((uint2)(bitselect(b.s1, b.s0, (uint)(1 << (44 - 32)) - 1), bitselect(b.s1, b.s0, (uint)(~((1 << (44 - 32)) - 1)))), ulong);
}
inline ulong X(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (46 - 32));
  return __builtin_astype((uint2)(bitselect(b.s1, b.s0, (uint)(1 << (46 - 32)) - 1), bitselect(b.s1, b.s0, (uint)(~((1 << (46 - 32)) - 1)))), ulong);
}
inline ulong Y(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (49 - 32));
  return __builtin_astype((uint2)(bitselect(b.s1, b.s0, (uint)(1 << (49 - 32)) - 1), bitselect(b.s1, b.s0, (uint)(~((1 << (49 - 32)) - 1)))), ulong);
}
inline ulong Z(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (50 - 32));
  return __builtin_astype((uint2)(bitselect(b.s1, b.s0, (uint)(1 << (50 - 32)) - 1), bitselect(b.s1, b.s0, (uint)(~((1 << (50 - 32)) - 1)))), ulong);
}
inline ulong AA(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (54 - 32));
  return __builtin_astype((uint2)(bitselect(b.s1, b.s0, (uint)(1 << (54 - 32)) - 1), bitselect(b.s1, b.s0, (uint)(~((1 << (54 - 32)) - 1)))), ulong);
}
inline ulong AB(ulong a) {
  uint2 b = rotate(__builtin_astype(a, uint2), (56 - 32));
  return __builtin_astype((uint2)(bitselect(b.s1, b.s0, (uint)(1 << (56 - 32)) - 1), bitselect(b.s1, b.s0, (uint)(~((1 << (56 - 32)) - 1)))), ulong);
}
inline ulong8 AC(ulong8 a, ulong2 b) {
  ulong c, d, e;
  ulong f = a.s0, g = a.s1, h = a.s2, i = a.s3, j = a.s4, k = a.s5, l = a.s6, m = a.s7;
  ulong n = f ^ g ^ h ^ i ^ j ^ k ^ l ^ m ^ 0x1BD11BDAA9FC1A22UL;

  a.s01 += b;

  c = 80;
  d = 176UL << 56;
  e = 0xB000000000000050UL;

  a.s5 += 80;
  a.s6 += 176UL << 56;

  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = X(a.s1) ^ a.s0;
    a.s3 = R(a.s3) ^ a.s2;
    a.s5 = H(a.s5) ^ a.s4;
    a.s7 = S(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = O(a.s1) ^ a.s2;
    a.s7 = L(a.s7) ^ a.s4;
    a.s5 = F(a.s5) ^ a.s6;
    a.s3 = U(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = G(a.s1) ^ a.s4;
    a.s3 = Y(a.s3) ^ a.s6;
    a.s5 = R(a.s5) ^ a.s0;
    a.s7 = T(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = W(a.s1) ^ a.s6;
    a.s7 = C(a.s7) ^ a.s0;
    a.s5 = AA(a.s5) ^ a.s2;
    a.s3 = AB(a.s3) ^ a.s4;
  };
  ;
  a.s0 += g;
  a.s1 += h;
  a.s2 += i;
  a.s3 += j;
  a.s4 += k;
  a.s5 += l + d;
  a.s6 += m + e;
  a.s7 += n + 1;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = T(a.s1) ^ a.s0;
    a.s3 = N(a.s3) ^ a.s2;
    a.s5 = P(a.s5) ^ a.s4;
    a.s7 = J(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = E(a.s1) ^ a.s2;
    a.s7 = Z(a.s7) ^ a.s4;
    a.s5 = D(a.s5) ^ a.s6;
    a.s3 = G(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = K(a.s1) ^ a.s4;
    a.s3 = M(a.s3) ^ a.s6;
    a.s5 = T(a.s5) ^ a.s0;
    a.s7 = V(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = B(a.s1) ^ a.s6;
    a.s7 = Q(a.s7) ^ a.s0;
    a.s5 = AB(a.s5) ^ a.s2;
    a.s3 = I(a.s3) ^ a.s4;
  };
  ;
  a.s0 += h;
  a.s1 += i;
  a.s2 += j;
  a.s3 += k;
  a.s4 += l;
  a.s5 += m + e;
  a.s6 += n + c;
  a.s7 += f + 2;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = X(a.s1) ^ a.s0;
    a.s3 = R(a.s3) ^ a.s2;
    a.s5 = H(a.s5) ^ a.s4;
    a.s7 = S(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = O(a.s1) ^ a.s2;
    a.s7 = L(a.s7) ^ a.s4;
    a.s5 = F(a.s5) ^ a.s6;
    a.s3 = U(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = G(a.s1) ^ a.s4;
    a.s3 = Y(a.s3) ^ a.s6;
    a.s5 = R(a.s5) ^ a.s0;
    a.s7 = T(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = W(a.s1) ^ a.s6;
    a.s7 = C(a.s7) ^ a.s0;
    a.s5 = AA(a.s5) ^ a.s2;
    a.s3 = AB(a.s3) ^ a.s4;
  };
  ;
  a.s0 += i;
  a.s1 += j;
  a.s2 += k;
  a.s3 += l;
  a.s4 += m;
  a.s5 += n + c;
  a.s6 += f + d;
  a.s7 += g + 3;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = T(a.s1) ^ a.s0;
    a.s3 = N(a.s3) ^ a.s2;
    a.s5 = P(a.s5) ^ a.s4;
    a.s7 = J(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = E(a.s1) ^ a.s2;
    a.s7 = Z(a.s7) ^ a.s4;
    a.s5 = D(a.s5) ^ a.s6;
    a.s3 = G(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = K(a.s1) ^ a.s4;
    a.s3 = M(a.s3) ^ a.s6;
    a.s5 = T(a.s5) ^ a.s0;
    a.s7 = V(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = B(a.s1) ^ a.s6;
    a.s7 = Q(a.s7) ^ a.s0;
    a.s5 = AB(a.s5) ^ a.s2;
    a.s3 = I(a.s3) ^ a.s4;
  };
  ;
  a.s0 += j;
  a.s1 += k;
  a.s2 += l;
  a.s3 += m;
  a.s4 += n;
  a.s5 += f + d;
  a.s6 += g + e;
  a.s7 += h + 4;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = X(a.s1) ^ a.s0;
    a.s3 = R(a.s3) ^ a.s2;
    a.s5 = H(a.s5) ^ a.s4;
    a.s7 = S(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = O(a.s1) ^ a.s2;
    a.s7 = L(a.s7) ^ a.s4;
    a.s5 = F(a.s5) ^ a.s6;
    a.s3 = U(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = G(a.s1) ^ a.s4;
    a.s3 = Y(a.s3) ^ a.s6;
    a.s5 = R(a.s5) ^ a.s0;
    a.s7 = T(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = W(a.s1) ^ a.s6;
    a.s7 = C(a.s7) ^ a.s0;
    a.s5 = AA(a.s5) ^ a.s2;
    a.s3 = AB(a.s3) ^ a.s4;
  };
  ;
  a.s0 += k;
  a.s1 += l;
  a.s2 += m;
  a.s3 += n;
  a.s4 += f;
  a.s5 += g + e;
  a.s6 += h + c;
  a.s7 += i + 5;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = T(a.s1) ^ a.s0;
    a.s3 = N(a.s3) ^ a.s2;
    a.s5 = P(a.s5) ^ a.s4;
    a.s7 = J(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = E(a.s1) ^ a.s2;
    a.s7 = Z(a.s7) ^ a.s4;
    a.s5 = D(a.s5) ^ a.s6;
    a.s3 = G(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = K(a.s1) ^ a.s4;
    a.s3 = M(a.s3) ^ a.s6;
    a.s5 = T(a.s5) ^ a.s0;
    a.s7 = V(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = B(a.s1) ^ a.s6;
    a.s7 = Q(a.s7) ^ a.s0;
    a.s5 = AB(a.s5) ^ a.s2;
    a.s3 = I(a.s3) ^ a.s4;
  };
  ;
  a.s0 += l;
  a.s1 += m;
  a.s2 += n;
  a.s3 += f;
  a.s4 += g;
  a.s5 += h + c;
  a.s6 += i + d;
  a.s7 += j + 6;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = X(a.s1) ^ a.s0;
    a.s3 = R(a.s3) ^ a.s2;
    a.s5 = H(a.s5) ^ a.s4;
    a.s7 = S(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = O(a.s1) ^ a.s2;
    a.s7 = L(a.s7) ^ a.s4;
    a.s5 = F(a.s5) ^ a.s6;
    a.s3 = U(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = G(a.s1) ^ a.s4;
    a.s3 = Y(a.s3) ^ a.s6;
    a.s5 = R(a.s5) ^ a.s0;
    a.s7 = T(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = W(a.s1) ^ a.s6;
    a.s7 = C(a.s7) ^ a.s0;
    a.s5 = AA(a.s5) ^ a.s2;
    a.s3 = AB(a.s3) ^ a.s4;
  };
  ;
  a.s0 += m;
  a.s1 += n;
  a.s2 += f;
  a.s3 += g;
  a.s4 += h;
  a.s5 += i + d;
  a.s6 += j + e;
  a.s7 += k + 7;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = T(a.s1) ^ a.s0;
    a.s3 = N(a.s3) ^ a.s2;
    a.s5 = P(a.s5) ^ a.s4;
    a.s7 = J(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = E(a.s1) ^ a.s2;
    a.s7 = Z(a.s7) ^ a.s4;
    a.s5 = D(a.s5) ^ a.s6;
    a.s3 = G(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = K(a.s1) ^ a.s4;
    a.s3 = M(a.s3) ^ a.s6;
    a.s5 = T(a.s5) ^ a.s0;
    a.s7 = V(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = B(a.s1) ^ a.s6;
    a.s7 = Q(a.s7) ^ a.s0;
    a.s5 = AB(a.s5) ^ a.s2;
    a.s3 = I(a.s3) ^ a.s4;
  };
  ;
  a.s0 += n;
  a.s1 += f;
  a.s2 += g;
  a.s3 += h;
  a.s4 += i;
  a.s5 += j + e;
  a.s6 += k + c;
  a.s7 += l + 8;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = X(a.s1) ^ a.s0;
    a.s3 = R(a.s3) ^ a.s2;
    a.s5 = H(a.s5) ^ a.s4;
    a.s7 = S(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = O(a.s1) ^ a.s2;
    a.s7 = L(a.s7) ^ a.s4;
    a.s5 = F(a.s5) ^ a.s6;
    a.s3 = U(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = G(a.s1) ^ a.s4;
    a.s3 = Y(a.s3) ^ a.s6;
    a.s5 = R(a.s5) ^ a.s0;
    a.s7 = T(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = W(a.s1) ^ a.s6;
    a.s7 = C(a.s7) ^ a.s0;
    a.s5 = AA(a.s5) ^ a.s2;
    a.s3 = AB(a.s3) ^ a.s4;
  };
  ;
  a.s0 += f;
  a.s1 += g;
  a.s2 += h;
  a.s3 += i;
  a.s4 += j;
  a.s5 += k + c;
  a.s6 += l + d;
  a.s7 += m + 9;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = T(a.s1) ^ a.s0;
    a.s3 = N(a.s3) ^ a.s2;
    a.s5 = P(a.s5) ^ a.s4;
    a.s7 = J(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = E(a.s1) ^ a.s2;
    a.s7 = Z(a.s7) ^ a.s4;
    a.s5 = D(a.s5) ^ a.s6;
    a.s3 = G(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = K(a.s1) ^ a.s4;
    a.s3 = M(a.s3) ^ a.s6;
    a.s5 = T(a.s5) ^ a.s0;
    a.s7 = V(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = B(a.s1) ^ a.s6;
    a.s7 = Q(a.s7) ^ a.s0;
    a.s5 = AB(a.s5) ^ a.s2;
    a.s3 = I(a.s3) ^ a.s4;
  };
  ;
  a.s0 += g;
  a.s1 += h;
  a.s2 += i;
  a.s3 += j;
  a.s4 += k;
  a.s5 += l + d;
  a.s6 += m + e;
  a.s7 += n + 10;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = X(a.s1) ^ a.s0;
    a.s3 = R(a.s3) ^ a.s2;
    a.s5 = H(a.s5) ^ a.s4;
    a.s7 = S(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = O(a.s1) ^ a.s2;
    a.s7 = L(a.s7) ^ a.s4;
    a.s5 = F(a.s5) ^ a.s6;
    a.s3 = U(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = G(a.s1) ^ a.s4;
    a.s3 = Y(a.s3) ^ a.s6;
    a.s5 = R(a.s5) ^ a.s0;
    a.s7 = T(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = W(a.s1) ^ a.s6;
    a.s7 = C(a.s7) ^ a.s0;
    a.s5 = AA(a.s5) ^ a.s2;
    a.s3 = AB(a.s3) ^ a.s4;
  };
  ;
  a.s0 += h;
  a.s1 += i;
  a.s2 += j;
  a.s3 += k;
  a.s4 += l;
  a.s5 += m + e;
  a.s6 += n + c;
  a.s7 += f + 11;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = T(a.s1) ^ a.s0;
    a.s3 = N(a.s3) ^ a.s2;
    a.s5 = P(a.s5) ^ a.s4;
    a.s7 = J(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = E(a.s1) ^ a.s2;
    a.s7 = Z(a.s7) ^ a.s4;
    a.s5 = D(a.s5) ^ a.s6;
    a.s3 = G(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = K(a.s1) ^ a.s4;
    a.s3 = M(a.s3) ^ a.s6;
    a.s5 = T(a.s5) ^ a.s0;
    a.s7 = V(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = B(a.s1) ^ a.s6;
    a.s7 = Q(a.s7) ^ a.s0;
    a.s5 = AB(a.s5) ^ a.s2;
    a.s3 = I(a.s3) ^ a.s4;
  };
  ;
  a.s0 += i;
  a.s1 += j;
  a.s2 += k;
  a.s3 += l;
  a.s4 += m;
  a.s5 += n + c;
  a.s6 += f + d;
  a.s7 += g + 12;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = X(a.s1) ^ a.s0;
    a.s3 = R(a.s3) ^ a.s2;
    a.s5 = H(a.s5) ^ a.s4;
    a.s7 = S(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = O(a.s1) ^ a.s2;
    a.s7 = L(a.s7) ^ a.s4;
    a.s5 = F(a.s5) ^ a.s6;
    a.s3 = U(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = G(a.s1) ^ a.s4;
    a.s3 = Y(a.s3) ^ a.s6;
    a.s5 = R(a.s5) ^ a.s0;
    a.s7 = T(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = W(a.s1) ^ a.s6;
    a.s7 = C(a.s7) ^ a.s0;
    a.s5 = AA(a.s5) ^ a.s2;
    a.s3 = AB(a.s3) ^ a.s4;
  };
  ;
  a.s0 += j;
  a.s1 += k;
  a.s2 += l;
  a.s3 += m;
  a.s4 += n;
  a.s5 += f + d;
  a.s6 += g + e;
  a.s7 += h + 13;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = T(a.s1) ^ a.s0;
    a.s3 = N(a.s3) ^ a.s2;
    a.s5 = P(a.s5) ^ a.s4;
    a.s7 = J(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = E(a.s1) ^ a.s2;
    a.s7 = Z(a.s7) ^ a.s4;
    a.s5 = D(a.s5) ^ a.s6;
    a.s3 = G(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = K(a.s1) ^ a.s4;
    a.s3 = M(a.s3) ^ a.s6;
    a.s5 = T(a.s5) ^ a.s0;
    a.s7 = V(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = B(a.s1) ^ a.s6;
    a.s7 = Q(a.s7) ^ a.s0;
    a.s5 = AB(a.s5) ^ a.s2;
    a.s3 = I(a.s3) ^ a.s4;
  };
  ;
  a.s0 += k;
  a.s1 += l;
  a.s2 += m;
  a.s3 += n;
  a.s4 += f;
  a.s5 += g + e;
  a.s6 += h + c;
  a.s7 += i + 14;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = X(a.s1) ^ a.s0;
    a.s3 = R(a.s3) ^ a.s2;
    a.s5 = H(a.s5) ^ a.s4;
    a.s7 = S(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = O(a.s1) ^ a.s2;
    a.s7 = L(a.s7) ^ a.s4;
    a.s5 = F(a.s5) ^ a.s6;
    a.s3 = U(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = G(a.s1) ^ a.s4;
    a.s3 = Y(a.s3) ^ a.s6;
    a.s5 = R(a.s5) ^ a.s0;
    a.s7 = T(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = W(a.s1) ^ a.s6;
    a.s7 = C(a.s7) ^ a.s0;
    a.s5 = AA(a.s5) ^ a.s2;
    a.s3 = AB(a.s3) ^ a.s4;
  };
  ;
  a.s0 += l;
  a.s1 += m;
  a.s2 += n;
  a.s3 += f;
  a.s4 += g;
  a.s5 += h + c;
  a.s6 += i + d;
  a.s7 += j + 15;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = T(a.s1) ^ a.s0;
    a.s3 = N(a.s3) ^ a.s2;
    a.s5 = P(a.s5) ^ a.s4;
    a.s7 = J(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = E(a.s1) ^ a.s2;
    a.s7 = Z(a.s7) ^ a.s4;
    a.s5 = D(a.s5) ^ a.s6;
    a.s3 = G(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = K(a.s1) ^ a.s4;
    a.s3 = M(a.s3) ^ a.s6;
    a.s5 = T(a.s5) ^ a.s0;
    a.s7 = V(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = B(a.s1) ^ a.s6;
    a.s7 = Q(a.s7) ^ a.s0;
    a.s5 = AB(a.s5) ^ a.s2;
    a.s3 = I(a.s3) ^ a.s4;
  };
  ;
  a.s0 += m;
  a.s1 += n;
  a.s2 += f;
  a.s3 += g;
  a.s4 += h;
  a.s5 += i + d;
  a.s6 += j + e;
  a.s7 += k + 16;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = X(a.s1) ^ a.s0;
    a.s3 = R(a.s3) ^ a.s2;
    a.s5 = H(a.s5) ^ a.s4;
    a.s7 = S(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = O(a.s1) ^ a.s2;
    a.s7 = L(a.s7) ^ a.s4;
    a.s5 = F(a.s5) ^ a.s6;
    a.s3 = U(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = G(a.s1) ^ a.s4;
    a.s3 = Y(a.s3) ^ a.s6;
    a.s5 = R(a.s5) ^ a.s0;
    a.s7 = T(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = W(a.s1) ^ a.s6;
    a.s7 = C(a.s7) ^ a.s0;
    a.s5 = AA(a.s5) ^ a.s2;
    a.s3 = AB(a.s3) ^ a.s4;
  };
  ;
  a.s0 += n;
  a.s1 += f;
  a.s2 += g;
  a.s3 += h;
  a.s4 += i;
  a.s5 += j + e;
  a.s6 += k + c;
  a.s7 += l + 17;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = T(a.s1) ^ a.s0;
    a.s3 = N(a.s3) ^ a.s2;
    a.s5 = P(a.s5) ^ a.s4;
    a.s7 = J(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = E(a.s1) ^ a.s2;
    a.s7 = Z(a.s7) ^ a.s4;
    a.s5 = D(a.s5) ^ a.s6;
    a.s3 = G(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = K(a.s1) ^ a.s4;
    a.s3 = M(a.s3) ^ a.s6;
    a.s5 = T(a.s5) ^ a.s0;
    a.s7 = V(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = B(a.s1) ^ a.s6;
    a.s7 = Q(a.s7) ^ a.s0;
    a.s5 = AB(a.s5) ^ a.s2;
    a.s3 = I(a.s3) ^ a.s4;
  };
  ;
  a.s0 += f;
  a.s1 += g;
  a.s2 += h;
  a.s3 += i;
  a.s4 += j;
  a.s5 += k + c;
  a.s6 += l + d;
  a.s7 += m + 18;
  ;
  ;

  a.s01 ^= b;
  f = a.s0;
  g = a.s1;
  h = a.s2;
  i = a.s3;
  j = a.s4;
  k = a.s5;
  l = a.s6;
  m = a.s7;
  n = f ^ g ^ h ^ i ^ j ^ k ^ l ^ m ^ 0x1BD11BDAA9FC1A22UL;

  c = 8UL;
  d = 255UL << 56;
  e = 0xFF00000000000008UL;

  a.s5 += 8UL;
  a.s6 += 255UL << 56;

  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = X(a.s1) ^ a.s0;
    a.s3 = R(a.s3) ^ a.s2;
    a.s5 = H(a.s5) ^ a.s4;
    a.s7 = S(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = O(a.s1) ^ a.s2;
    a.s7 = L(a.s7) ^ a.s4;
    a.s5 = F(a.s5) ^ a.s6;
    a.s3 = U(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = G(a.s1) ^ a.s4;
    a.s3 = Y(a.s3) ^ a.s6;
    a.s5 = R(a.s5) ^ a.s0;
    a.s7 = T(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = W(a.s1) ^ a.s6;
    a.s7 = C(a.s7) ^ a.s0;
    a.s5 = AA(a.s5) ^ a.s2;
    a.s3 = AB(a.s3) ^ a.s4;
  };
  ;
  a.s0 += g;
  a.s1 += h;
  a.s2 += i;
  a.s3 += j;
  a.s4 += k;
  a.s5 += l + d;
  a.s6 += m + e;
  a.s7 += n + 1;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = T(a.s1) ^ a.s0;
    a.s3 = N(a.s3) ^ a.s2;
    a.s5 = P(a.s5) ^ a.s4;
    a.s7 = J(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = E(a.s1) ^ a.s2;
    a.s7 = Z(a.s7) ^ a.s4;
    a.s5 = D(a.s5) ^ a.s6;
    a.s3 = G(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = K(a.s1) ^ a.s4;
    a.s3 = M(a.s3) ^ a.s6;
    a.s5 = T(a.s5) ^ a.s0;
    a.s7 = V(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = B(a.s1) ^ a.s6;
    a.s7 = Q(a.s7) ^ a.s0;
    a.s5 = AB(a.s5) ^ a.s2;
    a.s3 = I(a.s3) ^ a.s4;
  };
  ;
  a.s0 += h;
  a.s1 += i;
  a.s2 += j;
  a.s3 += k;
  a.s4 += l;
  a.s5 += m + e;
  a.s6 += n + c;
  a.s7 += f + 2;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = X(a.s1) ^ a.s0;
    a.s3 = R(a.s3) ^ a.s2;
    a.s5 = H(a.s5) ^ a.s4;
    a.s7 = S(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = O(a.s1) ^ a.s2;
    a.s7 = L(a.s7) ^ a.s4;
    a.s5 = F(a.s5) ^ a.s6;
    a.s3 = U(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = G(a.s1) ^ a.s4;
    a.s3 = Y(a.s3) ^ a.s6;
    a.s5 = R(a.s5) ^ a.s0;
    a.s7 = T(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = W(a.s1) ^ a.s6;
    a.s7 = C(a.s7) ^ a.s0;
    a.s5 = AA(a.s5) ^ a.s2;
    a.s3 = AB(a.s3) ^ a.s4;
  };
  ;
  a.s0 += i;
  a.s1 += j;
  a.s2 += k;
  a.s3 += l;
  a.s4 += m;
  a.s5 += n + c;
  a.s6 += f + d;
  a.s7 += g + 3;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = T(a.s1) ^ a.s0;
    a.s3 = N(a.s3) ^ a.s2;
    a.s5 = P(a.s5) ^ a.s4;
    a.s7 = J(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = E(a.s1) ^ a.s2;
    a.s7 = Z(a.s7) ^ a.s4;
    a.s5 = D(a.s5) ^ a.s6;
    a.s3 = G(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = K(a.s1) ^ a.s4;
    a.s3 = M(a.s3) ^ a.s6;
    a.s5 = T(a.s5) ^ a.s0;
    a.s7 = V(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = B(a.s1) ^ a.s6;
    a.s7 = Q(a.s7) ^ a.s0;
    a.s5 = AB(a.s5) ^ a.s2;
    a.s3 = I(a.s3) ^ a.s4;
  };
  ;
  a.s0 += j;
  a.s1 += k;
  a.s2 += l;
  a.s3 += m;
  a.s4 += n;
  a.s5 += f + d;
  a.s6 += g + e;
  a.s7 += h + 4;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = X(a.s1) ^ a.s0;
    a.s3 = R(a.s3) ^ a.s2;
    a.s5 = H(a.s5) ^ a.s4;
    a.s7 = S(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = O(a.s1) ^ a.s2;
    a.s7 = L(a.s7) ^ a.s4;
    a.s5 = F(a.s5) ^ a.s6;
    a.s3 = U(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = G(a.s1) ^ a.s4;
    a.s3 = Y(a.s3) ^ a.s6;
    a.s5 = R(a.s5) ^ a.s0;
    a.s7 = T(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = W(a.s1) ^ a.s6;
    a.s7 = C(a.s7) ^ a.s0;
    a.s5 = AA(a.s5) ^ a.s2;
    a.s3 = AB(a.s3) ^ a.s4;
  };
  ;
  a.s0 += k;
  a.s1 += l;
  a.s2 += m;
  a.s3 += n;
  a.s4 += f;
  a.s5 += g + e;
  a.s6 += h + c;
  a.s7 += i + 5;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = T(a.s1) ^ a.s0;
    a.s3 = N(a.s3) ^ a.s2;
    a.s5 = P(a.s5) ^ a.s4;
    a.s7 = J(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = E(a.s1) ^ a.s2;
    a.s7 = Z(a.s7) ^ a.s4;
    a.s5 = D(a.s5) ^ a.s6;
    a.s3 = G(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = K(a.s1) ^ a.s4;
    a.s3 = M(a.s3) ^ a.s6;
    a.s5 = T(a.s5) ^ a.s0;
    a.s7 = V(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = B(a.s1) ^ a.s6;
    a.s7 = Q(a.s7) ^ a.s0;
    a.s5 = AB(a.s5) ^ a.s2;
    a.s3 = I(a.s3) ^ a.s4;
  };
  ;
  a.s0 += l;
  a.s1 += m;
  a.s2 += n;
  a.s3 += f;
  a.s4 += g;
  a.s5 += h + c;
  a.s6 += i + d;
  a.s7 += j + 6;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = X(a.s1) ^ a.s0;
    a.s3 = R(a.s3) ^ a.s2;
    a.s5 = H(a.s5) ^ a.s4;
    a.s7 = S(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = O(a.s1) ^ a.s2;
    a.s7 = L(a.s7) ^ a.s4;
    a.s5 = F(a.s5) ^ a.s6;
    a.s3 = U(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = G(a.s1) ^ a.s4;
    a.s3 = Y(a.s3) ^ a.s6;
    a.s5 = R(a.s5) ^ a.s0;
    a.s7 = T(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = W(a.s1) ^ a.s6;
    a.s7 = C(a.s7) ^ a.s0;
    a.s5 = AA(a.s5) ^ a.s2;
    a.s3 = AB(a.s3) ^ a.s4;
  };
  ;
  a.s0 += m;
  a.s1 += n;
  a.s2 += f;
  a.s3 += g;
  a.s4 += h;
  a.s5 += i + d;
  a.s6 += j + e;
  a.s7 += k + 7;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = T(a.s1) ^ a.s0;
    a.s3 = N(a.s3) ^ a.s2;
    a.s5 = P(a.s5) ^ a.s4;
    a.s7 = J(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = E(a.s1) ^ a.s2;
    a.s7 = Z(a.s7) ^ a.s4;
    a.s5 = D(a.s5) ^ a.s6;
    a.s3 = G(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = K(a.s1) ^ a.s4;
    a.s3 = M(a.s3) ^ a.s6;
    a.s5 = T(a.s5) ^ a.s0;
    a.s7 = V(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = B(a.s1) ^ a.s6;
    a.s7 = Q(a.s7) ^ a.s0;
    a.s5 = AB(a.s5) ^ a.s2;
    a.s3 = I(a.s3) ^ a.s4;
  };
  ;
  a.s0 += n;
  a.s1 += f;
  a.s2 += g;
  a.s3 += h;
  a.s4 += i;
  a.s5 += j + e;
  a.s6 += k + c;
  a.s7 += l + 8;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = X(a.s1) ^ a.s0;
    a.s3 = R(a.s3) ^ a.s2;
    a.s5 = H(a.s5) ^ a.s4;
    a.s7 = S(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = O(a.s1) ^ a.s2;
    a.s7 = L(a.s7) ^ a.s4;
    a.s5 = F(a.s5) ^ a.s6;
    a.s3 = U(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = G(a.s1) ^ a.s4;
    a.s3 = Y(a.s3) ^ a.s6;
    a.s5 = R(a.s5) ^ a.s0;
    a.s7 = T(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = W(a.s1) ^ a.s6;
    a.s7 = C(a.s7) ^ a.s0;
    a.s5 = AA(a.s5) ^ a.s2;
    a.s3 = AB(a.s3) ^ a.s4;
  };
  ;
  a.s0 += f;
  a.s1 += g;
  a.s2 += h;
  a.s3 += i;
  a.s4 += j;
  a.s5 += k + c;
  a.s6 += l + d;
  a.s7 += m + 9;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = T(a.s1) ^ a.s0;
    a.s3 = N(a.s3) ^ a.s2;
    a.s5 = P(a.s5) ^ a.s4;
    a.s7 = J(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = E(a.s1) ^ a.s2;
    a.s7 = Z(a.s7) ^ a.s4;
    a.s5 = D(a.s5) ^ a.s6;
    a.s3 = G(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = K(a.s1) ^ a.s4;
    a.s3 = M(a.s3) ^ a.s6;
    a.s5 = T(a.s5) ^ a.s0;
    a.s7 = V(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = B(a.s1) ^ a.s6;
    a.s7 = Q(a.s7) ^ a.s0;
    a.s5 = AB(a.s5) ^ a.s2;
    a.s3 = I(a.s3) ^ a.s4;
  };
  ;
  a.s0 += g;
  a.s1 += h;
  a.s2 += i;
  a.s3 += j;
  a.s4 += k;
  a.s5 += l + d;
  a.s6 += m + e;
  a.s7 += n + 10;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = X(a.s1) ^ a.s0;
    a.s3 = R(a.s3) ^ a.s2;
    a.s5 = H(a.s5) ^ a.s4;
    a.s7 = S(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = O(a.s1) ^ a.s2;
    a.s7 = L(a.s7) ^ a.s4;
    a.s5 = F(a.s5) ^ a.s6;
    a.s3 = U(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = G(a.s1) ^ a.s4;
    a.s3 = Y(a.s3) ^ a.s6;
    a.s5 = R(a.s5) ^ a.s0;
    a.s7 = T(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = W(a.s1) ^ a.s6;
    a.s7 = C(a.s7) ^ a.s0;
    a.s5 = AA(a.s5) ^ a.s2;
    a.s3 = AB(a.s3) ^ a.s4;
  };
  ;
  a.s0 += h;
  a.s1 += i;
  a.s2 += j;
  a.s3 += k;
  a.s4 += l;
  a.s5 += m + e;
  a.s6 += n + c;
  a.s7 += f + 11;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = T(a.s1) ^ a.s0;
    a.s3 = N(a.s3) ^ a.s2;
    a.s5 = P(a.s5) ^ a.s4;
    a.s7 = J(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = E(a.s1) ^ a.s2;
    a.s7 = Z(a.s7) ^ a.s4;
    a.s5 = D(a.s5) ^ a.s6;
    a.s3 = G(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = K(a.s1) ^ a.s4;
    a.s3 = M(a.s3) ^ a.s6;
    a.s5 = T(a.s5) ^ a.s0;
    a.s7 = V(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = B(a.s1) ^ a.s6;
    a.s7 = Q(a.s7) ^ a.s0;
    a.s5 = AB(a.s5) ^ a.s2;
    a.s3 = I(a.s3) ^ a.s4;
  };
  ;
  a.s0 += i;
  a.s1 += j;
  a.s2 += k;
  a.s3 += l;
  a.s4 += m;
  a.s5 += n + c;
  a.s6 += f + d;
  a.s7 += g + 12;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = X(a.s1) ^ a.s0;
    a.s3 = R(a.s3) ^ a.s2;
    a.s5 = H(a.s5) ^ a.s4;
    a.s7 = S(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = O(a.s1) ^ a.s2;
    a.s7 = L(a.s7) ^ a.s4;
    a.s5 = F(a.s5) ^ a.s6;
    a.s3 = U(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = G(a.s1) ^ a.s4;
    a.s3 = Y(a.s3) ^ a.s6;
    a.s5 = R(a.s5) ^ a.s0;
    a.s7 = T(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = W(a.s1) ^ a.s6;
    a.s7 = C(a.s7) ^ a.s0;
    a.s5 = AA(a.s5) ^ a.s2;
    a.s3 = AB(a.s3) ^ a.s4;
  };
  ;
  a.s0 += j;
  a.s1 += k;
  a.s2 += l;
  a.s3 += m;
  a.s4 += n;
  a.s5 += f + d;
  a.s6 += g + e;
  a.s7 += h + 13;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = T(a.s1) ^ a.s0;
    a.s3 = N(a.s3) ^ a.s2;
    a.s5 = P(a.s5) ^ a.s4;
    a.s7 = J(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = E(a.s1) ^ a.s2;
    a.s7 = Z(a.s7) ^ a.s4;
    a.s5 = D(a.s5) ^ a.s6;
    a.s3 = G(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = K(a.s1) ^ a.s4;
    a.s3 = M(a.s3) ^ a.s6;
    a.s5 = T(a.s5) ^ a.s0;
    a.s7 = V(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = B(a.s1) ^ a.s6;
    a.s7 = Q(a.s7) ^ a.s0;
    a.s5 = AB(a.s5) ^ a.s2;
    a.s3 = I(a.s3) ^ a.s4;
  };
  ;
  a.s0 += k;
  a.s1 += l;
  a.s2 += m;
  a.s3 += n;
  a.s4 += f;
  a.s5 += g + e;
  a.s6 += h + c;
  a.s7 += i + 14;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = X(a.s1) ^ a.s0;
    a.s3 = R(a.s3) ^ a.s2;
    a.s5 = H(a.s5) ^ a.s4;
    a.s7 = S(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = O(a.s1) ^ a.s2;
    a.s7 = L(a.s7) ^ a.s4;
    a.s5 = F(a.s5) ^ a.s6;
    a.s3 = U(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = G(a.s1) ^ a.s4;
    a.s3 = Y(a.s3) ^ a.s6;
    a.s5 = R(a.s5) ^ a.s0;
    a.s7 = T(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = W(a.s1) ^ a.s6;
    a.s7 = C(a.s7) ^ a.s0;
    a.s5 = AA(a.s5) ^ a.s2;
    a.s3 = AB(a.s3) ^ a.s4;
  };
  ;
  a.s0 += l;
  a.s1 += m;
  a.s2 += n;
  a.s3 += f;
  a.s4 += g;
  a.s5 += h + c;
  a.s6 += i + d;
  a.s7 += j + 15;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = T(a.s1) ^ a.s0;
    a.s3 = N(a.s3) ^ a.s2;
    a.s5 = P(a.s5) ^ a.s4;
    a.s7 = J(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = E(a.s1) ^ a.s2;
    a.s7 = Z(a.s7) ^ a.s4;
    a.s5 = D(a.s5) ^ a.s6;
    a.s3 = G(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = K(a.s1) ^ a.s4;
    a.s3 = M(a.s3) ^ a.s6;
    a.s5 = T(a.s5) ^ a.s0;
    a.s7 = V(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = B(a.s1) ^ a.s6;
    a.s7 = Q(a.s7) ^ a.s0;
    a.s5 = AB(a.s5) ^ a.s2;
    a.s3 = I(a.s3) ^ a.s4;
  };
  ;
  a.s0 += m;
  a.s1 += n;
  a.s2 += f;
  a.s3 += g;
  a.s4 += h;
  a.s5 += i + d;
  a.s6 += j + e;
  a.s7 += k + 16;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = X(a.s1) ^ a.s0;
    a.s3 = R(a.s3) ^ a.s2;
    a.s5 = H(a.s5) ^ a.s4;
    a.s7 = S(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = O(a.s1) ^ a.s2;
    a.s7 = L(a.s7) ^ a.s4;
    a.s5 = F(a.s5) ^ a.s6;
    a.s3 = U(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = G(a.s1) ^ a.s4;
    a.s3 = Y(a.s3) ^ a.s6;
    a.s5 = R(a.s5) ^ a.s0;
    a.s7 = T(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = W(a.s1) ^ a.s6;
    a.s7 = C(a.s7) ^ a.s0;
    a.s5 = AA(a.s5) ^ a.s2;
    a.s3 = AB(a.s3) ^ a.s4;
  };
  ;
  a.s0 += n;
  a.s1 += f;
  a.s2 += g;
  a.s3 += h;
  a.s4 += i;
  a.s5 += j + e;
  a.s6 += k + c;
  a.s7 += l + 17;
  ;
  {
    a.s0 += a.s1;
    a.s2 += a.s3;
    a.s4 += a.s5;
    a.s6 += a.s7;
    a.s1 = T(a.s1) ^ a.s0;
    a.s3 = N(a.s3) ^ a.s2;
    a.s5 = P(a.s5) ^ a.s4;
    a.s7 = J(a.s7) ^ a.s6;
  };
  {
    a.s2 += a.s1;
    a.s4 += a.s7;
    a.s6 += a.s5;
    a.s0 += a.s3;
    a.s1 = E(a.s1) ^ a.s2;
    a.s7 = Z(a.s7) ^ a.s4;
    a.s5 = D(a.s5) ^ a.s6;
    a.s3 = G(a.s3) ^ a.s0;
  };
  {
    a.s4 += a.s1;
    a.s6 += a.s3;
    a.s0 += a.s5;
    a.s2 += a.s7;
    a.s1 = K(a.s1) ^ a.s4;
    a.s3 = M(a.s3) ^ a.s6;
    a.s5 = T(a.s5) ^ a.s0;
    a.s7 = V(a.s7) ^ a.s2;
  };
  {
    a.s6 += a.s1;
    a.s0 += a.s7;
    a.s2 += a.s5;
    a.s4 += a.s3;
    a.s1 = B(a.s1) ^ a.s6;
    a.s7 = Q(a.s7) ^ a.s0;
    a.s5 = AB(a.s5) ^ a.s2;
    a.s3 = I(a.s3) ^ a.s4;
  };
  ;
  a.s0 += f;
  a.s1 += g;
  a.s2 += h;
  a.s3 += i;
  a.s4 += j;
  a.s5 += k + c;
  a.s6 += l + d;
  a.s7 += m + 18;
  ;
  ;

  return a;
}

__kernel void AD(const ulong a, const ulong b, const ulong c, const ulong d, const ulong e, const ulong f, const ulong g, const ulong h, const uint i, const uint j, const uint k, __global volatile uint* l) {
  uint m = get_global_id(0);
    ulong8h   ulong2 o = __builtin_astype((uinkbuiltin_astype(__builtin_astype(mhar4).wzyx, uint))), ulong2);

    if (A(__builtin_astype(AC(n, o), uint16)) & 0xc0ffffff)
      return;
    l[l[(0xFF)]++] = m;
}
uint A(uint a, uint b, uint c) {
  return (uint)(((((long)a) << 32) | (long)b) >> (c & 31));
}
uint2 B(uint2 a, uint2 b, uint c) {
  return (uint2){(uint)(((((long)a) << 32) | (long)b) >> (c31)), (uint)(((((long)a) << 32) | (long)b) >> (c31))};
}
inline uint8 C(uint16 a, uint8 b) {
  uint c;
  uint8 d;
  uint e = (a.s0);
  uint f = (a.s1);
  uint g = (a.s2);
  uint h = (a.s3);
  uint i = (a.s4);
  uint j = (a.s5);
  uint k = (a.s6);
  uint l = (a.s7);
  uint m = (a.s8);
  uint n = (a.s9);
  uint o = (a.sA);
  uint p = (a.sB);
  uint q = (a.sC);
  uint r = (a.sD);
  uint s = (a.sE);
  uint t = (a.sF);

  uint u = b.s0;
  uint v = b.s1;
  uint w = b.s2;
  uint x = b.s3;
  uint y = b.s4;
  uint z = b.s5;
  uint aa = b.s6;
  uint ab = b.s7;

  {
    c = ab + (rotate(y, 26U) ^ rotate(y, 21U) ^ rotate(y, 7U)) + bitselect(aa, z, y) + (0x428A2F98 + e);
    x += c;
    ab = c + (rotate(u, 30U) ^ rotate(u, 19U) ^ rotate(u, 10U)) + bitselect(w, u, w ^ v);
  };
  {
    c = aa + (rotate(x, 26U) ^ rotate(x, 21U) ^ rotate(x, 7U)) + bitselect(z, y, x) + (0x71374491 + f);
    w += c;
    aa = c + (rotate(ab, 30U) ^ rotate(ab, 19U) ^ rotate(ab, 10U)) + bitselect(v, ab, v ^ u);
  };
  {
    c = z + (rotate(w, 26U) ^ rotate(w, 21U) ^ rotate(w, 7U)) + bitselect(y, x, w) + (0xB5C0FBCF + g);
    v += c;
    z = c + (rotate(aa, 30U) ^ rotate(aa, 19U) ^ rotate(aa, 10U)) + bitselect(u, aa, u ^ ab);
  };
  {
    c = y + (rotate(v, 26U) ^ rotate(v, 21U) ^ rotate(v, 7U)) + bitselect(x, w, v) + (0xE9B5DBA5 + h);
    u += c;
    y = c + (rotate(z, 30U) ^ rotate(z, 19U) ^ rotate(z, 10U)) + bitselect(ab, z, ab ^ aa);
  };
  {
    c = x + (rotate(u, 26U) ^ rotate(u, 21U) ^ rotate(u, 7U)) + bitselect(w, v, u) + (0x3956C25B + i);
    ab += c;
    x = c + (rotate(y, 30U) ^ rotate(y, 19U) ^ rotate(y, 10U)) + bitselect(aa, y, aa ^ z);
  };
  {
    c = w + (rotate(ab, 26U) ^ rotate(ab, 21U) ^ rotate(ab, 7U)) + bitselect(v, u, ab) + (0x59F111F1 + j);
    aa += c;
    w = c + (rotate(x, 30U) ^ rotate(x, 19U) ^ rotate(x, 10U)) + bitselect(z, x, z ^ y);
  };
  {
    c = v + (rotate(aa, 26U) ^ rotate(aa, 21U) ^ rotate(aa, 7U)) + bitselect(u, ab, aa) + (0x923F82A4 + k);
    z += c;
    v = c + (rotate(w, 30U) ^ rotate(w, 19U) ^ rotate(w, 10U)) + bitselect(y, w, y ^ x);
  };
  {
    c = u + (rotate(z, 26U) ^ rotate(z, 21U) ^ rotate(z, 7U)) + bitselect(ab, aa, z) + (0xAB1C5ED5 + l);
    y += c;
    u = c + (rotate(v, 30U) ^ rotate(v, 19U) ^ rotate(v, 10U)) + bitselect(x, v, x ^ w);
  };
  {
    c = ab + (rotate(y, 26U) ^ rotate(y, 21U) ^ rotate(y, 7U)) + bitselect(aa, z, y) + (0xD807AA98 + m);
    x += c;
    ab = c + (rotate(u, 30U) ^ rotate(u, 19U) ^ rotate(u, 10U)) + bitselect(w, u, w ^ v);
  };
  {
    c = aa + (rotate(x, 26U) ^ rotate(x, 21U) ^ rotate(x, 7U)) + bitselect(z, y, x) + (0x12835B01 + n);
    w += c;
    aa = c + (rotate(ab, 30U) ^ rotate(ab, 19U) ^ rotate(ab, 10U)) + bitselect(v, ab, v ^ u);
  };
  {
    c = z + (rotate(w, 26U) ^ rotate(w, 21U) ^ rotate(w, 7U)) + bitselect(y, x, w) + (0x243185BE + o);
    v += c;
    z = c + (rotate(aa, 30U) ^ rotate(aa, 19U) ^ rotate(aa, 10U)) + bitselect(u, aa, u ^ ab);
  };
  {
    c = y + (rotate(v, 26U) ^ rotate(v, 21U) ^ rotate(v, 7U)) + bitselect(x, w, v) + (0x550C7DC3 + p);
    u += c;
    y = c + (rotate(z, 30U) ^ rotate(z, 19U) ^ rotate(z, 10U)) + bitselect(ab, z, ab ^ aa);
  };
  {
    c = x + (rotate(u, 26U) ^ rotate(u, 21U) ^ rotate(u, 7U)) + bitselect(w, v, u) + (0x72BE5D74 + q);
    ab += c;
    x = c + (rotate(y, 30U) ^ rotate(y, 19U) ^ rotate(y, 10U)) + bitselect(aa, y, aa ^ z);
  };
  {
    c = w + (rotate(ab, 26U) ^ rotate(ab, 21U) ^ rotate(ab, 7U)) + bitselect(v, u, ab) + (0x80DEB1FE + r);
    aa += c;
    w = c + (rotate(x, 30U) ^ rotate(x, 19U) ^ rotate(x, 10U)) + bitselect(z, x, z ^ y);
  };
  {
    c = v + (rotate(aa, 26U) ^ rotate(aa, 21U) ^ rotate(aa, 7U)) + bitselect(u, ab, aa) + (0x9BDC06A7 + s);
    z += c;
    v = c + (rotate(w, 30U) ^ rotate(w, 19U) ^ rotate(w, 10U)) + bitselect(y, w, y ^ x);
  };
  {
    c = u + (rotate(z, 26U) ^ rotate(z, 21U) ^ rotate(z, 7U)) + bitselect(ab, aa, z) + (0xC19BF174 + t);
    y += c;
    u = c + (rotate(v, 30U) ^ rotate(v, 19U) ^ rotate(v, 10U)) + bitselect(x, v, x ^ w);
  };

  {
    c = ab + (rotate(y, 26U) ^ rotate(y, 21U) ^ rotate(y, 7U)) + bitselect(aa, z, y) + (0xE49B69C1 + (e = (rotate(s, 15U) ^ rotate(s, 13U) ^ (s >> 10)) + n + (rotate(f, 25U) ^ rotate(f, 14U) ^ (f >> 3)) + e));
    x += c;
    ab = c + (rotate(u, 30U) ^ rotate(u, 19U) ^ rotate(u, 10U)) + bitselect(w, u, w ^ v);
  };
  {
    c = aa + (rotate(x, 26U) ^ rotate(x, 21U) ^ rotate(x, 7U)) + bitselect(z, y, x) + (0xEFBE4786 + (f = (rotate(t, 15U) ^ rotate(t, 13U) ^ (t >> 10)) + o + (rotate(g, 25U) ^ rotate(g, 14U) ^ (g >> 3)) + f));
    w += c;
    aa = c + (rotate(ab, 30U) ^ rotate(ab, 19U) ^ rotate(ab, 10U)) + bitselect(v, ab, v ^ u);
  };
  {
    c = z + (rotate(w, 26U) ^ rotate(w, 21U) ^ rotate(w, 7U)) + bitselect(y, x, w) + (0x0FC19DC6 + (g = (rotate(e, 15U) ^ rotate(e, 13U) ^ (e >> 10)) + p + (rotate(h, 25U) ^ rotate(h, 14U) ^ (h >> 3)) + g));
    v += c;
    z = c + (rotate(aa, 30U) ^ rotate(aa, 19U) ^ rotate(aa, 10U)) + bitselect(u, aa, u ^ ab);
  };
  {
    c = y + (rotate(v, 26U) ^ rotate(v, 21U) ^ rotate(v, 7U)) + bitselect(x, w, v) + (0x240CA1CC + (h = (rotate(f, 15U) ^ rotate(f, 13U) ^ (f >> 10)) + q + (rotate(i, 25U) ^ rotate(i, 14U) ^ (i >> 3)) + h));
    u += c;
    y = c + (rotate(z, 30U) ^ rotate(z, 19U) ^ rotate(z, 10U)) + bitselect(ab, z, ab ^ aa);
  };
  {
    c = x + (rotate(u, 26U) ^ rotate(u, 21U) ^ rotate(u, 7U)) + bitselect(w, v, u) + (0x2DE92C6F + (i = (rotate(g, 15U) ^ rotate(g, 13U) ^ (g >> 10)) + r + (rotate(j, 25U) ^ rotate(j, 14U) ^ (j >> 3)) + i));
    ab += c;
    x = c + (rotate(y, 30U) ^ rotate(y, 19U) ^ rotate(y, 10U)) + bitselect(aa, y, aa ^ z);
  };
  {
    c = w + (rotate(ab, 26U) ^ rotate(ab, 21U) ^ rotate(ab, 7U)) + bitselect(v, u, ab) + (0x4A7484AA + (j = (rotate(h, 15U) ^ rotate(h, 13U) ^ (h >> 10)) + s + (rotate(k, 25U) ^ rotate(k, 14U) ^ (k >> 3)) + j));
    aa += c;
    w = c + (rotate(x, 30U) ^ rotate(x, 19U) ^ rotate(x, 10U)) + bitselect(z, x, z ^ y);
  };
  {
    c = v + (rotate(aa, 26U) ^ rotate(aa, 21U) ^ rotate(aa, 7U)) + bitselect(u, ab, aa) + (0x5CB0A9DC + (k = (rotate(i, 15U) ^ rotate(i, 13U) ^ (i >> 10)) + t + (rotate(l, 25U) ^ rotate(l, 14U) ^ (l >> 3)) + k));
    z += c;
    v = c + (rotate(w, 30U) ^ rotate(w, 19U) ^ rotate(w, 10U)) + bitselect(y, w, y ^ x);
  };
  {
    c = u + (rotate(z, 26U) ^ rotate(z, 21U) ^ rotate(z, 7U)) + bitselect(ab, aa, z) + (0x76F988DA + (l = (rotate(j, 15U) ^ rotate(j, 13U) ^ (j >> 10)) + e + (rotate(m, 25U) ^ rotate(m, 14U) ^ (m >> 3)) + l));
    y += c;
    u = c + (rotate(v, 30U) ^ rotate(v, 19U) ^ rotate(v, 10U)) + bitselect(x, v, x ^ w);
  };
  {
    c = ab + (rotate(y, 26U) ^ rotate(y, 21U) ^ rotate(y, 7U)) + bitselect(aa, z, y) + (0x983E5152 + (m = (rotate(k, 15U) ^ rotate(k, 13U) ^ (k >> 10)) + f + (rotate(n, 25U) ^ rotate(n, 14U) ^ (n >> 3)) + m));
    x += c;
    ab = c + (rotate(u, 30U) ^ rotate(u, 19U) ^ rotate(u, 10U)) + bitselect(w, u, w ^ v);
  };
  {
    c = aa + (rotate(x, 26U) ^ rotate(x, 21U) ^ rotate(x, 7U)) + bitselect(z, y, x) + (0xA831C66D + (n = (rotate(l, 15U) ^ rotate(l, 13U) ^ (l >> 10)) + g + (rotate(o, 25U) ^ rotate(o, 14U) ^ (o >> 3)) + n));
    w += c;
    aa = c + (rotate(ab, 30U) ^ rotate(ab, 19U) ^ rotate(ab, 10U)) + bitselect(v, ab, v ^ u);
  };
  {
    c = z + (rotate(w, 26U) ^ rotate(w, 21U) ^ rotate(w, 7U)) + bitselect(y, x, w) + (0xB00327C8 + (o = (rotate(m, 15U) ^ rotate(m, 13U) ^ (m >> 10)) + h + (rotate(p, 25U) ^ rotate(p, 14U) ^ (p >> 3)) + o));
    v += c;
    z = c + (rotate(aa, 30U) ^ rotate(aa, 19U) ^ rotate(aa, 10U)) + bitselect(u, aa, u ^ ab);
  };
  {
    c = y + (rotate(v, 26U) ^ rotate(v, 21U) ^ rotate(v, 7U)) + bitselect(x, w, v) + (0xBF597FC7 + (p = (rotate(n, 15U) ^ rotate(n, 13U) ^ (n >> 10)) + i + (rotate(q, 25U) ^ rotate(q, 14U) ^ (q >> 3)) + p));
    u += c;
    y = c + (rotate(z, 30U) ^ rotate(z, 19U) ^ rotate(z, 10U)) + bitselect(ab, z, ab ^ aa);
  };
  {
    c = x + (rotate(u, 26U) ^ rotate(u, 21U) ^ rotate(u, 7U)) + bitselect(w, v, u) + (0xC6E00BF3 + (q = (rotate(o, 15U) ^ rotate(o, 13U) ^ (o >> 10)) + j + (rotate(r, 25U) ^ rotate(r, 14U) ^ (r >> 3)) + q));
    ab += c;
    x = c + (rotate(y, 30U) ^ rotate(y, 19U) ^ rotate(y, 10U)) + bitselect(aa, y, aa ^ z);
  };
  {
    c = w + (rotate(ab, 26U) ^ rotate(ab, 21U) ^ rotate(ab, 7U)) + bitselect(v, u, ab) + (0xD5A79147 + (r = (rotate(p, 15U) ^ rotate(p, 13U) ^ (p >> 10)) + k + (rotate(s, 25U) ^ rotate(s, 14U) ^ (s >> 3)) + r));
    aa += c;
    w = c + (rotate(x, 30U) ^ rotate(x, 19U) ^ rotate(x, 10U)) + bitselect(z, x, z ^ y);
  };
  {
    c = v + (rotate(aa, 26U) ^ rotate(aa, 21U) ^ rotate(aa, 7U)) + bitselect(u, ab, aa) + (0x06CA6351 + (s = (rotate(q, 15U) ^ rotate(q, 13U) ^ (q >> 10)) + l + (rotate(t, 25U) ^ rotate(t, 14U) ^ (t >> 3)) + s));
    z += c;
    v = c + (rotate(w, 30U) ^ rotate(w, 19U) ^ rotate(w, 10U)) + bitselect(y, w, y ^ x);
  };
  {
    c = u + (rotate(z, 26U) ^ rotate(z, 21U) ^ rotate(z, 7U)) + bitselect(ab, aa, z) + (0x14292967 + (t = (rotate(r, 15U) ^ rotate(r, 13U) ^ (r >> 10)) + m + (rotate(e, 25U) ^ rotate(e, 14U) ^ (e >> 3)) + t));
    y += c;
    u = c + (rotate(v, 30U) ^ rotate(v, 19U) ^ rotate(v, 10U)) + bitselect(x, v, x ^ w);
  };

  {
    c = ab + (rotate(y, 26U) ^ rotate(y, 21U) ^ rotate(y, 7U)) + bitselect(aa, z, y) + (0x27B70A85 + (e = (rotate(s, 15U) ^ rotate(s, 13U) ^ (s >> 10)) + n + (rotate(f, 25U) ^ rotate(f, 14U) ^ (f >> 3)) + e));
    x += c;
    ab = c + (rotate(u, 30U) ^ rotate(u, 19U) ^ rotate(u, 10U)) + bitselect(w, u, w ^ v);
  };
  {
    c = aa + (rotate(x, 26U) ^ rotate(x, 21U) ^ rotate(x, 7U)) + bitselect(z, y, x) + (0x2E1B2138 + (f = (rotate(t, 15U) ^ rotate(t, 13U) ^ (t >> 10)) + o + (rotate(g, 25U) ^ rotate(g, 14U) ^ (g >> 3)) + f));
    w += c;
    aa = c + (rotate(ab, 30U) ^ rotate(ab, 19U) ^ rotate(ab, 10U)) + bitselect(v, ab, v ^ u);
  };
  {
    c = z + (rotate(w, 26U) ^ rotate(w, 21U) ^ rotate(w, 7U)) + bitselect(y, x, w) + (0x4D2C6DFC + (g = (rotate(e, 15U) ^ rotate(e, 13U) ^ (e >> 10)) + p + (rotate(h, 25U) ^ rotate(h, 14U) ^ (h >> 3)) + g));
    v += c;
    z = c + (rotate(aa, 30U) ^ rotate(aa, 19U) ^ rotate(aa, 10U)) + bitselect(u, aa, u ^ ab);
  };
  {
    c = y + (rotate(v, 26U) ^ rotate(v, 21U) ^ rotate(v, 7U)) + bitselect(x, w, v) + (0x53380D13 + (h = (rotate(f, 15U) ^ rotate(f, 13U) ^ (f >> 10)) + q + (rotate(i, 25U) ^ rotate(i, 14U) ^ (i >> 3)) + h));
    u += c;
    y = c + (rotate(z, 30U) ^ rotate(z, 19U) ^ rotate(z, 10U)) + bitselect(ab, z, ab ^ aa);
  };
  {
    c = x + (rotate(u, 26U) ^ rotate(u, 21U) ^ rotate(u, 7U)) + bitselect(w, v, u) + (0x650A7354 + (i = (rotate(g, 15U) ^ rotate(g, 13U) ^ (g >> 10)) + r + (rotate(j, 25U) ^ rotate(j, 14U) ^ (j >> 3)) + i));
    ab += c;
    x = c + (rotate(y, 30U) ^ rotate(y, 19U) ^ rotate(y, 10U)) + bitselect(aa, y, aa ^ z);
  };
  {
    c = w + (rotate(ab, 26U) ^ rotate(ab, 21U) ^ rotate(ab, 7U)) + bitselect(v, u, ab) + (0x766A0ABB + (j = (rotate(h, 15U) ^ rotate(h, 13U) ^ (h >> 10)) + s + (rotate(k, 25U) ^ rotate(k, 14U) ^ (k >> 3)) + j));
    aa += c;
    w = c + (rotate(x, 30U) ^ rotate(x, 19U) ^ rotate(x, 10U)) + bitselect(z, x, z ^ y);
  };
  {
    c = v + (rotate(aa, 26U) ^ rotate(aa, 21U) ^ rotate(aa, 7U)) + bitselect(u, ab, aa) + (0x81C2C92E + (k = (rotate(i, 15U) ^ rotate(i, 13U) ^ (i >> 10)) + t + (rotate(l, 25U) ^ rotate(l, 14U) ^ (l >> 3)) + k));
    z += c;
    v = c + (rotate(w, 30U) ^ rotate(w, 19U) ^ rotate(w, 10U)) + bitselect(y, w, y ^ x);
  };
  {
    c = u + (rotate(z, 26U) ^ rotate(z, 21U) ^ rotate(z, 7U)) + bitselect(ab, aa, z) + (0x92722C85 + (l = (rotate(j, 15U) ^ rotate(j, 13U) ^ (j >> 10)) + e + (rotate(m, 25U) ^ rotate(m, 14U) ^ (m >> 3)) + l));
    y += c;
    u = c + (rotate(v, 30U) ^ rotate(v, 19U) ^ rotate(v, 10U)) + bitselect(x, v, x ^ w);
  };
  {
    c = ab + (rotate(y, 26U) ^ rotate(y, 21U) ^ rotate(y, 7U)) + bitselect(aa, z, y) + (0xA2BFE8A1 + (m = (rotate(k, 15U) ^ rotate(k, 13U) ^ (k >> 10)) + f + (rotate(n, 25U) ^ rotate(n, 14U) ^ (n >> 3)) + m));
    x += c;
    ab = c + (rotate(u, 30U) ^ rotate(u, 19U) ^ rotate(u, 10U)) + bitselect(w, u, w ^ v);
  };
  {
    c = aa + (rotate(x, 26U) ^ rotate(x, 21U) ^ rotate(x, 7U)) + bitselect(z, y, x) + (0xA81A664B + (n = (rotate(l, 15U) ^ rotate(l, 13U) ^ (l >> 10)) + g + (rotate(o, 25U) ^ rotate(o, 14U) ^ (o >> 3)) + n));
    w += c;
    aa = c + (rotate(ab, 30U) ^ rotate(ab, 19U) ^ rotate(ab, 10U)) + bitselect(v, ab, v ^ u);
  };
  {
    c = z + (rotate(w, 26U) ^ rotate(w, 21U) ^ rotate(w, 7U)) + bitselect(y, x, w) + (0xC24B8B70 + (o = (rotate(m, 15U) ^ rotate(m, 13U) ^ (m >> 10)) + h + (rotate(p, 25U) ^ rotate(p, 14U) ^ (p >> 3)) + o));
    v += c;
    z = c + (rotate(aa, 30U) ^ rotate(aa, 19U) ^ rotate(aa, 10U)) + bitselect(u, aa, u ^ ab);
  };
  {
    c = y + (rotate(v, 26U) ^ rotate(v, 21U) ^ rotate(v, 7U)) + bitselect(x, w, v) + (0xC76C51A3 + (p = (rotate(n, 15U) ^ rotate(n, 13U) ^ (n >> 10)) + i + (rotate(q, 25U) ^ rotate(q, 14U) ^ (q >> 3)) + p));
    u += c;
    y = c + (rotate(z, 30U) ^ rotate(z, 19U) ^ rotate(z, 10U)) + bitselect(ab, z, ab ^ aa);
  };
  {
    c = x + (rotate(u, 26U) ^ rotate(u, 21U) ^ rotate(u, 7U)) + bitselect(w, v, u) + (0xD192E819 + (q = (rotate(o, 15U) ^ rotate(o, 13U) ^ (o >> 10)) + j + (rotate(r, 25U) ^ rotate(r, 14U) ^ (r >> 3)) + q));
    ab += c;
    x = c + (rotate(y, 30U) ^ rotate(y, 19U) ^ rotate(y, 10U)) + bitselect(aa, y, aa ^ z);
  };
  {
    c = w + (rotate(ab, 26U) ^ rotate(ab, 21U) ^ rotate(ab, 7U)) + bitselect(v, u, ab) + (0xD6990624 + (r = (rotate(p, 15U) ^ rotate(p, 13U) ^ (p >> 10)) + k + (rotate(s, 25U) ^ rotate(s, 14U) ^ (s >> 3)) + r));
    aa += c;
    w = c + (rotate(x, 30U) ^ rotate(x, 19U) ^ rotate(x, 10U)) + bitselect(z, x, z ^ y);
  };
  {
    c = v + (rotate(aa, 26U) ^ rotate(aa, 21U) ^ rotate(aa, 7U)) + bitselect(u, ab, aa) + (0xF40E3585 + (s = (rotate(q, 15U) ^ rotate(q, 13U) ^ (q >> 10)) + l + (rotate(t, 25U) ^ rotate(t, 14U) ^ (t >> 3)) + s));
    z += c;
    v = c + (rotate(w, 30U) ^ rotate(w, 19U) ^ rotate(w, 10U)) + bitselect(y, w, y ^ x);
  };
  {
    c = u + (rotate(z, 26U) ^ rotate(z, 21U) ^ rotate(z, 7U)) + bitselect(ab, aa, z) + (0x106AA070 + (t = (rotate(r, 15U) ^ rotate(r, 13U) ^ (r >> 10)) + m + (rotate(e, 25U) ^ rotate(e, 14U) ^ (e >> 3)) + t));
    y += c;
    u = c + (rotate(v, 30U) ^ rotate(v, 19U) ^ rotate(v, 10U)) + bitselect(x, v, x ^ w);
  };

  {
    c = ab + (rotate(y, 26U) ^ rotate(y, 21U) ^ rotate(y, 7U)) + bitselect(aa, z, y) + (0x19A4C116 + (e = (rotate(s, 15U) ^ rotate(s, 13U) ^ (s >> 10)) + n + (rotate(f, 25U) ^ rotate(f, 14U) ^ (f >> 3)) + e));
    x += c;
    ab = c + (rotate(u, 30U) ^ rotate(u, 19U) ^ rotate(u, 10U)) + bitselect(w, u, w ^ v);
  };
  {
    c = aa + (rotate(x, 26U) ^ rotate(x, 21U) ^ rotate(x, 7U)) + bitselect(z, y, x) + (0x1E376C08 + (f = (rotate(t, 15U) ^ rotate(t, 13U) ^ (t >> 10)) + o + (rotate(g, 25U) ^ rotate(g, 14U) ^ (g >> 3)) + f));
    w += c;
    aa = c + (rotate(ab, 30U) ^ rotate(ab, 19U) ^ rotate(ab, 10U)) + bitselect(v, ab, v ^ u);
  };
  {
    c = z + (rotate(w, 26U) ^ rotate(w, 21U) ^ rotate(w, 7U)) + bitselect(y, x, w) + (0x2748774C + (g = (rotate(e, 15U) ^ rotate(e, 13U) ^ (e >> 10)) + p + (rotate(h, 25U) ^ rotate(h, 14U) ^ (h >> 3)) + g));
    v += c;
    z = c + (rotate(aa, 30U) ^ rotate(aa, 19U) ^ rotate(aa, 10U)) + bitselect(u, aa, u ^ ab);
  };
  {
    c = y + (rotate(v, 26U) ^ rotate(v, 21U) ^ rotate(v, 7U)) + bitselect(x, w, v) + (0x34B0BCB5 + (h = (rotate(f, 15U) ^ rotate(f, 13U) ^ (f >> 10)) + q + (rotate(i, 25U) ^ rotate(i, 14U) ^ (i >> 3)) + h));
    u += c;
    y = c + (rotate(z, 30U) ^ rotate(z, 19U) ^ rotate(z, 10U)) + bitselect(ab, z, ab ^ aa);
  };
  {
    c = x + (rotate(u, 26U) ^ rotate(u, 21U) ^ rotate(u, 7U)) + bitselect(w, v, u) + (0x391C0CB3 + (i = (rotate(g, 15U) ^ rotate(g, 13U) ^ (g >> 10)) + r + (rotate(j, 25U) ^ rotate(j, 14U) ^ (j >> 3)) + i));
    ab += c;
    x = c + (rotate(y, 30U) ^ rotate(y, 19U) ^ rotate(y, 10U)) + bitselect(aa, y, aa ^ z);
  };
  {
    c = w + (rotate(ab, 26U) ^ rotate(ab, 21U) ^ rotate(ab, 7U)) + bitselect(v, u, ab) + (0x4ED8AA4A + (j = (rotate(h, 15U) ^ rotate(h, 13U) ^ (h >> 10)) + s + (rotate(k, 25U) ^ rotate(k, 14U) ^ (k >> 3)) + j));
    aa += c;
    w = c + (rotate(x, 30U) ^ rotate(x, 19U) ^ rotate(x, 10U)) + bitselect(z, x, z ^ y);
  };
  {
    c = v + (rotate(aa, 26U) ^ rotate(aa, 21U) ^ rotate(aa, 7U)) + bitselect(u, ab, aa) + (0x5B9CCA4F + (k = (rotate(i, 15U) ^ rotate(i, 13U) ^ (i >> 10)) + t + (rotate(l, 25U) ^ rotate(l, 14U) ^ (l >> 3)) + k));
    z += c;
    v = c + (rotate(w, 30U) ^ rotate(w, 19U) ^ rotate(w, 10U)) + bitselect(y, w, y ^ x);
  };
  {
    c = u + (rotate(z, 26U) ^ rotate(z, 21U) ^ rotate(z, 7U)) + bitselect(ab, aa, z) + (0x682E6FF3 + (l = (rotate(j, 15U) ^ rotate(j, 13U) ^ (j >> 10)) + e + (rotate(m, 25U) ^ rotate(m, 14U) ^ (m >> 3)) + l));
    y += c;
    u = c + (rotate(v, 30U) ^ rotate(v, 19U) ^ rotate(v, 10U)) + bitselect(x, v, x ^ w);
  };
  {
    c = ab + (rotate(y, 26U) ^ rotate(y, 21U) ^ rotate(y, 7U)) + bitselect(aa, z, y) + (0x748F82EE + (m = (rotate(k, 15U) ^ rotate(k, 13U) ^ (k >> 10)) + f + (rotate(n, 25U) ^ rotate(n, 14U) ^ (n >> 3)) + m));
    x += c;
    ab = c + (rotate(u, 30U) ^ rotate(u, 19U) ^ rotate(u, 10U)) + bitselect(w, u, w ^ v);
  };
  {
    c = aa + (rotate(x, 26U) ^ rotate(x, 21U) ^ rotate(x, 7U)) + bitselect(z, y, x) + (0x78A5636F + (n = (rotate(l, 15U) ^ rotate(l, 13U) ^ (l >> 10)) + g + (rotate(o, 25U) ^ rotate(o, 14U) ^ (o >> 3)) + n));
    w += c;
    aa = c + (rotate(ab, 30U) ^ rotate(ab, 19U) ^ rotate(ab, 10U)) + bitselect(v, ab, v ^ u);
  };
  {
    c = z + (rotate(w, 26U) ^ rotate(w, 21U) ^ rotate(w, 7U)) + bitselect(y, x, w) + (0x84C87814 + (o = (rotate(m, 15U) ^ rotate(m, 13U) ^ (m >> 10)) + h + (rotate(p, 25U) ^ rotate(p, 14U) ^ (p >> 3)) + o));
    v += c;
    z = c + (rotate(aa, 30U) ^ rotate(aa, 19U) ^ rotate(aa, 10U)) + bitselect(u, aa, u ^ ab);
  };
  {
    c = y + (rotate(v, 26U) ^ rotate(v, 21U) ^ rotate(v, 7U)) + bitselect(x, w, v) + (0x8CC70208 + (p = (rotate(n, 15U) ^ rotate(n, 13U) ^ (n >> 10)) + i + (rotate(q, 25U) ^ rotate(q, 14U) ^ (q >> 3)) + p));
    u += c;
    y = c + (rotate(z, 30U) ^ rotate(z, 19U) ^ rotate(z, 10U)) + bitselect(ab, z, ab ^ aa);
  };
  {
    c = x + (rotate(u, 26U) ^ rotate(u, 21U) ^ rotate(u, 7U)) + bitselect(w, v, u) + (0x90BEFFFA + (q = (rotate(o, 15U) ^ rotate(o, 13U) ^ (o >> 10)) + j + (rotate(r, 25U) ^ rotate(r, 14U) ^ (r >> 3)) + q));
    ab += c;
    x = c + (rotate(y, 30U) ^ rotate(y, 19U) ^ rotate(y, 10U)) + bitselect(aa, y, aa ^ z);
  };
  {
    c = w + (rotate(ab, 26U) ^ rotate(ab, 21U) ^ rotate(ab, 7U)) + bitselect(v, u, ab) + (0xA4506CEB + (r = (rotate(p, 15U) ^ rotate(p, 13U) ^ (p >> 10)) + k + (rotate(s, 25U) ^ rotate(s, 14U) ^ (s >> 3)) + r));
    aa += c;
    w = c + (rotate(x, 30U) ^ rotate(x, 19U) ^ rotate(x, 10U)) + bitselect(z, x, z ^ y);
  };
  {
    c = v + (rotate(aa, 26U) ^ rotate(aa, 21U) ^ rotate(aa, 7U)) + bitselect(u, ab, aa) + (0xBEF9A3F7 + ((rotate(q, 15U) ^ rotate(q, 13U) ^ (q >> 10)) + l + (rotate(t, 25U) ^ rotate(t, 14U) ^ (t >> 3)) + s));
    z += c;
    v = c + (rotate(w, 30U) ^ rotate(w, 19U) ^ rotate(w, 10U)) + bitselect(y, w, y ^ x);
  };
  {
    c = u + (rotate(z, 26U) ^ rotate(z, 21U) ^ rotate(z, 7U)) + bitselect(ab, aa, z) + (0xC67178F2 + ((rotate(r, 15U) ^ rotate(r, 13U) ^ (r >> 10)) + m + (rotate(e, 25U) ^ rotate(e, 14U) ^ (e >> 3)) + t));
    y += c;
    u = c + (rotate(v, 30U) ^ rotate(v, 19U) ^ rotate(v, 10U)) + bitselect(x, v, x ^ w);
  };

  d.s0 = (u + b.s0);
  d.s1 = (v + b.s1);
  d.s2 = (w + b.s2);
  d.s3 = (x + b.s3);
  d.s4 = (y + b.s4);
  d.s5 = (z + b.s5);
  d.s6 = (aa + b.s6);
  d.s7 = (ab + b.s7);
  return (d);
}
const __constant uint Ga[5] = {0x67452301, 0xEFCDAB89, 0x98BADCFE, 0x10325476, 0xC3D2E1F0};
void D(uint* a, uint* b) {
  uint c, d, e, f, g;
  uint h, i, j, k, l;
  uint m;

  c = h = (b)[0];
  d = i = (b)[1];
  e = j = (b)[2];
  f = k = (b)[3];
  g = l = (b)[4];

  do {
    const uint n = c + ((d) ^ (e) ^ (f)) + (a)[0] + 0x00000000;
    c = A(n, n, 32U - (uint)11) + g;
    e = A(e, e, 32U - 10U);
  } while (0);
  do {
    const uint n = g + ((c) ^ (d) ^ (e)) + (a)[1] + 0x00000000;
    g = A(n, n, 32U - (uint)14) + f;
    d = A(d, d, 32U - 10U);
  } while (0);
  do {
    const uint n = f + ((g) ^ (c) ^ (d)) + (a)[2] + 0x00000000;
    f = A(n, n, 32U - (uint)15) + e;
    c = A(c, c, 32U - 10U);
  } while (0);
  do {
    const uint n = e + ((f) ^ (g) ^ (c)) + (a)[3] + 0x00000000;
    e = A(n, n, 32U - (uint)12) + d;
    g = A(g, g, 32U - 10U);
  } while (0);
  do {
    const uint n = d + ((e) ^ (f) ^ (g)) + (a)[4] + 0x00000000;
    d = A(n, n, 32U - (uint)5) + c;
    f = A(f, f, 32U - 10U);
  } while (0);
  do {
    const uint n = c + ((d) ^ (e) ^ (f)) + (a)[5] + 0x00000000;
    c = A(n, n, 32U - (uint)8) + g;
    e = A(e, e, 32U - 10U);
  } while (0);
  do {
    const uint n = g + ((c) ^ (d) ^ (e)) + (a)[6] + 0x00000000;
    g = A(n, n, 32U - (uint)7) + f;
    d = A(d, d, 32U - 10U);
  } while (0);
  do {
    const uint n = f + ((g) ^ (c) ^ (d)) + (a)[7] + 0x00000000;
    f = A(n, n, 32U - (uint)9) + e;
    c = A(c, c, 32U - 10U);
  } while (0);
  do {
    const uint n = e + ((f) ^ (g) ^ (c)) + (a)[8] + 0x00000000;
    e = A(n, n, 32U - (uint)11) + d;
    g = A(g, g, 32U - 10U);
  } while (0);
  do {
    const uint n = d + ((e) ^ (f) ^ (g)) + (a)[9] + 0x00000000;
    d = A(n, n, 32U - (uint)13) + c;
    f = A(f, f, 32U - 10U);
  } while (0);
  do {
    const uint n = c + ((d) ^ (e) ^ (f)) + (a)[10] + 0x00000000;
    c = A(n, n, 32U - (uint)14) + g;
    e = A(e, e, 32U - 10U);
  } while (0);
  do {
    const uint n = g + ((c) ^ (d) ^ (e)) + (a)[11] + 0x00000000;
    g = A(n, n, 32U - (uint)15) + f;
    d = A(d, d, 32U - 10U);
  } while (0);
  do {
    const uint n = f + ((g) ^ (c) ^ (d)) + (a)[12] + 0x00000000;
    f = A(n, n, 32U - (uint)6) + e;
    c = A(c, c, 32U - 10U);
  } while (0);
  do {
    const uint n = e + ((f) ^ (g) ^ (c)) + (a)[13] + 0x00000000;
    e = A(n, n, 32U - (uint)7) + d;
    g = A(g, g, 32U - 10U);
  } while (0);
  do {
    const uint n = d + ((e) ^ (f) ^ (g)) + (a)[14] + 0x00000000;
    d = A(n, n, 32U - (uint)9) + c;
    f = A(f, f, 32U - 10U);
  } while (0);
  do {
    const uint n = c + ((d) ^ (e) ^ (f)) + (a)[15] + 0x00000000;
    c = A(n, n, 32U - (uint)8) + g;
    e = A(e, e, 32U - 10U);
  } while (0);

  do {
    const uint n = g + ((((d) ^ (e)) & (c)) ^ (e)) + (a)[7] + 0x5A827999;
    g = A(n, n, 32U - (uint)7) + f;
    d = A(d, d, 32U - 10U);
  } while (0);
  do {
    const uint n = f + ((((c) ^ (d)) & (g)) ^ (d)) + (a)[4] + 0x5A827999;
    f = A(n, n, 32U - (uint)6) + e;
    c = A(c, c, 32U - 10U);
  } while (0);
  do {
    const uint n = e + ((((g) ^ (c)) & (f)) ^ (c)) + (a)[13] + 0x5A827999;
    e = A(n, n, 32U - (uint)8) + d;
    g = A(g, g, 32U - 10U);
  } while (0);
  do {
    const uint n = d + ((((f) ^ (g)) & (e)) ^ (g)) + (a)[1] + 0x5A827999;
    d = A(n, n, 32U - (uint)13) + c;
    f = A(f, f, 32U - 10U);
  } while (0);
  do {
    const uint n = c + ((((e) ^ (f)) & (d)) ^ (f)) + (a)[10] + 0x5A827999;
    c = A(n, n, 32U - (uint)11) + g;
    e = A(e, e, 32U - 10U);
  } while (0);
  do {
    const uint n = g + ((((d) ^ (e)) & (c)) ^ (e)) + (a)[6] + 0x5A827999;
    g = A(n, n, 32U - (uint)9) + f;
    d = A(d, d, 32U - 10U);
  } while (0);
  do {
    const uint n = f + ((((c) ^ (d)) & (g)) ^ (d)) + (a)[15] + 0x5A827999;
    f = A(n, n, 32U - (uint)7) + e;
    c = A(c, c, 32U - 10U);
  } while (0);
  do {
    const uint n = e + ((((g) ^ (c)) & (f)) ^ (c)) + (a)[3] + 0x5A827999;
    e = A(n, n, 32U - (uint)15) + d;
    g = A(g, g, 32U - 10U);
  } while (0);
  do {
    const uint n = d + ((((f) ^ (g)) & (e)) ^ (g)) + (a)[12] + 0x5A827999;
    d = A(n, n, 32U - (uint)7) + c;
    f = A(f, f, 32U - 10U);
  } while (0);
  do {
    const uint n = c + ((((e) ^ (f)) & (d)) ^ (f)) + (a)[0] + 0x5A827999;
    c = A(n, n, 32U - (uint)12) + g;
    e = A(e, e, 32U - 10U);
  } while (0);
  do {
    const uint n = g + ((((d) ^ (e)) & (c)) ^ (e)) + (a)[9] + 0x5A827999;
    g = A(n, n, 32U - (uint)15) + f;
    d = A(d, d, 32U - 10U);
  } while (0);
  do {
    const uint n = f + ((((c) ^ (d)) & (g)) ^ (d)) + (a)[5] + 0x5A827999;
    f = A(n, n, 32U - (uint)9) + e;
    c = A(c, c, 32U - 10U);
  } while (0);
  do {
    const uint n = e + ((((g) ^ (c)) & (f)) ^ (c)) + (a)[2] + 0x5A827999;
    e = A(n, n, 32U - (uint)11) + d;
    g = A(g, g, 32U - 10U);
  } while (0);
  do {
    const uint n = d + ((((f) ^ (g)) & (e)) ^ (g)) + (a)[14] + 0x5A827999;
    d = A(n, n, 32U - (uint)7) + c;
    f = A(f, f, 32U - 10U);
  } while (0);
  do {
    const uint n = c + ((((e) ^ (f)) & (d)) ^ (f)) + (a)[11] + 0x5A827999;
    c = A(n, n, 32U - (uint)13) + g;
    e = A(e, e, 32U - 10U);
  } while (0);
  do {
    const uint n = g + ((((d) ^ (e)) & (c)) ^ (e)) + (a)[8] + 0x5A827999;
    g = A(n, n, 32U - (uint)12) + f;
    d = A(d, d, 32U - 10U);
  } while (0);

  do {
    const uint n = f + (((g) | ~(c)) ^ (d)) + (a)[3] + 0x6ED9EBA1;
    f = A(n, n, 32U - (uint)11) + e;
    c = A(c, c, 32U - 10U);
  } while (0);
  do {
    const uint n = e + (((f) | ~(g)) ^ (c)) + (a)[10] + 0x6ED9EBA1;
    e = A(n, n, 32U - (uint)13) + d;
    g = A(g, g, 32U - 10U);
  } while (0);
  do {
    const uint n = d + (((e) | ~(f)) ^ (g)) + (a)[14] + 0x6ED9EBA1;
    d = A(n, n, 32U - (uint)6) + c;
    f = A(f, f, 32U - 10U);
  } while (0);
  do {
    const uint n = c + (((d) | ~(e)) ^ (f)) + (a)[4] + 0x6ED9EBA1;
    c = A(n, n, 32U - (uint)7) + g;
    e = A(e, e, 32U - 10U);
  } while (0);
  do {
    const uint n = g + (((c) | ~(d)) ^ (e)) + (a)[9] + 0x6ED9EBA1;
    g = A(n, n, 32U - (uint)14) + f;
    d = A(d, d, 32U - 10U);
  } while (0);
  do {
    const uint n = f + (((g) | ~(c)) ^ (d)) + (a)[15] + 0x6ED9EBA1;
    f = A(n, n, 32U - (uint)9) + e;
    c = A(c, c, 32U - 10U);
  } while (0);
  do {
    const uint n = e + (((f) | ~(g)) ^ (c)) + (a)[8] + 0x6ED9EBA1;
    e = A(n, n, 32U - (uint)13) + d;
    g = A(g, g, 32U - 10U);
  } while (0);
  do {
    const uint n = d + (((e) | ~(f)) ^ (g)) + (a)[1] + 0x6ED9EBA1;
    d = A(n, n, 32U - (uint)15) + c;
    f = A(f, f, 32U - 10U);
  } while (0);
  do {
    const uint n = c + (((d) | ~(e)) ^ (f)) + (a)[2] + 0x6ED9EBA1;
    c = A(n, n, 32U - (uint)14) + g;
    e = A(e, e, 32U - 10U);
  } while (0);
  do {
    const uint n = g + (((c) | ~(d)) ^ (e)) + (a)[7] + 0x6ED9EBA1;
    g = A(n, n, 32U - (uint)8) + f;
    d = A(d, d, 32U - 10U);
  } while (0);
  do {
    const uint n = f + (((g) | ~(c)) ^ (d)) + (a)[0] + 0x6ED9EBA1;
    f = A(n, n, 32U - (uint)13) + e;
    c = A(c, c, 32U - 10U);
  } while (0);
  do {
    const uint n = e + (((f) | ~(g)) ^ (c)) + (a)[6] + 0x6ED9EBA1;
    e = A(n, n, 32U - (uint)6) + d;
    g = A(g, g, 32U - 10U);
  } while (0);
  do {
    const uint n = d + (((e) | ~(f)) ^ (g)) + (a)[13] + 0x6ED9EBA1;
    d = A(n, n, 32U - (uint)5) + c;
    f = A(f, f, 32U - 10U);
  } while (0);
  do {
    const uint n = c + (((d) | ~(e)) ^ (f)) + (a)[11] + 0x6ED9EBA1;
    c = A(n, n, 32U - (uint)12) + g;
    e = A(e, e, 32U - 10U);
  } while (0);
  do {
    const uint n = g + (((c) | ~(d)) ^ (e)) + (a)[5] + 0x6ED9EBA1;
    g = A(n, n, 32U - (uint)7) + f;
    d = A(d, d, 32U - 10U);
  } while (0);
  do {
    const uint n = f + (((g) | ~(c)) ^ (d)) + (a)[12] + 0x6ED9EBA1;
    f = A(n, n, 32U - (uint)5) + e;
    c = A(c, c, 32U - 10U);
  } while (0);

  do {
    const uint n = e + ((((f) ^ (g)) & (c)) ^ (g)) + (a)[1] + 0x8F1BBCDC;
    e = A(n, n, 32U - (uint)11) + d;
    g = A(g, g, 32U - 10U);
  } while (0);
  do {
    const uint n = d + ((((e) ^ (f)) & (g)) ^ (f)) + (a)[9] + 0x8F1BBCDC;
    d = A(n, n, 32U - (uint)12) + c;
    f = A(f, f, 32U - 10U);
  } while (0);
  do {
    const uint n = c + ((((d) ^ (e)) & (f)) ^ (e)) + (a)[11] + 0x8F1BBCDC;
    c = A(n, n, 32U - (uint)14) + g;
    e = A(e, e, 32U - 10U);
  } while (0);
  do {
    const uint n = g + ((((c) ^ (d)) & (e)) ^ (d)) + (a)[10] + 0x8F1BBCDC;
    g = A(n, n, 32U - (uint)15) + f;
    d = A(d, d, 32U - 10U);
  } while (0);
  do {
    const uint n = f + ((((g) ^ (c)) & (d)) ^ (c)) + (a)[0] + 0x8F1BBCDC;
    f = A(n, n, 32U - (uint)14) + e;
    c = A(c, c, 32U - 10U);
  } while (0);
  do {
    const uint n = e + ((((f) ^ (g)) & (c)) ^ (g)) + (a)[8] + 0x8F1BBCDC;
    e = A(n, n, 32U - (uint)15) + d;
    g = A(g, g, 32U - 10U);
  } while (0);
  do {
    const uint n = d + ((((e) ^ (f)) & (g)) ^ (f)) + (a)[12] + 0x8F1BBCDC;
    d = A(n, n, 32U - (uint)9) + c;
    f = A(f, f, 32U - 10U);
  } while (0);
  do {
    const uint n = c + ((((d) ^ (e)) & (f)) ^ (e)) + (a)[4] + 0x8F1BBCDC;
    c = A(n, n, 32U - (uint)8) + g;
    e = A(e, e, 32U - 10U);
  } while (0);
  do {
    const uint n = g + ((((c) ^ (d)) & (e)) ^ (d)) + (a)[13] + 0x8F1BBCDC;
    g = A(n, n, 32U - (uint)9) + f;
    d = A(d, d, 32U - 10U);
  } while (0);
  do {
    const uint n = f + ((((g) ^ (c)) & (d)) ^ (c)) + (a)[3] + 0x8F1BBCDC;
    f = A(n, n, 32U - (uint)14) + e;
    c = A(c, c, 32U - 10U);
  } while (0);
  do {
    const uint n = e + ((((f) ^ (g)) & (c)) ^ (g)) + (a)[7] + 0x8F1BBCDC;
    e = A(n, n, 32U - (uint)5) + d;
    g = A(g, g, 32U - 10U);
  } while (0);
  do {
    const uint n = d + ((((e) ^ (f)) & (g)) ^ (f)) + (a)[15] + 0x8F1BBCDC;
    d = A(n, n, 32U - (uint)6) + c;
    f = A(f, f, 32U - 10U);
  } while (0);
  do {
    const uint n = c + ((((d) ^ (e)) & (f)) ^ (e)) + (a)[14] + 0x8F1BBCDC;
    c = A(n, n, 32U - (uint)8) + g;
    e = A(e, e, 32U - 10U);
  } while (0);
  do {
    const uint n = g + ((((c) ^ (d)) & (e)) ^ (d)) + (a)[5] + 0x8F1BBCDC;
    g = A(n, n, 32U - (uint)6) + f;
    d = A(d, d, 32U - 10U);
  } while (0);
  do {
    const uint n = f + ((((g) ^ (c)) & (d)) ^ (c)) + (a)[6] + 0x8F1BBCDC;
    f = A(n, n, 32U - (uint)5) + e;
    c = A(c, c, 32U - 10U);
  } while (0);
  do {
    const uint n = e + ((((f) ^ (g)) & (c)) ^ (g)) + (a)[2] + 0x8F1BBCDC;
    e = A(n, n, 32U - (uint)12) + d;
    g = A(g, g, 32U - 10U);
  } while (0);

  do {
    const uint n = d + ((e) ^ ((f) | ~(g))) + (a)[4] + 0xA953FD4E;
    d = A(n, n, 32U - (uint)9) + c;
    f = A(f, f, 32U - 10U);
  } while (0);
  do {
    const uint n = c + ((d) ^ ((e) | ~(f))) + (a)[0] + 0xA953FD4E;
    c = A(n, n, 32U - (uint)15) + g;
    e = A(e, e, 32U - 10U);
  } while (0);
  do {
    const uint n = g + ((c) ^ ((d) | ~(e))) + (a)[5] + 0xA953FD4E;
    g = A(n, n, 32U - (uint)5) + f;
    d = A(d, d, 32U - 10U);
  } while (0);
  do {
    const uint n = f + ((g) ^ ((c) | ~(d))) + (a)[9] + 0xA953FD4E;
    f = A(n, n, 32U - (uint)11) + e;
    c = A(c, c, 32U - 10U);
  } while (0);
  do {
    const uint n = e + ((f) ^ ((g) | ~(c))) + (a)[7] + 0xA953FD4E;
    e = A(n, n, 32U - (uint)6) + d;
    g = A(g, g, 32U - 10U);
  } while (0);
  do {
    const uint n = d + ((e) ^ ((f) | ~(g))) + (a)[12] + 0xA953FD4E;
    d = A(n, n, 32U - (uint)8) + c;
    f = A(f, f, 32U - 10U);
  } while (0);
  do {
    const uint n = c + ((d) ^ ((e) | ~(f))) + (a)[2] + 0xA953FD4E;
    c = A(n, n, 32U - (uint)13) + g;
    e = A(e, e, 32U - 10U);
  } while (0);
  do {
    const uint n = g + ((c) ^ ((d) | ~(e))) + (a)[10] + 0xA953FD4E;
    g = A(n, n, 32U - (uint)12) + f;
    d = A(d, d, 32U - 10U);
  } while (0);
  do {
    const uint n = f + ((g) ^ ((c) | ~(d))) + (a)[14] + 0xA953FD4E;
    f = A(n, n, 32U - (uint)5) + e;
    c = A(c, c, 32U - 10U);
  } while (0);
  do {
    const uint n = e + ((f) ^ ((g) | ~(c))) + (a)[1] + 0xA953FD4E;
    e = A(n, n, 32U - (uint)12) + d;
    g = A(g, g, 32U - 10U);
  } while (0);
  do {
    const uint n = d + ((e) ^ ((f) | ~(g))) + (a)[3] + 0xA953FD4E;
    d = A(n, n, 32U - (uint)13) + c;
    f = A(f, f, 32U - 10U);
  } while (0);
  do {
    const uint n = c + ((d) ^ ((e) | ~(f))) + (a)[8] + 0xA953FD4E;
    c = A(n, n, 32U - (uint)14) + g;
    e = A(e, e, 32U - 10U);
  } while (0);
  do {
    const uint n = g + ((c) ^ ((d) | ~(e))) + (a)[11] + 0xA953FD4E;
    g = A(n, n, 32U - (uint)11) + f;
    d = A(d, d, 32U - 10U);
  } while (0);
  do {
    const uint n = f + ((g) ^ ((c) | ~(d))) + (a)[6] + 0xA953FD4E;
    f = A(n, n, 32U - (uint)8) + e;
    c = A(c, c, 32U - 10U);
  } while (0);
  do {
    const uint n = e + ((f) ^ ((g) | ~(c))) + (a)[15] + 0xA953FD4E;
    e = A(n, n, 32U - (uint)5) + d;
    g = A(g, g, 32U - 10U);
  } while (0);
  do {
    const uint n = d + ((e) ^ ((f) | ~(g))) + (a)[13] + 0xA953FD4E;
    d = A(n, n, 32U - (uint)6) + c;
    f = A(f, f, 32U - 10U);
  } while (0);

  do {
    const uint n = h + ((i) ^ ((j) | ~(k))) + (a)[5] + 0x50A28BE6;
    h = A(n, n, 32U - (uint)8) + l;
    j = A(j, j, 32U - 10U);
  } while (0);
  do {
    const uint n = l + ((h) ^ ((i) | ~(j))) + (a)[14] + 0x50A28BE6;
    l = A(n, n, 32U - (uint)9) + k;
    i = A(i, i, 32U - 10U);
  } while (0);
  do {
    const uint n = k + ((l) ^ ((h) | ~(i))) + (a)[7] + 0x50A28BE6;
    k = A(n, n, 32U - (uint)9) + j;
    h = A(h, h, 32U - 10U);
  } while (0);
  do {
    const uint n = j + ((k) ^ ((l) | ~(h))) + (a)[0] + 0x50A28BE6;
    j = A(n, n, 32U - (uint)11) + i;
    l = A(l, l, 32U - 10U);
  } while (0);
  do {
    const uint n = i + ((j) ^ ((k) | ~(l))) + (a)[9] + 0x50A28BE6;
    i = A(n, n, 32U - (uint)13) + h;
    k = A(k, k, 32U - 10U);
  } while (0);
  do {
    const uint n = h + ((i) ^ ((j) | ~(k))) + (a)[2] + 0x50A28BE6;
    h = A(n, n, 32U - (uint)15) + l;
    j = A(j, j, 32U - 10U);
  } while (0);
  do {
    const uint n = l + ((h) ^ ((i) | ~(j))) + (a)[11] + 0x50A28BE6;
    l = A(n, n, 32U - (uint)15) + k;
    i = A(i, i, 32U - 10U);
  } while (0);
  do {
    const uint n = k + ((l) ^ ((h) | ~(i))) + (a)[4] + 0x50A28BE6;
    k = A(n, n, 32U - (uint)5) + j;
    h = A(h, h, 32U - 10U);
  } while (0);
  do {
    const uint n = j + ((k) ^ ((l) | ~(h))) + (a)[13] + 0x50A28BE6;
    j = A(n, n, 32U - (uint)7) + i;
    l = A(l, l, 32U - 10U);
  } while (0);
  do {
    const uint n = i + ((j) ^ ((k) | ~(l))) + (a)[6] + 0x50A28BE6;
    i = A(n, n, 32U - (uint)7) + h;
    k = A(k, k, 32U - 10U);
  } while (0);
  do {
    const uint n = h + ((i) ^ ((j) | ~(k))) + (a)[15] + 0x50A28BE6;
    h = A(n, n, 32U - (uint)8) + l;
    j = A(j, j, 32U - 10U);
  } while (0);
  do {
    const uint n = l + ((h) ^ ((i) | ~(j))) + (a)[8] + 0x50A28BE6;
    l = A(n, n, 32U - (uint)11) + k;
    i = A(i, i, 32U - 10U);
  } while (0);
  do {
    const uint n = k + ((l) ^ ((h) | ~(i))) + (a)[1] + 0x50A28BE6;
    k = A(n, n, 32U - (uint)14) + j;
    h = A(h, h, 32U - 10U);
  } while (0);
  do {
    const uint n = j + ((k) ^ ((l) | ~(h))) + (a)[10] + 0x50A28BE6;
    j = A(n, n, 32U - (uint)14) + i;
    l = A(l, l, 32U - 10U);
  } while (0);
  do {
    const uint n = i + ((j) ^ ((k) | ~(l))) + (a)[3] + 0x50A28BE6;
    i = A(n, n, 32U - (uint)12) + h;
    k = A(k, k, 32U - 10U);
  } while (0);
  do {
    const uint n = h + ((i) ^ ((j) | ~(k))) + (a)[12] + 0x50A28BE6;
    h = A(n, n, 32U - (uint)6) + l;
    j = A(j, j, 32U - 10U);
  } while (0);

  do {
    const uint n = l + ((((h) ^ (i)) & (j)) ^ (i)) + (a)[6] + 0x5C4DD124;
    l = A(n, n, 32U - (uint)9) + k;
    i = A(i, i, 32U - 10U);
  } while (0);
  do {
    const uint n = k + ((((l) ^ (h)) & (i)) ^ (h)) + (a)[11] + 0x5C4DD124;
    k = A(n, n, 32U - (uint)13) + j;
    h = A(h, h, 32U - 10U);
  } while (0);
  do {
    const uint n = j + ((((k) ^ (l)) & (h)) ^ (l)) + (a)[3] + 0x5C4DD124;
    j = A(n, n, 32U - (uint)15) + i;
    l = A(l, l, 32U - 10U);
  } while (0);
  do {
    const uint n = i + ((((j) ^ (k)) & (l)) ^ (k)) + (a)[7] + 0x5C4DD124;
    i = A(n, n, 32U - (uint)7) + h;
    k = A(k, k, 32U - 10U);
  } while (0);
  do {
    const uint n = h + ((((i) ^ (j)) & (k)) ^ (j)) + (a)[0] + 0x5C4DD124;
    h = A(n, n, 32U - (uint)12) + l;
    j = A(j, j, 32U - 10U);
  } while (0);
  do {
    const uint n = l + ((((h) ^ (i)) & (j)) ^ (i)) + (a)[13] + 0x5C4DD124;
    l = A(n, n, 32U - (uint)8) + k;
    i = A(i, i, 32U - 10U);
  } while (0);
  do {
    const uint n = k + ((((l) ^ (h)) & (i)) ^ (h)) + (a)[5] + 0x5C4DD124;
    k = A(n, n, 32U - (uint)9) + j;
    h = A(h, h, 32U - 10U);
  } while (0);
  do {
    const uint n = j + ((((k) ^ (l)) & (h)) ^ (l)) + (a)[10] + 0x5C4DD124;
    j = A(n, n, 32U - (uint)11) + i;
    l = A(l, l, 32U - 10U);
  } while (0);
  do {
    const uint n = i + ((((j) ^ (k)) & (l)) ^ (k)) + (a)[14] + 0x5C4DD124;
    i = A(n, n, 32U - (uint)7) + h;
    k = A(k, k, 32U - 10U);
  } while (0);
  do {
    const uint n = h + ((((i) ^ (j)) & (k)) ^ (j)) + (a)[15] + 0x5C4DD124;
    h = A(n, n, 32U - (uint)7) + l;
    j = A(j, j, 32U - 10U);
  } while (0);
  do {
    const uint n = l + ((((h) ^ (i)) & (j)) ^ (i)) + (a)[8] + 0x5C4DD124;
    l = A(n, n, 32U - (uint)12) + k;
    i = A(i, i, 32U - 10U);
  } while (0);
  do {
    const uint n = k + ((((l) ^ (h)) & (i)) ^ (h)) + (a)[12] + 0x5C4DD124;
    k = A(n, n, 32U - (uint)7) + j;
    h = A(h, h, 32U - 10U);
  } while (0);
  do {
    const uint n = j + ((((k) ^ (l)) & (h)) ^ (l)) + (a)[4] + 0x5C4DD124;
    j = A(n, n, 32U - (uint)6) + i;
    l = A(l, l, 32U - 10U);
  } while (0);
  do {
    const uint n = i + ((((j) ^ (k)) & (l)) ^ (k)) + (a)[9] + 0x5C4DD124;
    i = A(n, n, 32U - (uint)15) + h;
    k = A(k, k, 32U - 10U);
  } while (0);
  do {
    const uint n = h + ((((i) ^ (j)) & (k)) ^ (j)) + (a)[1] + 0x5C4DD124;
    h = A(n, n, 32U - (uint)13) + l;
    j = A(j, j, 32U - 10U);
  } while (0);
  do {
    const uint n = l + ((((h) ^ (i)) & (j)) ^ (i)) + (a)[2] + 0x5C4DD124;
    l = A(n, n, 32U - (uint)11) + k;
    i = A(i, i, 32U - 10U);
  } while (0);

  do {
    const uint n = k + (((l) | ~(h)) ^ (i)) + (a)[15] + 0x6D703EF3;
    k = A(n, n, 32U - (uint)9) + j;
    h = A(h, h, 32U - 10U);
  } while (0);
  do {
    const uint n = j + (((k) | ~(l)) ^ (h)) + (a)[5] + 0x6D703EF3;
    j = A(n, n, 32U - (uint)7) + i;
    l = A(l, l, 32U - 10U);
  } while (0);
  do {
    const uint n = i + (((j) | ~(k)) ^ (l)) + (a)[1] + 0x6D703EF3;
    i = A(n, n, 32U - (uint)15) + h;
    k = A(k, k, 32U - 10U);
  } while (0);
  do {
    const uint n = h + (((i) | ~(j)) ^ (k)) + (a)[3] + 0x6D703EF3;
    h = A(n, n, 32U - (uint)11) + l;
    j = A(j, j, 32U - 10U);
  } while (0);
  do {
    const uint n = l + (((h) | ~(i)) ^ (j)) + (a)[7] + 0x6D703EF3;
    l = A(n, n, 32U - (uint)8) + k;
    i = A(i, i, 32U - 10U);
  } while (0);
  do {
    const uint n = k + (((l) | ~(h)) ^ (i)) + (a)[14] + 0x6D703EF3;
    k = A(n, n, 32U - (uint)6) + j;
    h = A(h, h, 32U - 10U);
  } while (0);
  do {
    const uint n = j + (((k) | ~(l)) ^ (h)) + (a)[6] + 0x6D703EF3;
    j = A(n, n, 32U - (uint)6) + i;
    l = A(l, l, 32U - 10U);
  } while (0);
  do {
    const uint n = i + (((j) | ~(k)) ^ (l)) + (a)[9] + 0x6D703EF3;
    i = A(n, n, 32U - (uint)14) + h;
    k = A(k, k, 32U - 10U);
  } while (0);
  do {
    const uint n = h + (((i) | ~(j)) ^ (k)) + (a)[11] + 0x6D703EF3;
    h = A(n, n, 32U - (uint)12) + l;
    j = A(j, j, 32U - 10U);
  } while (0);
  do {
    const uint n = l + (((h) | ~(i)) ^ (j)) + (a)[8] + 0x6D703EF3;
    l = A(n, n, 32U - (uint)13) + k;
    i = A(i, i, 32U - 10U);
  } while (0);
  do {
    const uint n = k + (((l) | ~(h)) ^ (i)) + (a)[12] + 0x6D703EF3;
    k = A(n, n, 32U - (uint)5) + j;
    h = A(h, h, 32U - 10U);
  } while (0);
  do {
    const uint n = j + (((k) | ~(l)) ^ (h)) + (a)[2] + 0x6D703EF3;
    j = A(n, n, 32U - (uint)14) + i;
    l = A(l, l, 32U - 10U);
  } while (0);
  do {
    const uint n = i + (((j) | ~(k)) ^ (l)) + (a)[10] + 0x6D703EF3;
    i = A(n, n, 32U - (uint)13) + h;
    k = A(k, k, 32U - 10U);
  } while (0);
  do {
    const uint n = h + (((i) | ~(j)) ^ (k)) + (a)[0] + 0x6D703EF3;
    h = A(n, n, 32U - (uint)13) + l;
    j = A(j, j, 32U - 10U);
  } while (0);
  do {
    const uint n = l + (((h) | ~(i)) ^ (j)) + (a)[4] + 0x6D703EF3;
    l = A(n, n, 32U - (uint)7) + k;
    i = A(i, i, 32U - 10U);
  } while (0);
  do {
    const uint n = k + (((l) | ~(h)) ^ (i)) + (a)[13] + 0x6D703EF3;
    k = A(n, n, 32U - (uint)5) + j;
    h = A(h, h, 32U - 10U);
  } while (0);

  do {
    const uint n = j + ((((l) ^ (h)) & (k)) ^ (h)) + (a)[8] + 0x7A6D76E9;
    j = A(n, n, 32U - (uint)15) + i;
    l = A(l, l, 32U - 10U);
  } while (0);
  do {
    const uint n = i + ((((k) ^ (l)) & (j)) ^ (l)) + (a)[6] + 0x7A6D76E9;
    i = A(n, n, 32U - (uint)5) + h;
    k = A(k, k, 32U - 10U);
  } while (0);
  do {
    const uint n = h + ((((j) ^ (k)) & (i)) ^ (k)) + (a)[4] + 0x7A6D76E9;
    h = A(n, n, 32U - (uint)8) + l;
    j = A(j, j, 32U - 10U);
  } while (0);
  do {
    const uint n = l + ((((i) ^ (j)) & (h)) ^ (j)) + (a)[1] + 0x7A6D76E9;
    l = A(n, n, 32U - (uint)11) + k;
    i = A(i, i, 32U - 10U);
  } while (0);
  do {
    const uint n = k + ((((h) ^ (i)) & (l)) ^ (i)) + (a)[3] + 0x7A6D76E9;
    k = A(n, n, 32U - (uint)14) + j;
    h = A(h, h, 32U - 10U);
  } while (0);
  do {
    const uint n = j + ((((l) ^ (h)) & (k)) ^ (h)) + (a)[11] + 0x7A6D76E9;
    j = A(n, n, 32U - (uint)14) + i;
    l = A(l, l, 32U - 10U);
  } while (0);
  do {
    const uint n = i + ((((k) ^ (l)) & (j)) ^ (l)) + (a)[15] + 0x7A6D76E9;
    i = A(n, n, 32U - (uint)6) + h;
    k = A(k, k, 32U - 10U);
  } while (0);
  do {
    const uint n = h + ((((j) ^ (k)) & (i)) ^ (k)) + (a)[0] + 0x7A6D76E9;
    h = A(n, n, 32U - (uint)14) + l;
    j = A(j, j, 32U - 10U);
  } while (0);
  do {
    const uint n = l + ((((i) ^ (j)) & (h)) ^ (j)) + (a)[5] + 0x7A6D76E9;
    l = A(n, n, 32U - (uint)6) + k;
    i = A(i, i, 32U - 10U);
  } while (0);
  do {
    const uint n = k + ((((h) ^ (i)) & (l)) ^ (i)) + (a)[12] + 0x7A6D76E9;
    k = A(n, n, 32U - (uint)9) + j;
    h = A(h, h, 32U - 10U);
  } while (0);
  do {
    const uint n = j + ((((l) ^ (h)) & (k)) ^ (h)) + (a)[2] + 0x7A6D76E9;
    j = A(n, n, 32U - (uint)12) + i;
    l = A(l, l, 32U - 10U);
  } while (0);
  do {
    const uint n = i + ((((k) ^ (l)) & (j)) ^ (l)) + (a)[13] + 0x7A6D76E9;
    i = A(n, n, 32U - (uint)9) + h;
    k = A(k, k, 32U - 10U);
  } while (0);
  do {
    const uint n = h + ((((j) ^ (k)) & (i)) ^ (k)) + (a)[9] + 0x7A6D76E9;
    h = A(n, n, 32U - (uint)12) + l;
    j = A(j, j, 32U - 10U);
  } while (0);
  do {
    const uint n = l + ((((i) ^ (j)) & (h)) ^ (j)) + (a)[7] + 0x7A6D76E9;
    l = A(n, n, 32U - (uint)5) + k;
    i = A(i, i, 32U - 10U);
  } while (0);
  do {
    const uint n = k + ((((h) ^ (i)) & (l)) ^ (i)) + (a)[10] + 0x7A6D76E9;
    k = A(n, n, 32U - (uint)15) + j;
    h = A(h, h, 32U - 10U);
  } while (0);
  do {
    const uint n = j + ((((l) ^ (h)) & (k)) ^ (h)) + (a)[14] + 0x7A6D76E9;
    j = A(n, n, 32U - (uint)8) + i;
    l = A(l, l, 32U - 10U);
  } while (0);

  do {
    const uint n = i + ((j) ^ (k) ^ (l)) + (a)[12] + 0x00000000;
    i = A(n, n, 32U - (uint)8) + h;
    k = A(k, k, 32U - 10U);
  } while (0);
  do {
    const uint n = h + ((i) ^ (j) ^ (k)) + (a)[15] + 0x00000000;
    h = A(n, n, 32U - (uint)5) + l;
    j = A(j, j, 32U - 10U);
  } while (0);
  do {
    const uint n = l + ((h) ^ (i) ^ (j)) + (a)[10] + 0x00000000;
    l = A(n, n, 32U - (uint)12) + k;
    i = A(i, i, 32U - 10U);
  } while (0);
  do {
    const uint n = k + ((l) ^ (h) ^ (i)) + (a)[4] + 0x00000000;
    k = A(n, n, 32U - (uint)9) + j;
    h = A(h, h, 32U - 10U);
  } while (0);
  do {
    const uint n = j + ((k) ^ (l) ^ (h)) + (a)[1] + 0x00000000;
    j = A(n, n, 32U - (uint)12) + i;
    l = A(l, l, 32U - 10U);
  } while (0);
  do {
    const uint n = i + ((j) ^ (k) ^ (l)) + (a)[5] + 0x00000000;
    i = A(n, n, 32U - (uint)5) + h;
    k = A(k, k, 32U - 10U);
  } while (0);
  do {
    const uint n = h + ((i) ^ (j) ^ (k)) + (a)[8] + 0x00000000;
    h = A(n, n, 32U - (uint)14) + l;
    j = A(j, j, 32U - 10U);
  } while (0);
  do {
    const uint n = l + ((h) ^ (i) ^ (j)) + (a)[7] + 0x00000000;
    l = A(n, n, 32U - (uint)6) + k;
    i = A(i, i, 32U - 10U);
  } while (0);
  do {
    const uint n = k + ((l) ^ (h) ^ (i)) + (a)[6] + 0x00000000;
    k = A(n, n, 32U - (uint)8) + j;
    h = A(h, h, 32U - 10U);
  } while (0);
  do {
    const uint n = j + ((k) ^ (l) ^ (h)) + (a)[2] + 0x00000000;
    j = A(n, n, 32U - (uint)13) + i;
    l = A(l, l, 32U - 10U);
  } while (0);
  do {
    const uint n = i + ((j) ^ (k) ^ (l)) + (a)[13] + 0x00000000;
    i = A(n, n, 32U - (uint)6) + h;
    k = A(k, k, 32U - 10U);
  } while (0);
  do {
    const uint n = h + ((i) ^ (j) ^ (k)) + (a)[14] + 0x00000000;
    h = A(n, n, 32U - (uint)5) + l;
    j = A(j, j, 32U - 10U);
  } while (0);
  do {
    const uint n = l + ((h) ^ (i) ^ (j)) + (a)[0] + 0x00000000;
    l = A(n, n, 32U - (uint)15) + k;
    i = A(i, i, 32U - 10U);
  } while (0);
  do {
    const uint n = k + ((l) ^ (h) ^ (i)) + (a)[3] + 0x00000000;
    k = A(n, n, 32U - (uint)13) + j;
    h = A(h, h, 32U - 10U);
  } while (0);
  do {
    const uint n = j + ((k) ^ (l) ^ (h)) + (a)[9] + 0x00000000;
    j = A(n, n, 32U - (uint)11) + i;
    l = A(l, l, 32U - 10U);
  } while (0);
  do {
    const uint n = i + ((j) ^ (k) ^ (l)) + (a)[11] + 0x00000000;
    i = A(n, n, 32U - (uint)11) + h;
    k = A(k, k, 32U - 10U);
  } while (0);

  m = (b)[1] + e + k;
  (b)[1] = (b)[2] + f + l;
  (b)[2] = (b)[3] + g + h;
  (b)[3] = (b)[4] + c + i;
  (b)[4] = (b)[0] + d + j;
  (b)[0] = m;
}

const __constant ulong Gb[80] = {0x428A2F98D728AE22UL, 0x7137449123EF65CDUL, 0xB5C0FBCFEC4D3B2FUL, 0xE9B5DBA58189DBBCUL, 0x3956C25BF348B538UL, 0x59F111F1B605D019UL, 0x923F82A4AF194F9BUL, 0xAB1C5ED5DA6D8118UL, 0xD807AA98A3030242UL, 0x12835B0145706FBEUL, 0x243185BE4EE4B28CUL, 0x550C7DC3D5FFB4E2UL, 0x72BE5D74F27B896FUL, 0x80DEB1FE3B1696B1UL, 0x9BDC06A725C71235UL, 0xC19BF174CF692694UL, 0xE49B69C19EF14AD2UL, 0xEFBE4786384F25E3UL, 0x0FC19DC68B8CD5B5UL, 0x240CA1CC77AC9C65UL,
                                 0x2DE92C6F592B0275UL, 0x4A7484AA6EA6E483UL, 0x5CB0A9DCBD41FBD4UL, 0x76F988DA831153B5UL, 0x983E5152EE66DFABUL, 0xA831C66D2DB43210UL, 0xB00327C898FB213FUL, 0xBF597FC7BEEF0EE4UL, 0xC6E00BF33DA88FC2UL, 0xD5A79147930AA725UL, 0x06CA6351E003826FUL, 0x142929670A0E6E70UL, 0x27B70A8546D22FFCUL, 0x2E1B21385C26C926UL, 0x4D2C6DFC5AC42AEDUL, 0x53380D139D95B3DFUL, 0x650A73548BAF63DEUL, 0x766A0ABB3C77B2A8UL, 0x81C2C92E47EDAEE6UL, 0x92722C851482353BUL,
                                 0xA2BFE8A14CF10364UL, 0xA81A664BBC423001UL, 0xC24B8B70D0F89791UL, 0xC76C51A30654BE30UL, 0xD192E819D6EF5218UL, 0xD69906245565A910UL, 0xF40E35855771202AUL, 0x106AA07032BBD1B8UL, 0x19A4C116B8D2D0C8UL, 0x1E376C085141AB53UL, 0x2748774CDF8EEB99UL, 0x34B0BCB5E19B48A8UL, 0x391C0CB3C5C95A63UL, 0x4ED8AA4AE3418ACBUL, 0x5B9CCA4F7763E373UL, 0x682E6FF3D6B2B8A3UL, 0x748F82EE5DEFB2FCUL, 0x78A5636F43172F60UL, 0x84C87814A1F0AB72UL, 0x8CC702081A6439ECUL,
                                 0x90BEFFFA23631E28UL, 0xA4506CEBDE82BDE9UL, 0xBEF9A3F7B2C67915UL, 0xC67178F2E372532BUL, 0xCA273ECEEA26619CUL, 0xD186B8C721C0C207UL, 0xEADA7DD6CDE0EB1EUL, 0xF57D4F7FEE6ED178UL, 0x06F067AA72176FBAUL, 0x0A637DC5A2C898A6UL, 0x113F9804BEF90DAEUL, 0x1B710B35131C471BUL, 0x28DB77F523047D84UL, 0x32CAAB7B40C72493UL, 0x3C9EBE0A15C9BEBCUL, 0x431D67C49C100D4CUL, 0x4CC5D4BECB3E42B6UL, 0x597F299CFC657E2AUL, 0x5FCB6FAB3AD6FAECUL, 0x6C44198C4A475817UL};

const __constant ulong Gc[8] = {0x6A09E667F3BCC908UL, 0xBB67AE8584CAA73BUL, 0x3C6EF372FE94F82BUL, 0xA54FF53A5F1D36F1UL, 0x510E527FADE682D1UL, 0x9B05688C2B3E6C1FUL, 0x1F83D9ABFB41BD6BUL, 0x5BE0CD19137E2179UL};

ulong E(const uint2 a, const uint b) {
  return (__builtin_astype(B(a.s10, a, b), ulong));
}
ulong F(const uint2 a, const uint b) {
  return (__builtin_astype(B(a, a.s10, (b - 32)), ulong));
}
void G(const ulong* a, uint b, ulong* c, int d) {
  ulong e;
  int f = 8 - b;

  ulong g = c[f & 7], h = c[(f + 1) & 7], i = c[(f + 2) & 7], j = c[(f + 3) & 7];
  ulong k = c[(f + 4) & 7], l = c[(f + 5) & 7], m = c[(f + 6) & 7], n = c[(f + 7) & 7];

  e = n + (E(__builtin_astype(k, uint2), 14) ^ E(__builtin_astype(k, uint2), 18) ^ F(__builtin_astype(k, uint2), 41)) + bitselect(m, l, k) + a[d] + Gb[d];
  c[(3 + f) & 7] = j + e;
  c[(7 + f) & 7] = e + (E(__builtin_astype(g, uint2), 28) ^ F(__builtin_astype(g, uint2), 34) ^ F(__builtin_astype(g, uint2), 39)) + bitselect(i, h, (g ^ i));
}

void H(ulong* a, ulong* b) {
  ulong c[8];

  for (int d = 0; d < 8; ++d)
    c[d] = b[d];

  for (int d = 16; d < 80; ++d)
    a[d] = (E(__builtin_astype(a[d - 2], uint2), 19) ^ F(__builtin_astype(a[d - 2], uint2), 61) ^ ((a[d - 2]) >> 6)) + a[d - 7] + (E(__builtin_astype(a[d - 15], uint2), 1) ^ E(__builtin_astype(a[d - 15], uint2), 8) ^ ((a[d - 15]) >> 7)) + a[d - 16];

  for (int d = 0; d < 80; d += 8) {
    for (int e = 0; e < 8; ++e) {
      G(a, e, c, d + e);
    }
  }

  for (int d = 0; d < 8; ++d)
    b[d] += c[d];
}

__attribute__((reqd_work_group_size(128, 1, 1))) __kernel void I(__global const uint* a, __global uint* b, uint c, ulong d) {
  uint e[16];
  ulong f[80], g[8];
  uint h[16];
  uint i[5];
  uint8 j;

  for (int k = 0; k < 1000; ++k) {
    uint l = get_global_id(0) * 1000 + k + c;

    for (int m = 0; m < 16; ++m)
      e[m] = a[m];
    j = (uint8)(0x6A09E667, 0xBB67AE85, 0x3C6EF372, 0xA54FF53A, 0x510E527F, 0x9B05688C, 0x1F83D9AB, 0x5BE0CD19);

    for (volatile int m = 0; m < 3; ++m) {
      if (m == 1) {
        e[0] = a[0 + 16];
        e[1] = a[1 + 16];
        e[2] = a[2 + 16];
        e[3] = a[3 + 16];
        e[4] = a[4 + 16];
        e[5] = a[5 + 16];
        e[6] = a[6 + 16];
        e[7] = a[7 + 16];
        e[8] = a[8 + 16];
        e[9] = a[9 + 16];
        e[10] = a[10 + 16];
        e[11] = ((((l) >> 24) & 0xFFU) | (((l) >> 8) & 0xFF00U) | (((l) << 8) & 0xFF0000U) | (((l) << 24) & 0xFF000000U));
        e[12] = 0x80000000;
        e[13] = 0x00000000;
        e[14] = 0x00000000;
        e[15] = 0x00000380;
      }
      if (m == 2) {
        e[0] = j.s0;
        e[1] = j.s1;
        e[2] = j.s2;
        e[3] = j.s3;
        e[4] = j.s4;
        e[5] = j.s5;
        e[6] = j.s6;
        e[7] = j.s7;
        e[8] = 0x80000000;
        e[9] = 0x00000000;
        e[10] = 0x00000000;
        e[11] = 0x00000000;
        e[12] = 0x00000000;
        e[13] = 0x00000000;
        e[14] = 0x00000000;
        e[15] = 0x00000100;
        j = (uint8)(0x6A09E667, 0xBB67AE85, 0x3C6EF372, 0xA54FF53A, 0x510E527F, 0x9B05688C, 0x1F83D9AB, 0x5BE0CD19);
      }
      j = C(((uint16*)e)[0], j);
    }

    for (int m = 0; m < 16; ++m)
      f[m] = 0UL;
    ((uint8*)f)[0].s0 = j.s1;
    ((uint8*)f)[0].s1 = j.s0;
    ((uint8*)f)[0].s2 = j.s3;
    ((uint8*)f)[0].s3 = j.s2;
    ((uint8*)f)[0].s4 = j.s5;
    ((uint8*)f)[0].s5 = j.s4;
    ((uint8*)f)[0].s6 = j.s7;
    ((uint8*)f)[0].s7 = j.s6;
    f[4] = 0x8000000000000000UL;
    f[15] = 0x0000000000000100UL;
    for (int m = 0; m < 8; ++m)
      g[m] = Gc[m];
    H(f, g);
    for (int m = 0; m < 8; ++m)
      g[m] = __builtin_astype(__builtin_astype(g[m], uchar8).s76543210, ulong);

    for (int m = 0; m < 16; ++m)
      h[m] = 0;
    for (int m = 0; m < 4; ++m)
      ((ulong*)h)[m] = g[m];
    h[8] = 0x00000080;
    h[14] = 0x00000100;
    for (int m = 0; m < 5; ++m)
      i[m] = Ga[m];

    for (volatile int n = 0; n < 2; ++n) {
      if (n == 1) {
        e[0] = ((((i[0]) >> 24) & 0xFFU) | (((i[0]) >> 8) & 0xFF00U) | (((i[0]) << 8) & 0xFF0000U) | (((i[0]) << 24) & 0xFF000000U));
        e[1] = ((((i[1]) >> 24) & 0xFFU) | (((i[1]) >> 8) & 0xFF00U) | (((i[1]) << 8) & 0xFF0000U) | (((i[1]) << 24) & 0xFF000000U));
        e[2] = ((((i[2]) >> 24) & 0xFFU) | (((i[2]) >> 8) & 0xFF00U) | (((i[2]) << 8) & 0xFF0000U) | (((i[2]) << 24) & 0xFF000000U));
        e[3] = ((((i[3]) >> 24) & 0xFFU) | (((i[3]) >> 8) & 0xFF00U) | (((i[3]) << 8) & 0xFF0000U) | (((i[3]) << 24) & 0xFF000000U));
        e[4] = ((((i[4]) >> 24) & 0xFFU) | (((i[4]) >> 8) & 0xFF00U) | (((i[4]) << 8) & 0xFF0000U) | (((i[4]) << 24) & 0xFF000000U));

        for (int m = 0; m < 16; ++m)
          h[m] = 0;
        for (int m = 0; m < 4; ++m)
          ((ulong*)h)[m] = g[m + 4];
        h[8] = 0x00000080;
        h[14] = 0x00000100;
        for (int m = 0; m < 5; ++m)
          i[m] = Ga[m];
      }
      D(h, i);
    }

    e[5] = ((((i[0]) >> 24) & 0xFFU) | (((i[0]) >> 8) & 0xFF00U) | (((i[0]) << 8) & 0xFF0000U) | (((i[0]) << 24) & 0xFF000000U));
    e[6] = ((((i[1]) >> 24) & 0xFFU) | (((i[1]) >> 8) & 0xFF00U) | (((i[1]) << 8) & 0xFF0000U) | (((i[1]) << 24) & 0xFF000000U));
    e[7] = ((((i[2]) >> 24) & 0xFFU) | (((i[2]) >> 8) & 0xFF00U) | (((i[2]) << 8) & 0xFF0000U) | (((i[2]) << 24) & 0xFF000000U));
    e[8] = ((((i[3]) >> 24) & 0xFFU) | (((i[3]) >> 8) & 0xFF00U) | (((i[3]) << 8) & 0xFF0000U) | (((i[3]) << 24) & 0xFF000000U));
    e[9] = ((((i[4]) >> 24) & 0xFFU) | (((i[4]) >> 8) & 0xFF00U) | (((i[4]) << 8) & 0xFF0000U) | (((i[4]) << 24) & 0xFF000000U));
    e[10] = 0x80000000;
    for (int m = 11; m < 15; ++m)
      e[m] = 0x00000000U;
    e[15] = 0x00000140;
    j = (uint8)(0x6A09E667, 0xBB67AE85, 0x3C6EF372, 0xA54FF53A, 0x510E527F, 0x9B05688C, 0x1F83D9AB, 0x5BE0CD19);
    for (volatile int n = 0; n < 2; ++n) {
      if (n == 1) {
        ((uint8*)e)[0] = j;
        e[8] = 0x80000000;
        for (int m = 9; m < 15; ++m)
          e[m] = 0x00000000;
        e[15] = 0x00000100;

        j = (uint8)(0x6A09E667, 0xBB67AE85, 0x3C6EF372, 0xA54FF53A, 0x510E527F, 0x9B05688C, 0x1F83D9AB, 0x5BE0CD19);
      }
      j = C(((uint16*)e)[0], j);
    }

    j.s6 = ((((j.s6) >> 24) & 0xFFU) | (((j.s6) >> 8) & 0xFF00U) | (((j.s6) << 8) & 0xFF0000U) | (((j.s6) << 24) & 0xFF000000U));
    j.s7 = ((((j.s7) >> 24) & 0xFFU) | (((j.s7) >> 8) & 0xFF00U) | (((j.s7) << 8) & 0xFF0000U) | (((j.s7) << 24) & 0xFF000000U));

    if ((((ulong)j.s7 << 32) | j.s6) <= d) {
      int m = atomic_add(b + 0xFF, 1);
      b[m] = l;
      b[256 + m * 8 + 0] = ((((j.s0) >> 24) & 0xFFU) | (((j.s0) >> 8) & 0xFF00U) | (((j.s0) << 8) & 0xFF0000U) | (((j.s0) << 24) & 0xFF000000U));
      b[256 + m * 8 + 1] = ((((j.s1) >> 24) & 0xFFU) | (((j.s1) >> 8) & 0xFF00U) | (((j.s1) << 8) & 0xFF0000U) | (((j.s1) << 24) & 0xFF000000U));
      b[256 + m * 8 + 2] = ((((j.s2) >> 24) & 0xFFU) | (((j.s2) >> 8) & 0xFF00U) | (((j.s2) << 8) & 0xFF0000U) | (((j.s2) << 24) & 0xFF000000U));
      b[256 + m * 8 + 3] = ((((j.s3) >> 24) & 0xFFU) | (((j.s3) >> 8) & 0xFF00U) | (((j.s3) << 8) & 0xFF0000U) | (((j.s3) << 24) & 0xFF000000U));
      b[256 + m * 8 + 4] = ((((j.s4) >> 24) & 0xFFU) | (((j.s4) >> 8) & 0xFF00U) | (((j.s4) << 8) & 0xFF0000U) | (((j.s4) << 24) & 0xFF000000U));
      b[256 + m * 8 + 5] = ((((j.s5) >> 24) & 0xFFU) | (((j.s5) >> 8) & 0xFF00U) | (((j.s5) << 8) & 0xFF0000U) | (((j.s5) << 24) & 0xFF000000U));
      b[256 + m * 8 + 6] = j.s6;
      b[256 + m * 8 + 7] = j.s7;
    }
  }
}
inline uint8 A(uint16 a, uint8 b) {
  uint c;
  uint8 d = b;
  uint e = a.s0;
  uint f = a.s1;
  uint g = a.s2;
  uint h = a.s3;
  uint i = a.s4;
  uint j = a.s5;
  uint k = a.s6;
  uint l = a.s7;
  uint m = a.s8;
  uint n = a.s9;
  uint o = a.sA;
  uint p = a.sB;
  uint q = a.sC;
  uint r = a.sD;
  uint s = a.sE;
  uint t = a.sF;
  {
    c = d.s7 + (rotate(d.s4, (uint)26) ^ rotate(d.s4, (uint)21) ^ rotate(d.s4, (uint)7)) + bitselect(d.s6, d.s5, d.s4) + (0x428A2F98 + e);
    d.s3 += c;
    d.s7 = c + (rotate(d.s0, (uint)30) ^ rotate(d.s0, (uint)19) ^ rotate(d.s0, (uint)10)) + bitselect(d.s2, d.s0, d.s2 ^ d.s1);
  };
  {
    c = d.s6 + (rotate(d.s3, (uint)26) ^ rotate(d.s3, (uint)21) ^ rotate(d.s3, (uint)7)) + bitselect(d.s5, d.s4, d.s3) + (0x71374491 + f);
    d.s2 += c;
    d.s6 = c + (rotate(d.s7, (uint)30) ^ rotate(d.s7, (uint)19) ^ rotate(d.s7, (uint)10)) + bitselect(d.s1, d.s7, d.s1 ^ d.s0);
  };
  {
    c = d.s5 + (rotate(d.s2, (uint)26) ^ rotate(d.s2, (uint)21) ^ rotate(d.s2, (uint)7)) + bitselect(d.s4, d.s3, d.s2) + (0xB5C0FBCF + g);
    d.s1 += c;
    d.s5 = c + (rotate(d.s6, (uint)30) ^ rotate(d.s6, (uint)19) ^ rotate(d.s6, (uint)10)) + bitselect(d.s0, d.s6, d.s0 ^ d.s7);
  };
  {
    c = d.s4 + (rotate(d.s1, (uint)26) ^ rotate(d.s1, (uint)21) ^ rotate(d.s1, (uint)7)) + bitselect(d.s3, d.s2, d.s1) + (0xE9B5DBA5 + h);
    d.s0 += c;
    d.s4 = c + (rotate(d.s5, (uint)30) ^ rotate(d.s5, (uint)19) ^ rotate(d.s5, (uint)10)) + bitselect(d.s7, d.s5, d.s7 ^ d.s6);
  };
  {
    c = d.s3 + (rotate(d.s0, (uint)26) ^ rotate(d.s0, (uint)21) ^ rotate(d.s0, (uint)7)) + bitselect(d.s2, d.s1, d.s0) + (0x3956C25B + i);
    d.s7 += c;
    d.s3 = c + (rotate(d.s4, (uint)30) ^ rotate(d.s4, (uint)19) ^ rotate(d.s4, (uint)10)) + bitselect(d.s6, d.s4, d.s6 ^ d.s5);
  };
  {
    c = d.s2 + (rotate(d.s7, (uint)26) ^ rotate(d.s7, (uint)21) ^ rotate(d.s7, (uint)7)) + bitselect(d.s1, d.s0, d.s7) + (0x59F111F1 + j);
    d.s6 += c;
    d.s2 = c + (rotate(d.s3, (uint)30) ^ rotate(d.s3, (uint)19) ^ rotate(d.s3, (uint)10)) + bitselect(d.s5, d.s3, d.s5 ^ d.s4);
  };
  {
    c = d.s1 + (rotate(d.s6, (uint)26) ^ rotate(d.s6, (uint)21) ^ rotate(d.s6, (uint)7)) + bitselect(d.s0, d.s7, d.s6) + (0x923F82A4 + k);
    d.s5 += c;
    d.s1 = c + (rotate(d.s2, (uint)30) ^ rotate(d.s2, (uint)19) ^ rotate(d.s2, (uint)10)) + bitselect(d.s4, d.s2, d.s4 ^ d.s3);
  };
  {
    c = d.s0 + (rotate(d.s5, (uint)26) ^ rotate(d.s5, (uint)21) ^ rotate(d.s5, (uint)7)) + bitselect(d.s7, d.s6, d.s5) + (0xAB1C5ED5 + l);
    d.s4 += c;
    d.s0 = c + (rotate(d.s1, (uint)30) ^ rotate(d.s1, (uint)19) ^ rotate(d.s1, (uint)10)) + bitselect(d.s3, d.s1, d.s3 ^ d.s2);
  };
  {
    c = d.s7 + (rotate(d.s4, (uint)26) ^ rotate(d.s4, (uint)21) ^ rotate(d.s4, (uint)7)) + bitselect(d.s6, d.s5, d.s4) + (0xD807AA98 + m);
    d.s3 += c;
    d.s7 = c + (rotate(d.s0, (uint)30) ^ rotate(d.s0, (uint)19) ^ rotate(d.s0, (uint)10)) + bitselect(d.s2, d.s0, d.s2 ^ d.s1);
  };
  {
    c = d.s6 + (rotate(d.s3, (uint)26) ^ rotate(d.s3, (uint)21) ^ rotate(d.s3, (uint)7)) + bitselect(d.s5, d.s4, d.s3) + (0x12835B01 + n);
    d.s2 += c;
    d.s6 = c + (rotate(d.s7, (uint)30) ^ rotate(d.s7, (uint)19) ^ rotate(d.s7, (uint)10)) + bitselect(d.s1, d.s7, d.s1 ^ d.s0);
  };
  {
    c = d.s5 + (rotate(d.s2, (uint)26) ^ rotate(d.s2, (uint)21) ^ rotate(d.s2, (uint)7)) + bitselect(d.s4, d.s3, d.s2) + (0x243185BE + o);
    d.s1 += c;
    d.s5 = c + (rotate(d.s6, (uint)30) ^ rotate(d.s6, (uint)19) ^ rotate(d.s6, (uint)10)) + bitselect(d.s0, d.s6, d.s0 ^ d.s7);
  };
  {
    c = d.s4 + (rotate(d.s1, (uint)26) ^ rotate(d.s1, (uint)21) ^ rotate(d.s1, (uint)7)) + bitselect(d.s3, d.s2, d.s1) + (0x550C7DC3 + p);
    d.s0 += c;
    d.s4 = c + (rotate(d.s5, (uint)30) ^ rotate(d.s5, (uint)19) ^ rotate(d.s5, (uint)10)) + bitselect(d.s7, d.s5, d.s7 ^ d.s6);
  };
  {
    c = d.s3 + (rotate(d.s0, (uint)26) ^ rotate(d.s0, (uint)21) ^ rotate(d.s0, (uint)7)) + bitselect(d.s2, d.s1, d.s0) + (0x72BE5D74 + q);
    d.s7 += c;
    d.s3 = c + (rotate(d.s4, (uint)30) ^ rotate(d.s4, (uint)19) ^ rotate(d.s4, (uint)10)) + bitselect(d.s6, d.s4, d.s6 ^ d.s5);
  };
  {
    c = d.s2 + (rotate(d.s7, (uint)26) ^ rotate(d.s7, (uint)21) ^ rotate(d.s7, (uint)7)) + bitselect(d.s1, d.s0, d.s7) + (0x80DEB1FE + r);
    d.s6 += c;
    d.s2 = c + (rotate(d.s3, (uint)30) ^ rotate(d.s3, (uint)19) ^ rotate(d.s3, (uint)10)) + bitselect(d.s5, d.s3, d.s5 ^ d.s4);
  };
  {
    c = d.s1 + (rotate(d.s6, (uint)26) ^ rotate(d.s6, (uint)21) ^ rotate(d.s6, (uint)7)) + bitselect(d.s0, d.s7, d.s6) + (0x9BDC06A7 + s);
    d.s5 += c;
    d.s1 = c + (rotate(d.s2, (uint)30) ^ rotate(d.s2, (uint)19) ^ rotate(d.s2, (uint)10)) + bitselect(d.s4, d.s2, d.s4 ^ d.s3);
  };
  {
    c = d.s0 + (rotate(d.s5, (uint)26) ^ rotate(d.s5, (uint)21) ^ rotate(d.s5, (uint)7)) + bitselect(d.s7, d.s6, d.s5) + (0xC19BF174 + t);
    d.s4 += c;
    d.s0 = c + (rotate(d.s1, (uint)30) ^ rotate(d.s1, (uint)19) ^ rotate(d.s1, (uint)10)) + bitselect(d.s3, d.s1, d.s3 ^ d.s2);
  };

  {
    c = d.s7 + (rotate(d.s4, (uint)26) ^ rotate(d.s4, (uint)21) ^ rotate(d.s4, (uint)7)) + bitselect(d.s6, d.s5, d.s4) + (0xE49B69C1 + (e = (rotate(s, (uint)15) ^ rotate(s, (uint)13) ^ ((s) >> 10)) + n + (rotate(f, (uint)25) ^ rotate(f, (uint)14) ^ ((f) >> 3)) + e));
    d.s3 += c;
    d.s7 = c + (rotate(d.s0, (uint)30) ^ rotate(d.s0, (uint)19) ^ rotate(d.s0, (uint)10)) + bitselect(d.s2, d.s0, d.s2 ^ d.s1);
  };
  {
    c = d.s6 + (rotate(d.s3, (uint)26) ^ rotate(d.s3, (uint)21) ^ rotate(d.s3, (uint)7)) + bitselect(d.s5, d.s4, d.s3) + (0xEFBE4786 + (f = (rotate(t, (uint)15) ^ rotate(t, (uint)13) ^ ((t) >> 10)) + o + (rotate(g, (uint)25) ^ rotate(g, (uint)14) ^ ((g) >> 3)) + f));
    d.s2 += c;
    d.s6 = c + (rotate(d.s7, (uint)30) ^ rotate(d.s7, (uint)19) ^ rotate(d.s7, (uint)10)) + bitselect(d.s1, d.s7, d.s1 ^ d.s0);
  };
  {
    c = d.s5 + (rotate(d.s2, (uint)26) ^ rotate(d.s2, (uint)21) ^ rotate(d.s2, (uint)7)) + bitselect(d.s4, d.s3, d.s2) + (0x0FC19DC6 + (g = (rotate(e, (uint)15) ^ rotate(e, (uint)13) ^ ((e) >> 10)) + p + (rotate(h, (uint)25) ^ rotate(h, (uint)14) ^ ((h) >> 3)) + g));
    d.s1 += c;
    d.s5 = c + (rotate(d.s6, (uint)30) ^ rotate(d.s6, (uint)19) ^ rotate(d.s6, (uint)10)) + bitselect(d.s0, d.s6, d.s0 ^ d.s7);
  };
  {
    c = d.s4 + (rotate(d.s1, (uint)26) ^ rotate(d.s1, (uint)21) ^ rotate(d.s1, (uint)7)) + bitselect(d.s3, d.s2, d.s1) + (0x240CA1CC + (h = (rotate(f, (uint)15) ^ rotate(f, (uint)13) ^ ((f) >> 10)) + q + (rotate(i, (uint)25) ^ rotate(i, (uint)14) ^ ((i) >> 3)) + h));
    d.s0 += c;
    d.s4 = c + (rotate(d.s5, (uint)30) ^ rotate(d.s5, (uint)19) ^ rotate(d.s5, (uint)10)) + bitselect(d.s7, d.s5, d.s7 ^ d.s6);
  };
  {
    c = d.s3 + (rotate(d.s0, (uint)26) ^ rotate(d.s0, (uint)21) ^ rotate(d.s0, (uint)7)) + bitselect(d.s2, d.s1, d.s0) + (0x2DE92C6F + (i = (rotate(g, (uint)15) ^ rotate(g, (uint)13) ^ ((g) >> 10)) + r + (rotate(j, (uint)25) ^ rotate(j, (uint)14) ^ ((j) >> 3)) + i));
    d.s7 += c;
    d.s3 = c + (rotate(d.s4, (uint)30) ^ rotate(d.s4, (uint)19) ^ rotate(d.s4, (uint)10)) + bitselect(d.s6, d.s4, d.s6 ^ d.s5);
  };
  {
    c = d.s2 + (rotate(d.s7, (uint)26) ^ rotate(d.s7, (uint)21) ^ rotate(d.s7, (uint)7)) + bitselect(d.s1, d.s0, d.s7) + (0x4A7484AA + (j = (rotate(h, (uint)15) ^ rotate(h, (uint)13) ^ ((h) >> 10)) + s + (rotate(k, (uint)25) ^ rotate(k, (uint)14) ^ ((k) >> 3)) + j));
    d.s6 += c;
    d.s2 = c + (rotate(d.s3, (uint)30) ^ rotate(d.s3, (uint)19) ^ rotate(d.s3, (uint)10)) + bitselect(d.s5, d.s3, d.s5 ^ d.s4);
  };
  {
    c = d.s1 + (rotate(d.s6, (uint)26) ^ rotate(d.s6, (uint)21) ^ rotate(d.s6, (uint)7)) + bitselect(d.s0, d.s7, d.s6) + (0x5CB0A9DC + (k = (rotate(i, (uint)15) ^ rotate(i, (uint)13) ^ ((i) >> 10)) + t + (rotate(l, (uint)25) ^ rotate(l, (uint)14) ^ ((l) >> 3)) + k));
    d.s5 += c;
    d.s1 = c + (rotate(d.s2, (uint)30) ^ rotate(d.s2, (uint)19) ^ rotate(d.s2, (uint)10)) + bitselect(d.s4, d.s2, d.s4 ^ d.s3);
  };
  {
    c = d.s0 + (rotate(d.s5, (uint)26) ^ rotate(d.s5, (uint)21) ^ rotate(d.s5, (uint)7)) + bitselect(d.s7, d.s6, d.s5) + (0x76F988DA + (l = (rotate(j, (uint)15) ^ rotate(j, (uint)13) ^ ((j) >> 10)) + e + (rotate(m, (uint)25) ^ rotate(m, (uint)14) ^ ((m) >> 3)) + l));
    d.s4 += c;
    d.s0 = c + (rotate(d.s1, (uint)30) ^ rotate(d.s1, (uint)19) ^ rotate(d.s1, (uint)10)) + bitselect(d.s3, d.s1, d.s3 ^ d.s2);
  };
  {
    c = d.s7 + (rotate(d.s4, (uint)26) ^ rotate(d.s4, (uint)21) ^ rotate(d.s4, (uint)7)) + bitselect(d.s6, d.s5, d.s4) + (0x983E5152 + (m = (rotate(k, (uint)15) ^ rotate(k, (uint)13) ^ ((k) >> 10)) + f + (rotate(n, (uint)25) ^ rotate(n, (uint)14) ^ ((n) >> 3)) + m));
    d.s3 += c;
    d.s7 = c + (rotate(d.s0, (uint)30) ^ rotate(d.s0, (uint)19) ^ rotate(d.s0, (uint)10)) + bitselect(d.s2, d.s0, d.s2 ^ d.s1);
  };
  {
    c = d.s6 + (rotate(d.s3, (uint)26) ^ rotate(d.s3, (uint)21) ^ rotate(d.s3, (uint)7)) + bitselect(d.s5, d.s4, d.s3) + (0xA831C66D + (n = (rotate(l, (uint)15) ^ rotate(l, (uint)13) ^ ((l) >> 10)) + g + (rotate(o, (uint)25) ^ rotate(o, (uint)14) ^ ((o) >> 3)) + n));
    d.s2 += c;
    d.s6 = c + (rotate(d.s7, (uint)30) ^ rotate(d.s7, (uint)19) ^ rotate(d.s7, (uint)10)) + bitselect(d.s1, d.s7, d.s1 ^ d.s0);
  };
  {
    c = d.s5 + (rotate(d.s2, (uint)26) ^ rotate(d.s2, (uint)21) ^ rotate(d.s2, (uint)7)) + bitselect(d.s4, d.s3, d.s2) + (0xB00327C8 + (o = (rotate(m, (uint)15) ^ rotate(m, (uint)13) ^ ((m) >> 10)) + h + (rotate(p, (uint)25) ^ rotate(p, (uint)14) ^ ((p) >> 3)) + o));
    d.s1 += c;
    d.s5 = c + (rotate(d.s6, (uint)30) ^ rotate(d.s6, (uint)19) ^ rotate(d.s6, (uint)10)) + bitselect(d.s0, d.s6, d.s0 ^ d.s7);
  };
  {
    c = d.s4 + (rotate(d.s1, (uint)26) ^ rotate(d.s1, (uint)21) ^ rotate(d.s1, (uint)7)) + bitselect(d.s3, d.s2, d.s1) + (0xBF597FC7 + (p = (rotate(n, (uint)15) ^ rotate(n, (uint)13) ^ ((n) >> 10)) + i + (rotate(q, (uint)25) ^ rotate(q, (uint)14) ^ ((q) >> 3)) + p));
    d.s0 += c;
    d.s4 = c + (rotate(d.s5, (uint)30) ^ rotate(d.s5, (uint)19) ^ rotate(d.s5, (uint)10)) + bitselect(d.s7, d.s5, d.s7 ^ d.s6);
  };
  {
    c = d.s3 + (rotate(d.s0, (uint)26) ^ rotate(d.s0, (uint)21) ^ rotate(d.s0, (uint)7)) + bitselect(d.s2, d.s1, d.s0) + (0xC6E00BF3 + (q = (rotate(o, (uint)15) ^ rotate(o, (uint)13) ^ ((o) >> 10)) + j + (rotate(r, (uint)25) ^ rotate(r, (uint)14) ^ ((r) >> 3)) + q));
    d.s7 += c;
    d.s3 = c + (rotate(d.s4, (uint)30) ^ rotate(d.s4, (uint)19) ^ rotate(d.s4, (uint)10)) + bitselect(d.s6, d.s4, d.s6 ^ d.s5);
  };
  {
    c = d.s2 + (rotate(d.s7, (uint)26) ^ rotate(d.s7, (uint)21) ^ rotate(d.s7, (uint)7)) + bitselect(d.s1, d.s0, d.s7) + (0xD5A79147 + (r = (rotate(p, (uint)15) ^ rotate(p, (uint)13) ^ ((p) >> 10)) + k + (rotate(s, (uint)25) ^ rotate(s, (uint)14) ^ ((s) >> 3)) + r));
    d.s6 += c;
    d.s2 = c + (rotate(d.s3, (uint)30) ^ rotate(d.s3, (uint)19) ^ rotate(d.s3, (uint)10)) + bitselect(d.s5, d.s3, d.s5 ^ d.s4);
  };
  {
    c = d.s1 + (rotate(d.s6, (uint)26) ^ rotate(d.s6, (uint)21) ^ rotate(d.s6, (uint)7)) + bitselect(d.s0, d.s7, d.s6) + (0x06CA6351 + (s = (rotate(q, (uint)15) ^ rotate(q, (uint)13) ^ ((q) >> 10)) + l + (rotate(t, (uint)25) ^ rotate(t, (uint)14) ^ ((t) >> 3)) + s));
    d.s5 += c;
    d.s1 = c + (rotate(d.s2, (uint)30) ^ rotate(d.s2, (uint)19) ^ rotate(d.s2, (uint)10)) + bitselect(d.s4, d.s2, d.s4 ^ d.s3);
  };
  {
    c = d.s0 + (rotate(d.s5, (uint)26) ^ rotate(d.s5, (uint)21) ^ rotate(d.s5, (uint)7)) + bitselect(d.s7, d.s6, d.s5) + (0x14292967 + (t = (rotate(r, (uint)15) ^ rotate(r, (uint)13) ^ ((r) >> 10)) + m + (rotate(e, (uint)25) ^ rotate(e, (uint)14) ^ ((e) >> 3)) + t));
    d.s4 += c;
    d.s0 = c + (rotate(d.s1, (uint)30) ^ rotate(d.s1, (uint)19) ^ rotate(d.s1, (uint)10)) + bitselect(d.s3, d.s1, d.s3 ^ d.s2);
  };

  {
    c = d.s7 + (rotate(d.s4, (uint)26) ^ rotate(d.s4, (uint)21) ^ rotate(d.s4, (uint)7)) + bitselect(d.s6, d.s5, d.s4) + (0x27B70A85 + (e = (rotate(s, (uint)15) ^ rotate(s, (uint)13) ^ ((s) >> 10)) + n + (rotate(f, (uint)25) ^ rotate(f, (uint)14) ^ ((f) >> 3)) + e));
    d.s3 += c;
    d.s7 = c + (rotate(d.s0, (uint)30) ^ rotate(d.s0, (uint)19) ^ rotate(d.s0, (uint)10)) + bitselect(d.s2, d.s0, d.s2 ^ d.s1);
  };
  {
    c = d.s6 + (rotate(d.s3, (uint)26) ^ rotate(d.s3, (uint)21) ^ rotate(d.s3, (uint)7)) + bitselect(d.s5, d.s4, d.s3) + (0x2E1B2138 + (f = (rotate(t, (uint)15) ^ rotate(t, (uint)13) ^ ((t) >> 10)) + o + (rotate(g, (uint)25) ^ rotate(g, (uint)14) ^ ((g) >> 3)) + f));
    d.s2 += c;
    d.s6 = c + (rotate(d.s7, (uint)30) ^ rotate(d.s7, (uint)19) ^ rotate(d.s7, (uint)10)) + bitselect(d.s1, d.s7, d.s1 ^ d.s0);
  };
  {
    c = d.s5 + (rotate(d.s2, (uint)26) ^ rotate(d.s2, (uint)21) ^ rotate(d.s2, (uint)7)) + bitselect(d.s4, d.s3, d.s2) + (0x4D2C6DFC + (g = (rotate(e, (uint)15) ^ rotate(e, (uint)13) ^ ((e) >> 10)) + p + (rotate(h, (uint)25) ^ rotate(h, (uint)14) ^ ((h) >> 3)) + g));
    d.s1 += c;
    d.s5 = c + (rotate(d.s6, (uint)30) ^ rotate(d.s6, (uint)19) ^ rotate(d.s6, (uint)10)) + bitselect(d.s0, d.s6, d.s0 ^ d.s7);
  };
  {
    c = d.s4 + (rotate(d.s1, (uint)26) ^ rotate(d.s1, (uint)21) ^ rotate(d.s1, (uint)7)) + bitselect(d.s3, d.s2, d.s1) + (0x53380D13 + (h = (rotate(f, (uint)15) ^ rotate(f, (uint)13) ^ ((f) >> 10)) + q + (rotate(i, (uint)25) ^ rotate(i, (uint)14) ^ ((i) >> 3)) + h));
    d.s0 += c;
    d.s4 = c + (rotate(d.s5, (uint)30) ^ rotate(d.s5, (uint)19) ^ rotate(d.s5, (uint)10)) + bitselect(d.s7, d.s5, d.s7 ^ d.s6);
  };
  {
    c = d.s3 + (rotate(d.s0, (uint)26) ^ rotate(d.s0, (uint)21) ^ rotate(d.s0, (uint)7)) + bitselect(d.s2, d.s1, d.s0) + (0x650A7354 + (i = (rotate(g, (uint)15) ^ rotate(g, (uint)13) ^ ((g) >> 10)) + r + (rotate(j, (uint)25) ^ rotate(j, (uint)14) ^ ((j) >> 3)) + i));
    d.s7 += c;
    d.s3 = c + (rotate(d.s4, (uint)30) ^ rotate(d.s4, (uint)19) ^ rotate(d.s4, (uint)10)) + bitselect(d.s6, d.s4, d.s6 ^ d.s5);
  };
  {
    c = d.s2 + (rotate(d.s7, (uint)26) ^ rotate(d.s7, (uint)21) ^ rotate(d.s7, (uint)7)) + bitselect(d.s1, d.s0, d.s7) + (0x766A0ABB + (j = (rotate(h, (uint)15) ^ rotate(h, (uint)13) ^ ((h) >> 10)) + s + (rotate(k, (uint)25) ^ rotate(k, (uint)14) ^ ((k) >> 3)) + j));
    d.s6 += c;
    d.s2 = c + (rotate(d.s3, (uint)30) ^ rotate(d.s3, (uint)19) ^ rotate(d.s3, (uint)10)) + bitselect(d.s5, d.s3, d.s5 ^ d.s4);
  };
  {
    c = d.s1 + (rotate(d.s6, (uint)26) ^ rotate(d.s6, (uint)21) ^ rotate(d.s6, (uint)7)) + bitselect(d.s0, d.s7, d.s6) + (0x81C2C92E + (k = (rotate(i, (uint)15) ^ rotate(i, (uint)13) ^ ((i) >> 10)) + t + (rotate(l, (uint)25) ^ rotate(l, (uint)14) ^ ((l) >> 3)) + k));
    d.s5 += c;
    d.s1 = c + (rotate(d.s2, (uint)30) ^ rotate(d.s2, (uint)19) ^ rotate(d.s2, (uint)10)) + bitselect(d.s4, d.s2, d.s4 ^ d.s3);
  };
  {
    c = d.s0 + (rotate(d.s5, (uint)26) ^ rotate(d.s5, (uint)21) ^ rotate(d.s5, (uint)7)) + bitselect(d.s7, d.s6, d.s5) + (0x92722C85 + (l = (rotate(j, (uint)15) ^ rotate(j, (uint)13) ^ ((j) >> 10)) + e + (rotate(m, (uint)25) ^ rotate(m, (uint)14) ^ ((m) >> 3)) + l));
    d.s4 += c;
    d.s0 = c + (rotate(d.s1, (uint)30) ^ rotate(d.s1, (uint)19) ^ rotate(d.s1, (uint)10)) + bitselect(d.s3, d.s1, d.s3 ^ d.s2);
  };
  {
    c = d.s7 + (rotate(d.s4, (uint)26) ^ rotate(d.s4, (uint)21) ^ rotate(d.s4, (uint)7)) + bitselect(d.s6, d.s5, d.s4) + (0xA2BFE8A1 + (m = (rotate(k, (uint)15) ^ rotate(k, (uint)13) ^ ((k) >> 10)) + f + (rotate(n, (uint)25) ^ rotate(n, (uint)14) ^ ((n) >> 3)) + m));
    d.s3 += c;
    d.s7 = c + (rotate(d.s0, (uint)30) ^ rotate(d.s0, (uint)19) ^ rotate(d.s0, (uint)10)) + bitselect(d.s2, d.s0, d.s2 ^ d.s1);
  };
  {
    c = d.s6 + (rotate(d.s3, (uint)26) ^ rotate(d.s3, (uint)21) ^ rotate(d.s3, (uint)7)) + bitselect(d.s5, d.s4, d.s3) + (0xA81A664B + (n = (rotate(l, (uint)15) ^ rotate(l, (uint)13) ^ ((l) >> 10)) + g + (rotate(o, (uint)25) ^ rotate(o, (uint)14) ^ ((o) >> 3)) + n));
    d.s2 += c;
    d.s6 = c + (rotate(d.s7, (uint)30) ^ rotate(d.s7, (uint)19) ^ rotate(d.s7, (uint)10)) + bitselect(d.s1, d.s7, d.s1 ^ d.s0);
  };
  {
    c = d.s5 + (rotate(d.s2, (uint)26) ^ rotate(d.s2, (uint)21) ^ rotate(d.s2, (uint)7)) + bitselect(d.s4, d.s3, d.s2) + (0xC24B8B70 + (o = (rotate(m, (uint)15) ^ rotate(m, (uint)13) ^ ((m) >> 10)) + h + (rotate(p, (uint)25) ^ rotate(p, (uint)14) ^ ((p) >> 3)) + o));
    d.s1 += c;
    d.s5 = c + (rotate(d.s6, (uint)30) ^ rotate(d.s6, (uint)19) ^ rotate(d.s6, (uint)10)) + bitselect(d.s0, d.s6, d.s0 ^ d.s7);
  };
  {
    c = d.s4 + (rotate(d.s1, (uint)26) ^ rotate(d.s1, (uint)21) ^ rotate(d.s1, (uint)7)) + bitselect(d.s3, d.s2, d.s1) + (0xC76C51A3 + (p = (rotate(n, (uint)15) ^ rotate(n, (uint)13) ^ ((n) >> 10)) + i + (rotate(q, (uint)25) ^ rotate(q, (uint)14) ^ ((q) >> 3)) + p));
    d.s0 += c;
    d.s4 = c + (rotate(d.s5, (uint)30) ^ rotate(d.s5, (uint)19) ^ rotate(d.s5, (uint)10)) + bitselect(d.s7, d.s5, d.s7 ^ d.s6);
  };
  {
    c = d.s3 + (rotate(d.s0, (uint)26) ^ rotate(d.s0, (uint)21) ^ rotate(d.s0, (uint)7)) + bitselect(d.s2, d.s1, d.s0) + (0xD192E819 + (q = (rotate(o, (uint)15) ^ rotate(o, (uint)13) ^ ((o) >> 10)) + j + (rotate(r, (uint)25) ^ rotate(r, (uint)14) ^ ((r) >> 3)) + q));
    d.s7 += c;
    d.s3 = c + (rotate(d.s4, (uint)30) ^ rotate(d.s4, (uint)19) ^ rotate(d.s4, (uint)10)) + bitselect(d.s6, d.s4, d.s6 ^ d.s5);
  };
  {
    c = d.s2 + (rotate(d.s7, (uint)26) ^ rotate(d.s7, (uint)21) ^ rotate(d.s7, (uint)7)) + bitselect(d.s1, d.s0, d.s7) + (0xD6990624 + (r = (rotate(p, (uint)15) ^ rotate(p, (uint)13) ^ ((p) >> 10)) + k + (rotate(s, (uint)25) ^ rotate(s, (uint)14) ^ ((s) >> 3)) + r));
    d.s6 += c;
    d.s2 = c + (rotate(d.s3, (uint)30) ^ rotate(d.s3, (uint)19) ^ rotate(d.s3, (uint)10)) + bitselect(d.s5, d.s3, d.s5 ^ d.s4);
  };
  {
    c = d.s1 + (rotate(d.s6, (uint)26) ^ rotate(d.s6, (uint)21) ^ rotate(d.s6, (uint)7)) + bitselect(d.s0, d.s7, d.s6) + (0xF40E3585 + (s = (rotate(q, (uint)15) ^ rotate(q, (uint)13) ^ ((q) >> 10)) + l + (rotate(t, (uint)25) ^ rotate(t, (uint)14) ^ ((t) >> 3)) + s));
    d.s5 += c;
    d.s1 = c + (rotate(d.s2, (uint)30) ^ rotate(d.s2, (uint)19) ^ rotate(d.s2, (uint)10)) + bitselect(d.s4, d.s2, d.s4 ^ d.s3);
  };
  {
    c = d.s0 + (rotate(d.s5, (uint)26) ^ rotate(d.s5, (uint)21) ^ rotate(d.s5, (uint)7)) + bitselect(d.s7, d.s6, d.s5) + (0x106AA070 + (t = (rotate(r, (uint)15) ^ rotate(r, (uint)13) ^ ((r) >> 10)) + m + (rotate(e, (uint)25) ^ rotate(e, (uint)14) ^ ((e) >> 3)) + t));
    d.s4 += c;
    d.s0 = c + (rotate(d.s1, (uint)30) ^ rotate(d.s1, (uint)19) ^ rotate(d.s1, (uint)10)) + bitselect(d.s3, d.s1, d.s3 ^ d.s2);
  };

  {
    c = d.s7 + (rotate(d.s4, (uint)26) ^ rotate(d.s4, (uint)21) ^ rotate(d.s4, (uint)7)) + bitselect(d.s6, d.s5, d.s4) + (0x19A4C116 + (e = (rotate(s, (uint)15) ^ rotate(s, (uint)13) ^ ((s) >> 10)) + n + (rotate(f, (uint)25) ^ rotate(f, (uint)14) ^ ((f) >> 3)) + e));
    d.s3 += c;
    d.s7 = c + (rotate(d.s0, (uint)30) ^ rotate(d.s0, (uint)19) ^ rotate(d.s0, (uint)10)) + bitselect(d.s2, d.s0, d.s2 ^ d.s1);
  };
  {
    c = d.s6 + (rotate(d.s3, (uint)26) ^ rotate(d.s3, (uint)21) ^ rotate(d.s3, (uint)7)) + bitselect(d.s5, d.s4, d.s3) + (0x1E376C08 + (f = (rotate(t, (uint)15) ^ rotate(t, (uint)13) ^ ((t) >> 10)) + o + (rotate(g, (uint)25) ^ rotate(g, (uint)14) ^ ((g) >> 3)) + f));
    d.s2 += c;
    d.s6 = c + (rotate(d.s7, (uint)30) ^ rotate(d.s7, (uint)19) ^ rotate(d.s7, (uint)10)) + bitselect(d.s1, d.s7, d.s1 ^ d.s0);
  };
  {
    c = d.s5 + (rotate(d.s2, (uint)26) ^ rotate(d.s2, (uint)21) ^ rotate(d.s2, (uint)7)) + bitselect(d.s4, d.s3, d.s2) + (0x2748774C + (g = (rotate(e, (uint)15) ^ rotate(e, (uint)13) ^ ((e) >> 10)) + p + (rotate(h, (uint)25) ^ rotate(h, (uint)14) ^ ((h) >> 3)) + g));
    d.s1 += c;
    d.s5 = c + (rotate(d.s6, (uint)30) ^ rotate(d.s6, (uint)19) ^ rotate(d.s6, (uint)10)) + bitselect(d.s0, d.s6, d.s0 ^ d.s7);
  };
  {
    c = d.s4 + (rotate(d.s1, (uint)26) ^ rotate(d.s1, (uint)21) ^ rotate(d.s1, (uint)7)) + bitselect(d.s3, d.s2, d.s1) + (0x34B0BCB5 + (h = (rotate(f, (uint)15) ^ rotate(f, (uint)13) ^ ((f) >> 10)) + q + (rotate(i, (uint)25) ^ rotate(i, (uint)14) ^ ((i) >> 3)) + h));
    d.s0 += c;
    d.s4 = c + (rotate(d.s5, (uint)30) ^ rotate(d.s5, (uint)19) ^ rotate(d.s5, (uint)10)) + bitselect(d.s7, d.s5, d.s7 ^ d.s6);
  };
  {
    c = d.s3 + (rotate(d.s0, (uint)26) ^ rotate(d.s0, (uint)21) ^ rotate(d.s0, (uint)7)) + bitselect(d.s2, d.s1, d.s0) + (0x391C0CB3 + (i = (rotate(g, (uint)15) ^ rotate(g, (uint)13) ^ ((g) >> 10)) + r + (rotate(j, (uint)25) ^ rotate(j, (uint)14) ^ ((j) >> 3)) + i));
    d.s7 += c;
    d.s3 = c + (rotate(d.s4, (uint)30) ^ rotate(d.s4, (uint)19) ^ rotate(d.s4, (uint)10)) + bitselect(d.s6, d.s4, d.s6 ^ d.s5);
  };
  {
    c = d.s2 + (rotate(d.s7, (uint)26) ^ rotate(d.s7, (uint)21) ^ rotate(d.s7, (uint)7)) + bitselect(d.s1, d.s0, d.s7) + (0x4ED8AA4A + (j = (rotate(h, (uint)15) ^ rotate(h, (uint)13) ^ ((h) >> 10)) + s + (rotate(k, (uint)25) ^ rotate(k, (uint)14) ^ ((k) >> 3)) + j));
    d.s6 += c;
    d.s2 = c + (rotate(d.s3, (uint)30) ^ rotate(d.s3, (uint)19) ^ rotate(d.s3, (uint)10)) + bitselect(d.s5, d.s3, d.s5 ^ d.s4);
  };
  {
    c = d.s1 + (rotate(d.s6, (uint)26) ^ rotate(d.s6, (uint)21) ^ rotate(d.s6, (uint)7)) + bitselect(d.s0, d.s7, d.s6) + (0x5B9CCA4F + (k = (rotate(i, (uint)15) ^ rotate(i, (uint)13) ^ ((i) >> 10)) + t + (rotate(l, (uint)25) ^ rotate(l, (uint)14) ^ ((l) >> 3)) + k));
    d.s5 += c;
    d.s1 = c + (rotate(d.s2, (uint)30) ^ rotate(d.s2, (uint)19) ^ rotate(d.s2, (uint)10)) + bitselect(d.s4, d.s2, d.s4 ^ d.s3);
  };
  {
    c = d.s0 + (rotate(d.s5, (uint)26) ^ rotate(d.s5, (uint)21) ^ rotate(d.s5, (uint)7)) + bitselect(d.s7, d.s6, d.s5) + (0x682E6FF3 + (l = (rotate(j, (uint)15) ^ rotate(j, (uint)13) ^ ((j) >> 10)) + e + (rotate(m, (uint)25) ^ rotate(m, (uint)14) ^ ((m) >> 3)) + l));
    d.s4 += c;
    d.s0 = c + (rotate(d.s1, (uint)30) ^ rotate(d.s1, (uint)19) ^ rotate(d.s1, (uint)10)) + bitselect(d.s3, d.s1, d.s3 ^ d.s2);
  };
  {
    c = d.s7 + (rotate(d.s4, (uint)26) ^ rotate(d.s4, (uint)21) ^ rotate(d.s4, (uint)7)) + bitselect(d.s6, d.s5, d.s4) + (0x748F82EE + (m = (rotate(k, (uint)15) ^ rotate(k, (uint)13) ^ ((k) >> 10)) + f + (rotate(n, (uint)25) ^ rotate(n, (uint)14) ^ ((n) >> 3)) + m));
    d.s3 += c;
    d.s7 = c + (rotate(d.s0, (uint)30) ^ rotate(d.s0, (uint)19) ^ rotate(d.s0, (uint)10)) + bitselect(d.s2, d.s0, d.s2 ^ d.s1);
  };
  {
    c = d.s6 + (rotate(d.s3, (uint)26) ^ rotate(d.s3, (uint)21) ^ rotate(d.s3, (uint)7)) + bitselect(d.s5, d.s4, d.s3) + (0x78A5636F + (n = (rotate(l, (uint)15) ^ rotate(l, (uint)13) ^ ((l) >> 10)) + g + (rotate(o, (uint)25) ^ rotate(o, (uint)14) ^ ((o) >> 3)) + n));
    d.s2 += c;
    d.s6 = c + (rotate(d.s7, (uint)30) ^ rotate(d.s7, (uint)19) ^ rotate(d.s7, (uint)10)) + bitselect(d.s1, d.s7, d.s1 ^ d.s0);
  };
  {
    c = d.s5 + (rotate(d.s2, (uint)26) ^ rotate(d.s2, (uint)21) ^ rotate(d.s2, (uint)7)) + bitselect(d.s4, d.s3, d.s2) + (0x84C87814 + (o = (rotate(m, (uint)15) ^ rotate(m, (uint)13) ^ ((m) >> 10)) + h + (rotate(p, (uint)25) ^ rotate(p, (uint)14) ^ ((p) >> 3)) + o));
    d.s1 += c;
    d.s5 = c + (rotate(d.s6, (uint)30) ^ rotate(d.s6, (uint)19) ^ rotate(d.s6, (uint)10)) + bitselect(d.s0, d.s6, d.s0 ^ d.s7);
  };
  {
    c = d.s4 + (rotate(d.s1, (uint)26) ^ rotate(d.s1, (uint)21) ^ rotate(d.s1, (uint)7)) + bitselect(d.s3, d.s2, d.s1) + (0x8CC70208 + (p = (rotate(n, (uint)15) ^ rotate(n, (uint)13) ^ ((n) >> 10)) + i + (rotate(q, (uint)25) ^ rotate(q, (uint)14) ^ ((q) >> 3)) + p));
    d.s0 += c;
    d.s4 = c + (rotate(d.s5, (uint)30) ^ rotate(d.s5, (uint)19) ^ rotate(d.s5, (uint)10)) + bitselect(d.s7, d.s5, d.s7 ^ d.s6);
  };
  {
    c = d.s3 + (rotate(d.s0, (uint)26) ^ rotate(d.s0, (uint)21) ^ rotate(d.s0, (uint)7)) + bitselect(d.s2, d.s1, d.s0) + (0x90BEFFFA + (q = (rotate(o, (uint)15) ^ rotate(o, (uint)13) ^ ((o) >> 10)) + j + (rotate(r, (uint)25) ^ rotate(r, (uint)14) ^ ((r) >> 3)) + q));
    d.s7 += c;
    d.s3 = c + (rotate(d.s4, (uint)30) ^ rotate(d.s4, (uint)19) ^ rotate(d.s4, (uint)10)) + bitselect(d.s6, d.s4, d.s6 ^ d.s5);
  };
  {
    c = d.s2 + (rotate(d.s7, (uint)26) ^ rotate(d.s7, (uint)21) ^ rotate(d.s7, (uint)7)) + bitselect(d.s1, d.s0, d.s7) + (0xA4506CEB + (r = (rotate(p, (uint)15) ^ rotate(p, (uint)13) ^ ((p) >> 10)) + k + (rotate(s, (uint)25) ^ rotate(s, (uint)14) ^ ((s) >> 3)) + r));
    d.s6 += c;
    d.s2 = c + (rotate(d.s3, (uint)30) ^ rotate(d.s3, (uint)19) ^ rotate(d.s3, (uint)10)) + bitselect(d.s5, d.s3, d.s5 ^ d.s4);
  };
  {
    c = d.s1 + (rotate(d.s6, (uint)26) ^ rotate(d.s6, (uint)21) ^ rotate(d.s6, (uint)7)) + bitselect(d.s0, d.s7, d.s6) + (0xBEF9A3F7 + ((rotate(q, (uint)15) ^ rotate(q, (uint)13) ^ ((q) >> 10)) + l + (rotate(t, (uint)25) ^ rotate(t, (uint)14) ^ ((t) >> 3)) + s));
    d.s5 += c;
    d.s1 = c + (rotate(d.s2, (uint)30) ^ rotate(d.s2, (uint)19) ^ rotate(d.s2, (uint)10)) + bitselect(d.s4, d.s2, d.s4 ^ d.s3);
  };
  {
    c = d.s0 + (rotate(d.s5, (uint)26) ^ rotate(d.s5, (uint)21) ^ rotate(d.s5, (uint)7)) + bitselect(d.s7, d.s6, d.s5) + (0xC67178F2 + ((rotate(r, (uint)15) ^ rotate(r, (uint)13) ^ ((r) >> 10)) + m + (rotate(e, (uint)25) ^ rotate(e, (uint)14) ^ ((e) >> 3)) + t));
    d.s4 += c;
    d.s0 = c + (rotate(d.s1, (uint)30) ^ rotate(d.s1, (uint)19) ^ rotate(d.s1, (uint)10)) + bitselect(d.s3, d.s1, d.s3 ^ d.s2);
  };
  return (d + b);
}

__constant uint8 Ga = {0x6A09E667, 0xBB67AE85, 0x3C6EF372, 0xA54FF53A, 0x510E527F, 0x9B05688C, 0x1F83D9AB, 0x5BE0CD19};

__constant uint16 Gb = {0x00000000, 0x00000000, 0x80000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000640};

__constant uint8 Gc = {0x80000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000100};

__attribute__((reqd_work_group_size(128, 1, 1))) __kernel void B(__global const uchar* restrict a, __global uint* restrict b, const ulong c, uint8 d) {
  uint e = get_global_id(0);
  uint16 f;
  uint8 g;
  f = Gb;
  f.s0 = ((__global const uint*)a)[48];
  f.s1 = e;
  g = A(f, d);
  f.lo = g;
  f.hi = Gc;
  g = A(f, Ga);

  if (__builtin_astype(g.s10, ulong) <= c) {
    b[atomic_add(b + 0xFF, 1)] = (__builtin_astype(__builtin_astype(e, uchar4).wzyx, uint));
  }
}
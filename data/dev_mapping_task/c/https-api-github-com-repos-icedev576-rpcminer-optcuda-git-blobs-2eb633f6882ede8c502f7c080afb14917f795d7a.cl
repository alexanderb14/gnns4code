__constant uint Ga = 0xFFFFFFFF; typedef struct {
  uint m_AH[8];
  uint m_merkle;
  uint m_ntime;
  uint m_nbits;
  uint m_nonce;
} opencl_in;

typedef struct { uint m_bestnonce; } opencl_out;

__kernel __attribute__((vec_type_hint(uint))) __attribute__((reqd_work_group_size(256, 1, 1))) void A(__global opencl_in* a, __global opencl_out* b, const uint c, const uint d) {
  uint e[64];
  uint f, g, h, i, j, k, l, m;
  const uint n = get_global_id(0);
  const uint o = a->m_nonce + (n << d);
  uint p, q;
  uint r = 0;

  uint s, t, u, v, w, x, y, z;
  s = a->m_AH[0];
  t = a->m_AH[1];
  u = a->m_AH[2];
  v = a->m_AH[3];
  w = a->m_AH[4];
  x = a->m_AH[5];
  y = a->m_AH[6];
  z = a->m_AH[7];
  {
    p = z + ((rotate(w, (uint)(32 - 6))) ^ (rotate(w, (uint)(32 - 11))) ^ (rotate(w, (uint)(32 - 25)))) + (y ^ (w & (x ^ y))) + 0x428A2F98 + a->m_merkle;
    q = ((rotate(s, (uint)(32 - 2))) ^ (rotate(s, (uint)(32 - 13))) ^ (rotate(s, (uint)(32 - 22)))) + ((s & t) | (u & (s | t)));
    v += p;
    z = p + q;
  };
  {
    p = y + ((rotate(v, (uint)(32 - 6))) ^ (rotate(v, (uint)(32 - 11))) ^ (rotate(v, (uint)(32 - 25)))) + (x ^ (v & (w ^ x))) + 0x71374491 + a->m_ntime;
    q = ((rotate(z, (uint)(32 - 2))) ^ (rotate(z, (uint)(32 - 13))) ^ (rotate(z, (uint)(32 - 22)))) + ((z & s) | (t & (z | s)));
    u += p;
    y = p + q;
  };
  {
    p = x + ((rotate(u, (uint)(32 - 6))) ^ (rotate(u, (uint)(32 - 11))) ^ (rotate(u, (uint)(32 - 25)))) + (w ^ (u & (v ^ w))) + 0xB5C0FBCF + a->m_nbits;
    q = ((rotate(y, (uint)(32 - 2))) ^ (rotate(y, (uint)(32 - 13))) ^ (rotate(y, (uint)(32 - 22)))) + ((y & z) | (s & (y | z)));
    t += p;
    x = p + q;
  };

  for (uint aa = 0; aa < c; aa++) {
    f = s;
    g = t;
    h = u;
    i = v;
    j = w;
    k = x;
    l = y;
    m = z;

    e[0] = a->m_merkle;
    e[1] = a->m_ntime;
    e[2] = a->m_nbits;
    e[3] = o + aa;
    e[4] = 0x80000000;
    e[5] = 0x00000000;
    e[6] = 0x00000000;
    e[7] = 0x00000000;
    e[8] = 0x00000000;
    e[9] = 0x00000000;
    e[10] = 0x00000000;
    e[11] = 0x00000000;
    e[12] = 0x00000000;
    e[13] = 0x00000000;
    e[14] = 0x00000000;
    e[15] = 0x00000280;

    {
      p = j + ((rotate(g, (uint)(32 - 6))) ^ (rotate(g, (uint)(32 - 11))) ^ (rotate(g, (uint)(32 - 25)))) + (i ^ (g & (h ^ i))) + 0xE9B5DBA5 + e[3];
      q = ((rotate(k, (uint)(32 - 2))) ^ (rotate(k, (uint)(32 - 13))) ^ (rotate(k, (uint)(32 - 22)))) + ((k & l) | (m & (k | l)));
      f += p;
      j = p + q;
    };
    {
      p = i + ((rotate(f, (uint)(32 - 6))) ^ (rotate(f, (uint)(32 - 11))) ^ (rotate(f, (uint)(32 - 25)))) + (h ^ (f & (g ^ h))) + 0x3956C25B + e[4];
      q = ((rotate(j, (uint)(32 - 2))) ^ (rotate(j, (uint)(32 - 13))) ^ (rotate(j, (uint)(32 - 22)))) + ((j & k) | (l & (j | k)));
      m += p;
      i = p + q;
    };
    {
      p = h + ((rotate(m, (uint)(32 - 6))) ^ (rotate(m, (uint)(32 - 11))) ^ (rotate(m, (uint)(32 - 25)))) + (g ^ (m & (f ^ g))) + 0x59F111F1 + e[5];
      q = ((rotate(i, (uint)(32 - 2))) ^ (rotate(i, (uint)(32 - 13))) ^ (rotate(i, (uint)(32 - 22)))) + ((i & j) | (k & (i | j)));
      l += p;
      h = p + q;
    };
    {
      p = g + ((rotate(l, (uint)(32 - 6))) ^ (rotate(l, (uint)(32 - 11))) ^ (rotate(l, (uint)(32 - 25)))) + (f ^ (l & (m ^ f))) + 0x923F82A4 + e[6];
      q = ((rotate(h, (uint)(32 - 2))) ^ (rotate(h, (uint)(32 - 13))) ^ (rotate(h, (uint)(32 - 22)))) + ((h & i) | (j & (h | i)));
      k += p;
      g = p + q;
    };
    {
      p = f + ((rotate(k, (uint)(32 - 6))) ^ (rotate(k, (uint)(32 - 11))) ^ (rotate(k, (uint)(32 - 25)))) + (m ^ (k & (l ^ m))) + 0xAB1C5ED5 + e[7];
      q = ((rotate(g, (uint)(32 - 2))) ^ (rotate(g, (uint)(32 - 13))) ^ (rotate(g, (uint)(32 - 22)))) + ((g & h) | (i & (g | h)));
      j += p;
      f = p + q;
    };
    {
      p = m + ((rotate(j, (uint)(32 - 6))) ^ (rotate(j, (uint)(32 - 11))) ^ (rotate(j, (uint)(32 - 25)))) + (l ^ (j & (k ^ l))) + 0xD807AA98 + e[8];
      q = ((rotate(f, (uint)(32 - 2))) ^ (rotate(f, (uint)(32 - 13))) ^ (rotate(f, (uint)(32 - 22)))) + ((f & g) | (h & (f | g)));
      i += p;
      m = p + q;
    };
    {
      p = l + ((rotate(i, (uint)(32 - 6))) ^ (rotate(i, (uint)(32 - 11))) ^ (rotate(i, (uint)(32 - 25)))) + (k ^ (i & (j ^ k))) + 0x12835B01 + e[9];
      q = ((rotate(m, (uint)(32 - 2))) ^ (rotate(m, (uint)(32 - 13))) ^ (rotate(m, (uint)(32 - 22)))) + ((m & f) | (g & (m | f)));
      h += p;
      l = p + q;
    };
    {
      p = k + ((rotate(h, (uint)(32 - 6))) ^ (rotate(h, (uint)(32 - 11))) ^ (rotate(h, (uint)(32 - 25)))) + (j ^ (h & (i ^ j))) + 0x243185BE + e[10];
      q = ((rotate(l, (uint)(32 - 2))) ^ (rotate(l, (uint)(32 - 13))) ^ (rotate(l, (uint)(32 - 22)))) + ((l & m) | (f & (l | m)));
      g += p;
      k = p + q;
    };
    {
      p = j + ((rotate(g, (uint)(32 - 6))) ^ (rotate(g, (uint)(32 - 11))) ^ (rotate(g, (uint)(32 - 25)))) + (i ^ (g & (h ^ i))) + 0x550C7DC3 + e[11];
      q = ((rotate(k, (uint)(32 - 2))) ^ (rotate(k, (uint)(32 - 13))) ^ (rotate(k, (uint)(32 - 22)))) + ((k & l) | (m & (k | l)));
      f += p;
      j = p + q;
    };
    {
      p = i + ((rotate(f, (uint)(32 - 6))) ^ (rotate(f, (uint)(32 - 11))) ^ (rotate(f, (uint)(32 - 25)))) + (h ^ (f & (g ^ h))) + 0x72BE5D74 + e[12];
      q = ((rotate(j, (uint)(32 - 2))) ^ (rotate(j, (uint)(32 - 13))) ^ (rotate(j, (uint)(32 - 22)))) + ((j & k) | (l & (j | k)));
      m += p;
      i = p + q;
    };
    {
      p = h + ((rotate(m, (uint)(32 - 6))) ^ (rotate(m, (uint)(32 - 11))) ^ (rotate(m, (uint)(32 - 25)))) + (g ^ (m & (f ^ g))) + 0x80DEB1FE + e[13];
      q = ((rotate(i, (uint)(32 - 2))) ^ (rotate(i, (uint)(32 - 13))) ^ (rotate(i, (uint)(32 - 22)))) + ((i & j) | (k & (i | j)));
      l += p;
      h = p + q;
    };
    {
      p = g + ((rotate(l, (uint)(32 - 6))) ^ (rotate(l, (uint)(32 - 11))) ^ (rotate(l, (uint)(32 - 25)))) + (f ^ (l & (m ^ f))) + 0x9BDC06A7 + e[14];
      q = ((rotate(h, (uint)(32 - 2))) ^ (rotate(h, (uint)(32 - 13))) ^ (rotate(h, (uint)(32 - 22)))) + ((h & i) | (j & (h | i)));
      k += p;
      g = p + q;
    };
    {
      p = f + ((rotate(k, (uint)(32 - 6))) ^ (rotate(k, (uint)(32 - 11))) ^ (rotate(k, (uint)(32 - 25)))) + (m ^ (k & (l ^ m))) + 0xC19BF174 + e[15];
      q = ((rotate(g, (uint)(32 - 2))) ^ (rotate(g, (uint)(32 - 13))) ^ (rotate(g, (uint)(32 - 22)))) + ((g & h) | (i & (g | h)));
      j += p;
      f = p + q;
    };
    {
      p = m + ((rotate(j, (uint)(32 - 6))) ^ (rotate(j, (uint)(32 - 11))) ^ (rotate(j, (uint)(32 - 25)))) + (l ^ (j & (k ^ l))) + 0xE49B69C1 + (e[16] = ((rotate(e[16 - 2], (uint)(32 - 17))) ^ (rotate(e[16 - 2], (uint)(32 - 19))) ^ ((e[16 - 2] & Ga) >> 10)) + e[16 - 7] + ((rotate(e[16 - 15], (uint)(32 - 7))) ^ (rotate(e[16 - 15], (uint)(32 - 18))) ^ ((e[16 - 15] & Ga) >> 3)) + e[16 - 16]);
      q = ((rotate(f, (uint)(32 - 2))) ^ (rotate(f, (uint)(32 - 13))) ^ (rotate(f, (uint)(32 - 22)))) + ((f & g) | (h & (f | g)));
      i += p;
      m = p + q;
    };
    {
      p = l + ((rotate(i, (uint)(32 - 6))) ^ (rotate(i, (uint)(32 - 11))) ^ (rotate(i, (uint)(32 - 25)))) + (k ^ (i & (j ^ k))) + 0xEFBE4786 + (e[17] = ((rotate(e[17 - 2], (uint)(32 - 17))) ^ (rotate(e[17 - 2], (uint)(32 - 19))) ^ ((e[17 - 2] & Ga) >> 10)) + e[17 - 7] + ((rotate(e[17 - 15], (uint)(32 - 7))) ^ (rotate(e[17 - 15], (uint)(32 - 18))) ^ ((e[17 - 15] & Ga) >> 3)) + e[17 - 16]);
      q = ((rotate(m, (uint)(32 - 2))) ^ (rotate(m, (uint)(32 - 13))) ^ (rotate(m, (uint)(32 - 22)))) + ((m & f) | (g & (m | f)));
      h += p;
      l = p + q;
    };
    {
      p = k + ((rotate(h, (uint)(32 - 6))) ^ (rotate(h, (uint)(32 - 11))) ^ (rotate(h, (uint)(32 - 25)))) + (j ^ (h & (i ^ j))) + 0x0FC19DC6 + (e[18] = ((rotate(e[18 - 2], (uint)(32 - 17))) ^ (rotate(e[18 - 2], (uint)(32 - 19))) ^ ((e[18 - 2] & Ga) >> 10)) + e[18 - 7] + ((rotate(e[18 - 15], (uint)(32 - 7))) ^ (rotate(e[18 - 15], (uint)(32 - 18))) ^ ((e[18 - 15] & Ga) >> 3)) + e[18 - 16]);
      q = ((rotate(l, (uint)(32 - 2))) ^ (rotate(l, (uint)(32 - 13))) ^ (rotate(l, (uint)(32 - 22)))) + ((l & m) | (f & (l | m)));
      g += p;
      k = p + q;
    };
    {
      p = j + ((rotate(g, (uint)(32 - 6))) ^ (rotate(g, (uint)(32 - 11))) ^ (rotate(g, (uint)(32 - 25)))) + (i ^ (g & (h ^ i))) + 0x240CA1CC + (e[19] = ((rotate(e[19 - 2], (uint)(32 - 17))) ^ (rotate(e[19 - 2], (uint)(32 - 19))) ^ ((e[19 - 2] & Ga) >> 10)) + e[19 - 7] + ((rotate(e[19 - 15], (uint)(32 - 7))) ^ (rotate(e[19 - 15], (uint)(32 - 18))) ^ ((e[19 - 15] & Ga) >> 3)) + e[19 - 16]);
      q = ((rotate(k, (uint)(32 - 2))) ^ (rotate(k, (uint)(32 - 13))) ^ (rotate(k, (uint)(32 - 22)))) + ((k & l) | (m & (k | l)));
      f += p;
      j = p + q;
    };
    {
      p = i + ((rotate(f, (uint)(32 - 6))) ^ (rotate(f, (uint)(32 - 11))) ^ (rotate(f, (uint)(32 - 25)))) + (h ^ (f & (g ^ h))) + 0x2DE92C6F + (e[20] = ((rotate(e[20 - 2], (uint)(32 - 17))) ^ (rotate(e[20 - 2], (uint)(32 - 19))) ^ ((e[20 - 2] & Ga) >> 10)) + e[20 - 7] + ((rotate(e[20 - 15], (uint)(32 - 7))) ^ (rotate(e[20 - 15], (uint)(32 - 18))) ^ ((e[20 - 15] & Ga) >> 3)) + e[20 - 16]);
      q = ((rotate(j, (uint)(32 - 2))) ^ (rotate(j, (uint)(32 - 13))) ^ (rotate(j, (uint)(32 - 22)))) + ((j & k) | (l & (j | k)));
      m += p;
      i = p + q;
    };
    {
      p = h + ((rotate(m, (uint)(32 - 6))) ^ (rotate(m, (uint)(32 - 11))) ^ (rotate(m, (uint)(32 - 25)))) + (g ^ (m & (f ^ g))) + 0x4A7484AA + (e[21] = ((rotate(e[21 - 2], (uint)(32 - 17))) ^ (rotate(e[21 - 2], (uint)(32 - 19))) ^ ((e[21 - 2] & Ga) >> 10)) + e[21 - 7] + ((rotate(e[21 - 15], (uint)(32 - 7))) ^ (rotate(e[21 - 15], (uint)(32 - 18))) ^ ((e[21 - 15] & Ga) >> 3)) + e[21 - 16]);
      q = ((rotate(i, (uint)(32 - 2))) ^ (rotate(i, (uint)(32 - 13))) ^ (rotate(i, (uint)(32 - 22)))) + ((i & j) | (k & (i | j)));
      l += p;
      h = p + q;
    };
    {
      p = g + ((rotate(l, (uint)(32 - 6))) ^ (rotate(l, (uint)(32 - 11))) ^ (rotate(l, (uint)(32 - 25)))) + (f ^ (l & (m ^ f))) + 0x5CB0A9DC + (e[22] = ((rotate(e[22 - 2], (uint)(32 - 17))) ^ (rotate(e[22 - 2], (uint)(32 - 19))) ^ ((e[22 - 2] & Ga) >> 10)) + e[22 - 7] + ((rotate(e[22 - 15], (uint)(32 - 7))) ^ (rotate(e[22 - 15], (uint)(32 - 18))) ^ ((e[22 - 15] & Ga) >> 3)) + e[22 - 16]);
      q = ((rotate(h, (uint)(32 - 2))) ^ (rotate(h, (uint)(32 - 13))) ^ (rotate(h, (uint)(32 - 22)))) + ((h & i) | (j & (h | i)));
      k += p;
      g = p + q;
    };
    {
      p = f + ((rotate(k, (uint)(32 - 6))) ^ (rotate(k, (uint)(32 - 11))) ^ (rotate(k, (uint)(32 - 25)))) + (m ^ (k & (l ^ m))) + 0x76F988DA + (e[23] = ((rotate(e[23 - 2], (uint)(32 - 17))) ^ (rotate(e[23 - 2], (uint)(32 - 19))) ^ ((e[23 - 2] & Ga) >> 10)) + e[23 - 7] + ((rotate(e[23 - 15], (uint)(32 - 7))) ^ (rotate(e[23 - 15], (uint)(32 - 18))) ^ ((e[23 - 15] & Ga) >> 3)) + e[23 - 16]);
      q = ((rotate(g, (uint)(32 - 2))) ^ (rotate(g, (uint)(32 - 13))) ^ (rotate(g, (uint)(32 - 22)))) + ((g & h) | (i & (g | h)));
      j += p;
      f = p + q;
    };
    {
      p = m + ((rotate(j, (uint)(32 - 6))) ^ (rotate(j, (uint)(32 - 11))) ^ (rotate(j, (uint)(32 - 25)))) + (l ^ (j & (k ^ l))) + 0x983E5152 + (e[24] = ((rotate(e[24 - 2], (uint)(32 - 17))) ^ (rotate(e[24 - 2], (uint)(32 - 19))) ^ ((e[24 - 2] & Ga) >> 10)) + e[24 - 7] + ((rotate(e[24 - 15], (uint)(32 - 7))) ^ (rotate(e[24 - 15], (uint)(32 - 18))) ^ ((e[24 - 15] & Ga) >> 3)) + e[24 - 16]);
      q = ((rotate(f, (uint)(32 - 2))) ^ (rotate(f, (uint)(32 - 13))) ^ (rotate(f, (uint)(32 - 22)))) + ((f & g) | (h & (f | g)));
      i += p;
      m = p + q;
    };
    {
      p = l + ((rotate(i, (uint)(32 - 6))) ^ (rotate(i, (uint)(32 - 11))) ^ (rotate(i, (uint)(32 - 25)))) + (k ^ (i & (j ^ k))) + 0xA831C66D + (e[25] = ((rotate(e[25 - 2], (uint)(32 - 17))) ^ (rotate(e[25 - 2], (uint)(32 - 19))) ^ ((e[25 - 2] & Ga) >> 10)) + e[25 - 7] + ((rotate(e[25 - 15], (uint)(32 - 7))) ^ (rotate(e[25 - 15], (uint)(32 - 18))) ^ ((e[25 - 15] & Ga) >> 3)) + e[25 - 16]);
      q = ((rotate(m, (uint)(32 - 2))) ^ (rotate(m, (uint)(32 - 13))) ^ (rotate(m, (uint)(32 - 22)))) + ((m & f) | (g & (m | f)));
      h += p;
      l = p + q;
    };
    {
      p = k + ((rotate(h, (uint)(32 - 6))) ^ (rotate(h, (uint)(32 - 11))) ^ (rotate(h, (uint)(32 - 25)))) + (j ^ (h & (i ^ j))) + 0xB00327C8 + (e[26] = ((rotate(e[26 - 2], (uint)(32 - 17))) ^ (rotate(e[26 - 2], (uint)(32 - 19))) ^ ((e[26 - 2] & Ga) >> 10)) + e[26 - 7] + ((rotate(e[26 - 15], (uint)(32 - 7))) ^ (rotate(e[26 - 15], (uint)(32 - 18))) ^ ((e[26 - 15] & Ga) >> 3)) + e[26 - 16]);
      q = ((rotate(l, (uint)(32 - 2))) ^ (rotate(l, (uint)(32 - 13))) ^ (rotate(l, (uint)(32 - 22)))) + ((l & m) | (f & (l | m)));
      g += p;
      k = p + q;
    };
    {
      p = j + ((rotate(g, (uint)(32 - 6))) ^ (rotate(g, (uint)(32 - 11))) ^ (rotate(g, (uint)(32 - 25)))) + (i ^ (g & (h ^ i))) + 0xBF597FC7 + (e[27] = ((rotate(e[27 - 2], (uint)(32 - 17))) ^ (rotate(e[27 - 2], (uint)(32 - 19))) ^ ((e[27 - 2] & Ga) >> 10)) + e[27 - 7] + ((rotate(e[27 - 15], (uint)(32 - 7))) ^ (rotate(e[27 - 15], (uint)(32 - 18))) ^ ((e[27 - 15] & Ga) >> 3)) + e[27 - 16]);
      q = ((rotate(k, (uint)(32 - 2))) ^ (rotate(k, (uint)(32 - 13))) ^ (rotate(k, (uint)(32 - 22)))) + ((k & l) | (m & (k | l)));
      f += p;
      j = p + q;
    };
    {
      p = i + ((rotate(f, (uint)(32 - 6))) ^ (rotate(f, (uint)(32 - 11))) ^ (rotate(f, (uint)(32 - 25)))) + (h ^ (f & (g ^ h))) + 0xC6E00BF3 + (e[28] = ((rotate(e[28 - 2], (uint)(32 - 17))) ^ (rotate(e[28 - 2], (uint)(32 - 19))) ^ ((e[28 - 2] & Ga) >> 10)) + e[28 - 7] + ((rotate(e[28 - 15], (uint)(32 - 7))) ^ (rotate(e[28 - 15], (uint)(32 - 18))) ^ ((e[28 - 15] & Ga) >> 3)) + e[28 - 16]);
      q = ((rotate(j, (uint)(32 - 2))) ^ (rotate(j, (uint)(32 - 13))) ^ (rotate(j, (uint)(32 - 22)))) + ((j & k) | (l & (j | k)));
      m += p;
      i = p + q;
    };
    {
      p = h + ((rotate(m, (uint)(32 - 6))) ^ (rotate(m, (uint)(32 - 11))) ^ (rotate(m, (uint)(32 - 25)))) + (g ^ (m & (f ^ g))) + 0xD5A79147 + (e[29] = ((rotate(e[29 - 2], (uint)(32 - 17))) ^ (rotate(e[29 - 2], (uint)(32 - 19))) ^ ((e[29 - 2] & Ga) >> 10)) + e[29 - 7] + ((rotate(e[29 - 15], (uint)(32 - 7))) ^ (rotate(e[29 - 15], (uint)(32 - 18))) ^ ((e[29 - 15] & Ga) >> 3)) + e[29 - 16]);
      q = ((rotate(i, (uint)(32 - 2))) ^ (rotate(i, (uint)(32 - 13))) ^ (rotate(i, (uint)(32 - 22)))) + ((i & j) | (k & (i | j)));
      l += p;
      h = p + q;
    };
    {
      p = g + ((rotate(l, (uint)(32 - 6))) ^ (rotate(l, (uint)(32 - 11))) ^ (rotate(l, (uint)(32 - 25)))) + (f ^ (l & (m ^ f))) + 0x06CA6351 + (e[30] = ((rotate(e[30 - 2], (uint)(32 - 17))) ^ (rotate(e[30 - 2], (uint)(32 - 19))) ^ ((e[30 - 2] & Ga) >> 10)) + e[30 - 7] + ((rotate(e[30 - 15], (uint)(32 - 7))) ^ (rotate(e[30 - 15], (uint)(32 - 18))) ^ ((e[30 - 15] & Ga) >> 3)) + e[30 - 16]);
      q = ((rotate(h, (uint)(32 - 2))) ^ (rotate(h, (uint)(32 - 13))) ^ (rotate(h, (uint)(32 - 22)))) + ((h & i) | (j & (h | i)));
      k += p;
      g = p + q;
    };
    {
      p = f + ((rotate(k, (uint)(32 - 6))) ^ (rotate(k, (uint)(32 - 11))) ^ (rotate(k, (uint)(32 - 25)))) + (m ^ (k & (l ^ m))) + 0x14292967 + (e[31] = ((rotate(e[31 - 2], (uint)(32 - 17))) ^ (rotate(e[31 - 2], (uint)(32 - 19))) ^ ((e[31 - 2] & Ga) >> 10)) + e[31 - 7] + ((rotate(e[31 - 15], (uint)(32 - 7))) ^ (rotate(e[31 - 15], (uint)(32 - 18))) ^ ((e[31 - 15] & Ga) >> 3)) + e[31 - 16]);
      q = ((rotate(g, (uint)(32 - 2))) ^ (rotate(g, (uint)(32 - 13))) ^ (rotate(g, (uint)(32 - 22)))) + ((g & h) | (i & (g | h)));
      j += p;
      f = p + q;
    };
    {
      p = m + ((rotate(j, (uint)(32 - 6))) ^ (rotate(j, (uint)(32 - 11))) ^ (rotate(j, (uint)(32 - 25)))) + (l ^ (j & (k ^ l))) + 0x27B70A85 + (e[32] = ((rotate(e[32 - 2], (uint)(32 - 17))) ^ (rotate(e[32 - 2], (uint)(32 - 19))) ^ ((e[32 - 2] & Ga) >> 10)) + e[32 - 7] + ((rotate(e[32 - 15], (uint)(32 - 7))) ^ (rotate(e[32 - 15], (uint)(32 - 18))) ^ ((e[32 - 15] & Ga) >> 3)) + e[32 - 16]);
      q = ((rotate(f, (uint)(32 - 2))) ^ (rotate(f, (uint)(32 - 13))) ^ (rotate(f, (uint)(32 - 22)))) + ((f & g) | (h & (f | g)));
      i += p;
      m = p + q;
    };
    {
      p = l + ((rotate(i, (uint)(32 - 6))) ^ (rotate(i, (uint)(32 - 11))) ^ (rotate(i, (uint)(32 - 25)))) + (k ^ (i & (j ^ k))) + 0x2E1B2138 + (e[33] = ((rotate(e[33 - 2], (uint)(32 - 17))) ^ (rotate(e[33 - 2], (uint)(32 - 19))) ^ ((e[33 - 2] & Ga) >> 10)) + e[33 - 7] + ((rotate(e[33 - 15], (uint)(32 - 7))) ^ (rotate(e[33 - 15], (uint)(32 - 18))) ^ ((e[33 - 15] & Ga) >> 3)) + e[33 - 16]);
      q = ((rotate(m, (uint)(32 - 2))) ^ (rotate(m, (uint)(32 - 13))) ^ (rotate(m, (uint)(32 - 22)))) + ((m & f) | (g & (m | f)));
      h += p;
      l = p + q;
    };
    {
      p = k + ((rotate(h, (uint)(32 - 6))) ^ (rotate(h, (uint)(32 - 11))) ^ (rotate(h, (uint)(32 - 25)))) + (j ^ (h & (i ^ j))) + 0x4D2C6DFC + (e[34] = ((rotate(e[34 - 2], (uint)(32 - 17))) ^ (rotate(e[34 - 2], (uint)(32 - 19))) ^ ((e[34 - 2] & Ga) >> 10)) + e[34 - 7] + ((rotate(e[34 - 15], (uint)(32 - 7))) ^ (rotate(e[34 - 15], (uint)(32 - 18))) ^ ((e[34 - 15] & Ga) >> 3)) + e[34 - 16]);
      q = ((rotate(l, (uint)(32 - 2))) ^ (rotate(l, (uint)(32 - 13))) ^ (rotate(l, (uint)(32 - 22)))) + ((l & m) | (f & (l | m)));
      g += p;
      k = p + q;
    };
    {
      p = j + ((rotate(g, (uint)(32 - 6))) ^ (rotate(g, (uint)(32 - 11))) ^ (rotate(g, (uint)(32 - 25)))) + (i ^ (g & (h ^ i))) + 0x53380D13 + (e[35] = ((rotate(e[35 - 2], (uint)(32 - 17))) ^ (rotate(e[35 - 2], (uint)(32 - 19))) ^ ((e[35 - 2] & Ga) >> 10)) + e[35 - 7] + ((rotate(e[35 - 15], (uint)(32 - 7))) ^ (rotate(e[35 - 15], (uint)(32 - 18))) ^ ((e[35 - 15] & Ga) >> 3)) + e[35 - 16]);
      q = ((rotate(k, (uint)(32 - 2))) ^ (rotate(k, (uint)(32 - 13))) ^ (rotate(k, (uint)(32 - 22)))) + ((k & l) | (m & (k | l)));
      f += p;
      j = p + q;
    };
    {
      p = i + ((rotate(f, (uint)(32 - 6))) ^ (rotate(f, (uint)(32 - 11))) ^ (rotate(f, (uint)(32 - 25)))) + (h ^ (f & (g ^ h))) + 0x650A7354 + (e[36] = ((rotate(e[36 - 2], (uint)(32 - 17))) ^ (rotate(e[36 - 2], (uint)(32 - 19))) ^ ((e[36 - 2] & Ga) >> 10)) + e[36 - 7] + ((rotate(e[36 - 15], (uint)(32 - 7))) ^ (rotate(e[36 - 15], (uint)(32 - 18))) ^ ((e[36 - 15] & Ga) >> 3)) + e[36 - 16]);
      q = ((rotate(j, (uint)(32 - 2))) ^ (rotate(j, (uint)(32 - 13))) ^ (rotate(j, (uint)(32 - 22)))) + ((j & k) | (l & (j | k)));
      m += p;
      i = p + q;
    };
    {
      p = h + ((rotate(m, (uint)(32 - 6))) ^ (rotate(m, (uint)(32 - 11))) ^ (rotate(m, (uint)(32 - 25)))) + (g ^ (m & (f ^ g))) + 0x766A0ABB + (e[37] = ((rotate(e[37 - 2], (uint)(32 - 17))) ^ (rotate(e[37 - 2], (uint)(32 - 19))) ^ ((e[37 - 2] & Ga) >> 10)) + e[37 - 7] + ((rotate(e[37 - 15], (uint)(32 - 7))) ^ (rotate(e[37 - 15], (uint)(32 - 18))) ^ ((e[37 - 15] & Ga) >> 3)) + e[37 - 16]);
      q = ((rotate(i, (uint)(32 - 2))) ^ (rotate(i, (uint)(32 - 13))) ^ (rotate(i, (uint)(32 - 22)))) + ((i & j) | (k & (i | j)));
      l += p;
      h = p + q;
    };
    {
      p = g + ((rotate(l, (uint)(32 - 6))) ^ (rotate(l, (uint)(32 - 11))) ^ (rotate(l, (uint)(32 - 25)))) + (f ^ (l & (m ^ f))) + 0x81C2C92E + (e[38] = ((rotate(e[38 - 2], (uint)(32 - 17))) ^ (rotate(e[38 - 2], (uint)(32 - 19))) ^ ((e[38 - 2] & Ga) >> 10)) + e[38 - 7] + ((rotate(e[38 - 15], (uint)(32 - 7))) ^ (rotate(e[38 - 15], (uint)(32 - 18))) ^ ((e[38 - 15] & Ga) >> 3)) + e[38 - 16]);
      q = ((rotate(h, (uint)(32 - 2))) ^ (rotate(h, (uint)(32 - 13))) ^ (rotate(h, (uint)(32 - 22)))) + ((h & i) | (j & (h | i)));
      k += p;
      g = p + q;
    };
    {
      p = f + ((rotate(k, (uint)(32 - 6))) ^ (rotate(k, (uint)(32 - 11))) ^ (rotate(k, (uint)(32 - 25)))) + (m ^ (k & (l ^ m))) + 0x92722C85 + (e[39] = ((rotate(e[39 - 2], (uint)(32 - 17))) ^ (rotate(e[39 - 2], (uint)(32 - 19))) ^ ((e[39 - 2] & Ga) >> 10)) + e[39 - 7] + ((rotate(e[39 - 15], (uint)(32 - 7))) ^ (rotate(e[39 - 15], (uint)(32 - 18))) ^ ((e[39 - 15] & Ga) >> 3)) + e[39 - 16]);
      q = ((rotate(g, (uint)(32 - 2))) ^ (rotate(g, (uint)(32 - 13))) ^ (rotate(g, (uint)(32 - 22)))) + ((g & h) | (i & (g | h)));
      j += p;
      f = p + q;
    };
    {
      p = m + ((rotate(j, (uint)(32 - 6))) ^ (rotate(j, (uint)(32 - 11))) ^ (rotate(j, (uint)(32 - 25)))) + (l ^ (j & (k ^ l))) + 0xA2BFE8A1 + (e[40] = ((rotate(e[40 - 2], (uint)(32 - 17))) ^ (rotate(e[40 - 2], (uint)(32 - 19))) ^ ((e[40 - 2] & Ga) >> 10)) + e[40 - 7] + ((rotate(e[40 - 15], (uint)(32 - 7))) ^ (rotate(e[40 - 15], (uint)(32 - 18))) ^ ((e[40 - 15] & Ga) >> 3)) + e[40 - 16]);
      q = ((rotate(f, (uint)(32 - 2))) ^ (rotate(f, (uint)(32 - 13))) ^ (rotate(f, (uint)(32 - 22)))) + ((f & g) | (h & (f | g)));
      i += p;
      m = p + q;
    };
    {
      p = l + ((rotate(i, (uint)(32 - 6))) ^ (rotate(i, (uint)(32 - 11))) ^ (rotate(i, (uint)(32 - 25)))) + (k ^ (i & (j ^ k))) + 0xA81A664B + (e[41] = ((rotate(e[41 - 2], (uint)(32 - 17))) ^ (rotate(e[41 - 2], (uint)(32 - 19))) ^ ((e[41 - 2] & Ga) >> 10)) + e[41 - 7] + ((rotate(e[41 - 15], (uint)(32 - 7))) ^ (rotate(e[41 - 15], (uint)(32 - 18))) ^ ((e[41 - 15] & Ga) >> 3)) + e[41 - 16]);
      q = ((rotate(m, (uint)(32 - 2))) ^ (rotate(m, (uint)(32 - 13))) ^ (rotate(m, (uint)(32 - 22)))) + ((m & f) | (g & (m | f)));
      h += p;
      l = p + q;
    };
    {
      p = k + ((rotate(h, (uint)(32 - 6))) ^ (rotate(h, (uint)(32 - 11))) ^ (rotate(h, (uint)(32 - 25)))) + (j ^ (h & (i ^ j))) + 0xC24B8B70 + (e[42] = ((rotate(e[42 - 2], (uint)(32 - 17))) ^ (rotate(e[42 - 2], (uint)(32 - 19))) ^ ((e[42 - 2] & Ga) >> 10)) + e[42 - 7] + ((rotate(e[42 - 15], (uint)(32 - 7))) ^ (rotate(e[42 - 15], (uint)(32 - 18))) ^ ((e[42 - 15] & Ga) >> 3)) + e[42 - 16]);
      q = ((rotate(l, (uint)(32 - 2))) ^ (rotate(l, (uint)(32 - 13))) ^ (rotate(l, (uint)(32 - 22)))) + ((l & m) | (f & (l | m)));
      g += p;
      k = p + q;
    };
    {
      p = j + ((rotate(g, (uint)(32 - 6))) ^ (rotate(g, (uint)(32 - 11))) ^ (rotate(g, (uint)(32 - 25)))) + (i ^ (g & (h ^ i))) + 0xC76C51A3 + (e[43] = ((rotate(e[43 - 2], (uint)(32 - 17))) ^ (rotate(e[43 - 2], (uint)(32 - 19))) ^ ((e[43 - 2] & Ga) >> 10)) + e[43 - 7] + ((rotate(e[43 - 15], (uint)(32 - 7))) ^ (rotate(e[43 - 15], (uint)(32 - 18))) ^ ((e[43 - 15] & Ga) >> 3)) + e[43 - 16]);
      q = ((rotate(k, (uint)(32 - 2))) ^ (rotate(k, (uint)(32 - 13))) ^ (rotate(k, (uint)(32 - 22)))) + ((k & l) | (m & (k | l)));
      f += p;
      j = p + q;
    };
    {
      p = i + ((rotate(f, (uint)(32 - 6))) ^ (rotate(f, (uint)(32 - 11))) ^ (rotate(f, (uint)(32 - 25)))) + (h ^ (f & (g ^ h))) + 0xD192E819 + (e[44] = ((rotate(e[44 - 2], (uint)(32 - 17))) ^ (rotate(e[44 - 2], (uint)(32 - 19))) ^ ((e[44 - 2] & Ga) >> 10)) + e[44 - 7] + ((rotate(e[44 - 15], (uint)(32 - 7))) ^ (rotate(e[44 - 15], (uint)(32 - 18))) ^ ((e[44 - 15] & Ga) >> 3)) + e[44 - 16]);
      q = ((rotate(j, (uint)(32 - 2))) ^ (rotate(j, (uint)(32 - 13))) ^ (rotate(j, (uint)(32 - 22)))) + ((j & k) | (l & (j | k)));
      m += p;
      i = p + q;
    };
    {
      p = h + ((rotate(m, (uint)(32 - 6))) ^ (rotate(m, (uint)(32 - 11))) ^ (rotate(m, (uint)(32 - 25)))) + (g ^ (m & (f ^ g))) + 0xD6990624 + (e[45] = ((rotate(e[45 - 2], (uint)(32 - 17))) ^ (rotate(e[45 - 2], (uint)(32 - 19))) ^ ((e[45 - 2] & Ga) >> 10)) + e[45 - 7] + ((rotate(e[45 - 15], (uint)(32 - 7))) ^ (rotate(e[45 - 15], (uint)(32 - 18))) ^ ((e[45 - 15] & Ga) >> 3)) + e[45 - 16]);
      q = ((rotate(i, (uint)(32 - 2))) ^ (rotate(i, (uint)(32 - 13))) ^ (rotate(i, (uint)(32 - 22)))) + ((i & j) | (k & (i | j)));
      l += p;
      h = p + q;
    };
    {
      p = g + ((rotate(l, (uint)(32 - 6))) ^ (rotate(l, (uint)(32 - 11))) ^ (rotate(l, (uint)(32 - 25)))) + (f ^ (l & (m ^ f))) + 0xF40E3585 + (e[46] = ((rotate(e[46 - 2], (uint)(32 - 17))) ^ (rotate(e[46 - 2], (uint)(32 - 19))) ^ ((e[46 - 2] & Ga) >> 10)) + e[46 - 7] + ((rotate(e[46 - 15], (uint)(32 - 7))) ^ (rotate(e[46 - 15], (uint)(32 - 18))) ^ ((e[46 - 15] & Ga) >> 3)) + e[46 - 16]);
      q = ((rotate(h, (uint)(32 - 2))) ^ (rotate(h, (uint)(32 - 13))) ^ (rotate(h, (uint)(32 - 22)))) + ((h & i) | (j & (h | i)));
      k += p;
      g = p + q;
    };
    {
      p = f + ((rotate(k, (uint)(32 - 6))) ^ (rotate(k, (uint)(32 - 11))) ^ (rotate(k, (uint)(32 - 25)))) + (m ^ (k & (l ^ m))) + 0x106AA070 + (e[47] = ((rotate(e[47 - 2], (uint)(32 - 17))) ^ (rotate(e[47 - 2], (uint)(32 - 19))) ^ ((e[47 - 2] & Ga) >> 10)) + e[47 - 7] + ((rotate(e[47 - 15], (uint)(32 - 7))) ^ (rotate(e[47 - 15], (uint)(32 - 18))) ^ ((e[47 - 15] & Ga) >> 3)) + e[47 - 16]);
      q = ((rotate(g, (uint)(32 - 2))) ^ (rotate(g, (uint)(32 - 13))) ^ (rotate(g, (uint)(32 - 22)))) + ((g & h) | (i & (g | h)));
      j += p;
      f = p + q;
    };
    {
      p = m + ((rotate(j, (uint)(32 - 6))) ^ (rotate(j, (uint)(32 - 11))) ^ (rotate(j, (uint)(32 - 25)))) + (l ^ (j & (k ^ l))) + 0x19A4C116 + (e[48] = ((rotate(e[48 - 2], (uint)(32 - 17))) ^ (rotate(e[48 - 2], (uint)(32 - 19))) ^ ((e[48 - 2] & Ga) >> 10)) + e[48 - 7] + ((rotate(e[48 - 15], (uint)(32 - 7))) ^ (rotate(e[48 - 15], (uint)(32 - 18))) ^ ((e[48 - 15] & Ga) >> 3)) + e[48 - 16]);
      q = ((rotate(f, (uint)(32 - 2))) ^ (rotate(f, (uint)(32 - 13))) ^ (rotate(f, (uint)(32 - 22)))) + ((f & g) | (h & (f | g)));
      i += p;
      m = p + q;
    };
    {
      p = l + ((rotate(i, (uint)(32 - 6))) ^ (rotate(i, (uint)(32 - 11))) ^ (rotate(i, (uint)(32 - 25)))) + (k ^ (i & (j ^ k))) + 0x1E376C08 + (e[49] = ((rotate(e[49 - 2], (uint)(32 - 17))) ^ (rotate(e[49 - 2], (uint)(32 - 19))) ^ ((e[49 - 2] & Ga) >> 10)) + e[49 - 7] + ((rotate(e[49 - 15], (uint)(32 - 7))) ^ (rotate(e[49 - 15], (uint)(32 - 18))) ^ ((e[49 - 15] & Ga) >> 3)) + e[49 - 16]);
      q = ((rotate(m, (uint)(32 - 2))) ^ (rotate(m, (uint)(32 - 13))) ^ (rotate(m, (uint)(32 - 22)))) + ((m & f) | (g & (m | f)));
      h += p;
      l = p + q;
    };
    {
      p = k + ((rotate(h, (uint)(32 - 6))) ^ (rotate(h, (uint)(32 - 11))) ^ (rotate(h, (uint)(32 - 25)))) + (j ^ (h & (i ^ j))) + 0x2748774C + (e[50] = ((rotate(e[50 - 2], (uint)(32 - 17))) ^ (rotate(e[50 - 2], (uint)(32 - 19))) ^ ((e[50 - 2] & Ga) >> 10)) + e[50 - 7] + ((rotate(e[50 - 15], (uint)(32 - 7))) ^ (rotate(e[50 - 15], (uint)(32 - 18))) ^ ((e[50 - 15] & Ga) >> 3)) + e[50 - 16]);
      q = ((rotate(l, (uint)(32 - 2))) ^ (rotate(l, (uint)(32 - 13))) ^ (rotate(l, (uint)(32 - 22)))) + ((l & m) | (f & (l | m)));
      g += p;
      k = p + q;
    };
    {
      p = j + ((rotate(g, (uint)(32 - 6))) ^ (rotate(g, (uint)(32 - 11))) ^ (rotate(g, (uint)(32 - 25)))) + (i ^ (g & (h ^ i))) + 0x34B0BCB5 + (e[51] = ((rotate(e[51 - 2], (uint)(32 - 17))) ^ (rotate(e[51 - 2], (uint)(32 - 19))) ^ ((e[51 - 2] & Ga) >> 10)) + e[51 - 7] + ((rotate(e[51 - 15], (uint)(32 - 7))) ^ (rotate(e[51 - 15], (uint)(32 - 18))) ^ ((e[51 - 15] & Ga) >> 3)) + e[51 - 16]);
      q = ((rotate(k, (uint)(32 - 2))) ^ (rotate(k, (uint)(32 - 13))) ^ (rotate(k, (uint)(32 - 22)))) + ((k & l) | (m & (k | l)));
      f += p;
      j = p + q;
    };
    {
      p = i + ((rotate(f, (uint)(32 - 6))) ^ (rotate(f, (uint)(32 - 11))) ^ (rotate(f, (uint)(32 - 25)))) + (h ^ (f & (g ^ h))) + 0x391C0CB3 + (e[52] = ((rotate(e[52 - 2], (uint)(32 - 17))) ^ (rotate(e[52 - 2], (uint)(32 - 19))) ^ ((e[52 - 2] & Ga) >> 10)) + e[52 - 7] + ((rotate(e[52 - 15], (uint)(32 - 7))) ^ (rotate(e[52 - 15], (uint)(32 - 18))) ^ ((e[52 - 15] & Ga) >> 3)) + e[52 - 16]);
      q = ((rotate(j, (uint)(32 - 2))) ^ (rotate(j, (uint)(32 - 13))) ^ (rotate(j, (uint)(32 - 22)))) + ((j & k) | (l & (j | k)));
      m += p;
      i = p + q;
    };
    {
      p = h + ((rotate(m, (uint)(32 - 6))) ^ (rotate(m, (uint)(32 - 11))) ^ (rotate(m, (uint)(32 - 25)))) + (g ^ (m & (f ^ g))) + 0x4ED8AA4A + (e[53] = ((rotate(e[53 - 2], (uint)(32 - 17))) ^ (rotate(e[53 - 2], (uint)(32 - 19))) ^ ((e[53 - 2] & Ga) >> 10)) + e[53 - 7] + ((rotate(e[53 - 15], (uint)(32 - 7))) ^ (rotate(e[53 - 15], (uint)(32 - 18))) ^ ((e[53 - 15] & Ga) >> 3)) + e[53 - 16]);
      q = ((rotate(i, (uint)(32 - 2))) ^ (rotate(i, (uint)(32 - 13))) ^ (rotate(i, (uint)(32 - 22)))) + ((i & j) | (k & (i | j)));
      l += p;
      h = p + q;
    };
    {
      p = g + ((rotate(l, (uint)(32 - 6))) ^ (rotate(l, (uint)(32 - 11))) ^ (rotate(l, (uint)(32 - 25)))) + (f ^ (l & (m ^ f))) + 0x5B9CCA4F + (e[54] = ((rotate(e[54 - 2], (uint)(32 - 17))) ^ (rotate(e[54 - 2], (uint)(32 - 19))) ^ ((e[54 - 2] & Ga) >> 10)) + e[54 - 7] + ((rotate(e[54 - 15], (uint)(32 - 7))) ^ (rotate(e[54 - 15], (uint)(32 - 18))) ^ ((e[54 - 15] & Ga) >> 3)) + e[54 - 16]);
      q = ((rotate(h, (uint)(32 - 2))) ^ (rotate(h, (uint)(32 - 13))) ^ (rotate(h, (uint)(32 - 22)))) + ((h & i) | (j & (h | i)));
      k += p;
      g = p + q;
    };
    {
      p = f + ((rotate(k, (uint)(32 - 6))) ^ (rotate(k, (uint)(32 - 11))) ^ (rotate(k, (uint)(32 - 25)))) + (m ^ (k & (l ^ m))) + 0x682E6FF3 + (e[55] = ((rotate(e[55 - 2], (uint)(32 - 17))) ^ (rotate(e[55 - 2], (uint)(32 - 19))) ^ ((e[55 - 2] & Ga) >> 10)) + e[55 - 7] + ((rotate(e[55 - 15], (uint)(32 - 7))) ^ (rotate(e[55 - 15], (uint)(32 - 18))) ^ ((e[55 - 15] & Ga) >> 3)) + e[55 - 16]);
      q = ((rotate(g, (uint)(32 - 2))) ^ (rotate(g, (uint)(32 - 13))) ^ (rotate(g, (uint)(32 - 22)))) + ((g & h) | (i & (g | h)));
      j += p;
      f = p + q;
    };
    {
      p = m + ((rotate(j, (uint)(32 - 6))) ^ (rotate(j, (uint)(32 - 11))) ^ (rotate(j, (uint)(32 - 25)))) + (l ^ (j & (k ^ l))) + 0x748F82EE + (e[56] = ((rotate(e[56 - 2], (uint)(32 - 17))) ^ (rotate(e[56 - 2], (uint)(32 - 19))) ^ ((e[56 - 2] & Ga) >> 10)) + e[56 - 7] + ((rotate(e[56 - 15], (uint)(32 - 7))) ^ (rotate(e[56 - 15], (uint)(32 - 18))) ^ ((e[56 - 15] & Ga) >> 3)) + e[56 - 16]);
      q = ((rotate(f, (uint)(32 - 2))) ^ (rotate(f, (uint)(32 - 13))) ^ (rotate(f, (uint)(32 - 22)))) + ((f & g) | (h & (f | g)));
      i += p;
      m = p + q;
    };
    {
      p = l + ((rotate(i, (uint)(32 - 6))) ^ (rotate(i, (uint)(32 - 11))) ^ (rotate(i, (uint)(32 - 25)))) + (k ^ (i & (j ^ k))) + 0x78A5636F + (e[57] = ((rotate(e[57 - 2], (uint)(32 - 17))) ^ (rotate(e[57 - 2], (uint)(32 - 19))) ^ ((e[57 - 2] & Ga) >> 10)) + e[57 - 7] + ((rotate(e[57 - 15], (uint)(32 - 7))) ^ (rotate(e[57 - 15], (uint)(32 - 18))) ^ ((e[57 - 15] & Ga) >> 3)) + e[57 - 16]);
      q = ((rotate(m, (uint)(32 - 2))) ^ (rotate(m, (uint)(32 - 13))) ^ (rotate(m, (uint)(32 - 22)))) + ((m & f) | (g & (m | f)));
      h += p;
      l = p + q;
    };
    {
      p = k + ((rotate(h, (uint)(32 - 6))) ^ (rotate(h, (uint)(32 - 11))) ^ (rotate(h, (uint)(32 - 25)))) + (j ^ (h & (i ^ j))) + 0x84C87814 + (e[58] = ((rotate(e[58 - 2], (uint)(32 - 17))) ^ (rotate(e[58 - 2], (uint)(32 - 19))) ^ ((e[58 - 2] & Ga) >> 10)) + e[58 - 7] + ((rotate(e[58 - 15], (uint)(32 - 7))) ^ (rotate(e[58 - 15], (uint)(32 - 18))) ^ ((e[58 - 15] & Ga) >> 3)) + e[58 - 16]);
      q = ((rotate(l, (uint)(32 - 2))) ^ (rotate(l, (uint)(32 - 13))) ^ (rotate(l, (uint)(32 - 22)))) + ((l & m) | (f & (l | m)));
      g += p;
      k = p + q;
    };
    {
      p = j + ((rotate(g, (uint)(32 - 6))) ^ (rotate(g, (uint)(32 - 11))) ^ (rotate(g, (uint)(32 - 25)))) + (i ^ (g & (h ^ i))) + 0x8CC70208 + (e[59] = ((rotate(e[59 - 2], (uint)(32 - 17))) ^ (rotate(e[59 - 2], (uint)(32 - 19))) ^ ((e[59 - 2] & Ga) >> 10)) + e[59 - 7] + ((rotate(e[59 - 15], (uint)(32 - 7))) ^ (rotate(e[59 - 15], (uint)(32 - 18))) ^ ((e[59 - 15] & Ga) >> 3)) + e[59 - 16]);
      q = ((rotate(k, (uint)(32 - 2))) ^ (rotate(k, (uint)(32 - 13))) ^ (rotate(k, (uint)(32 - 22)))) + ((k & l) | (m & (k | l)));
      f += p;
      j = p + q;
    };
    {
      p = i + ((rotate(f, (uint)(32 - 6))) ^ (rotate(f, (uint)(32 - 11))) ^ (rotate(f, (uint)(32 - 25)))) + (h ^ (f & (g ^ h))) + 0x90BEFFFA + (e[60] = ((rotate(e[60 - 2], (uint)(32 - 17))) ^ (rotate(e[60 - 2], (uint)(32 - 19))) ^ ((e[60 - 2] & Ga) >> 10)) + e[60 - 7] + ((rotate(e[60 - 15], (uint)(32 - 7))) ^ (rotate(e[60 - 15], (uint)(32 - 18))) ^ ((e[60 - 15] & Ga) >> 3)) + e[60 - 16]);
      q = ((rotate(j, (uint)(32 - 2))) ^ (rotate(j, (uint)(32 - 13))) ^ (rotate(j, (uint)(32 - 22)))) + ((j & k) | (l & (j | k)));
      m += p;
      i = p + q;
    };
    {
      p = h + ((rotate(m, (uint)(32 - 6))) ^ (rotate(m, (uint)(32 - 11))) ^ (rotate(m, (uint)(32 - 25)))) + (g ^ (m & (f ^ g))) + 0xA4506CEB + (e[61] = ((rotate(e[61 - 2], (uint)(32 - 17))) ^ (rotate(e[61 - 2], (uint)(32 - 19))) ^ ((e[61 - 2] & Ga) >> 10)) + e[61 - 7] + ((rotate(e[61 - 15], (uint)(32 - 7))) ^ (rotate(e[61 - 15], (uint)(32 - 18))) ^ ((e[61 - 15] & Ga) >> 3)) + e[61 - 16]);
      q = ((rotate(i, (uint)(32 - 2))) ^ (rotate(i, (uint)(32 - 13))) ^ (rotate(i, (uint)(32 - 22)))) + ((i & j) | (k & (i | j)));
      l += p;
      h = p + q;
    };
    {
      p = g + ((rotate(l, (uint)(32 - 6))) ^ (rotate(l, (uint)(32 - 11))) ^ (rotate(l, (uint)(32 - 25)))) + (f ^ (l & (m ^ f))) + 0xBEF9A3F7 + (e[62] = ((rotate(e[62 - 2], (uint)(32 - 17))) ^ (rotate(e[62 - 2], (uint)(32 - 19))) ^ ((e[62 - 2] & Ga) >> 10)) + e[62 - 7] + ((rotate(e[62 - 15], (uint)(32 - 7))) ^ (rotate(e[62 - 15], (uint)(32 - 18))) ^ ((e[62 - 15] & Ga) >> 3)) + e[62 - 16]);
      q = ((rotate(h, (uint)(32 - 2))) ^ (rotate(h, (uint)(32 - 13))) ^ (rotate(h, (uint)(32 - 22)))) + ((h & i) | (j & (h | i)));
      k += p;
      g = p + q;
    };
    {
      p = f + ((rotate(k, (uint)(32 - 6))) ^ (rotate(k, (uint)(32 - 11))) ^ (rotate(k, (uint)(32 - 25)))) + (m ^ (k & (l ^ m))) + 0xC67178F2 + (e[63] = ((rotate(e[63 - 2], (uint)(32 - 17))) ^ (rotate(e[63 - 2], (uint)(32 - 19))) ^ ((e[63 - 2] & Ga) >> 10)) + e[63 - 7] + ((rotate(e[63 - 15], (uint)(32 - 7))) ^ (rotate(e[63 - 15], (uint)(32 - 18))) ^ ((e[63 - 15] & Ga) >> 3)) + e[63 - 16]);
      q = ((rotate(g, (uint)(32 - 2))) ^ (rotate(g, (uint)(32 - 13))) ^ (rotate(g, (uint)(32 - 22)))) + ((g & h) | (i & (g | h)));
      j += p;
      f = p + q;
    };

    e[0] = a->m_AH[0] + f;
    e[1] = a->m_AH[1] + g;
    e[2] = a->m_AH[2] + h;
    e[3] = a->m_AH[3] + i;
    e[4] = a->m_AH[4] + j;
    e[5] = a->m_AH[5] + k;
    e[6] = a->m_AH[6] + l;
    e[7] = a->m_AH[7] + m;
    e[8] = 0x80000000;
    e[9] = 0x00000000;
    e[10] = 0x00000000;
    e[11] = 0x00000000;
    e[12] = 0x00000000;
    e[13] = 0x00000000;
    e[14] = 0x00000000;
    e[15] = 0x00000100;

    f = 0x6a09e667;
    g = 0xbb67ae85;
    h = 0x3c6ef372;
    i = 0xa54ff53a;
    j = 0x510e527f;
    k = 0x9b05688c;
    l = 0x1f83d9ab;
    m = 0x5be0cd19;

    {
      p = m + ((rotate(j, (uint)(32 - 6))) ^ (rotate(j, (uint)(32 - 11))) ^ (rotate(j, (uint)(32 - 25)))) + (l ^ (j & (k ^ l))) + 0x428A2F98 + e[0];
      q = ((rotate(f, (uint)(32 - 2))) ^ (rotate(f, (uint)(32 - 13))) ^ (rotate(f, (uint)(32 - 22)))) + ((f & g) | (h & (f | g)));
      i += p;
      m = p + q;
    };
    {
      p = l + ((rotate(i, (uint)(32 - 6))) ^ (rotate(i, (uint)(32 - 11))) ^ (rotate(i, (uint)(32 - 25)))) + (k ^ (i & (j ^ k))) + 0x71374491 + e[1];
      q = ((rotate(m, (uint)(32 - 2))) ^ (rotate(m, (uint)(32 - 13))) ^ (rotate(m, (uint)(32 - 22)))) + ((m & f) | (g & (m | f)));
      h += p;
      l = p + q;
    };
    {
      p = k + ((rotate(h, (uint)(32 - 6))) ^ (rotate(h, (uint)(32 - 11))) ^ (rotate(h, (uint)(32 - 25)))) + (j ^ (h & (i ^ j))) + 0xB5C0FBCF + e[2];
      q = ((rotate(l, (uint)(32 - 2))) ^ (rotate(l, (uint)(32 - 13))) ^ (rotate(l, (uint)(32 - 22)))) + ((l & m) | (f & (l | m)));
      g += p;
      k = p + q;
    };
    {
      p = j + ((rotate(g, (uint)(32 - 6))) ^ (rotate(g, (uint)(32 - 11))) ^ (rotate(g, (uint)(32 - 25)))) + (i ^ (g & (h ^ i))) + 0xE9B5DBA5 + e[3];
      q = ((rotate(k, (uint)(32 - 2))) ^ (rotate(k, (uint)(32 - 13))) ^ (rotate(k, (uint)(32 - 22)))) + ((k & l) | (m & (k | l)));
      f += p;
      j = p + q;
    };
    {
      p = i + ((rotate(f, (uint)(32 - 6))) ^ (rotate(f, (uint)(32 - 11))) ^ (rotate(f, (uint)(32 - 25)))) + (h ^ (f & (g ^ h))) + 0x3956C25B + e[4];
      q = ((rotate(j, (uint)(32 - 2))) ^ (rotate(j, (uint)(32 - 13))) ^ (rotate(j, (uint)(32 - 22)))) + ((j & k) | (l & (j | k)));
      m += p;
      i = p + q;
    };
    {
      p = h + ((rotate(m, (uint)(32 - 6))) ^ (rotate(m, (uint)(32 - 11))) ^ (rotate(m, (uint)(32 - 25)))) + (g ^ (m & (f ^ g))) + 0x59F111F1 + e[5];
      q = ((rotate(i, (uint)(32 - 2))) ^ (rotate(i, (uint)(32 - 13))) ^ (rotate(i, (uint)(32 - 22)))) + ((i & j) | (k & (i | j)));
      l += p;
      h = p + q;
    };
    {
      p = g + ((rotate(l, (uint)(32 - 6))) ^ (rotate(l, (uint)(32 - 11))) ^ (rotate(l, (uint)(32 - 25)))) + (f ^ (l & (m ^ f))) + 0x923F82A4 + e[6];
      q = ((rotate(h, (uint)(32 - 2))) ^ (rotate(h, (uint)(32 - 13))) ^ (rotate(h, (uint)(32 - 22)))) + ((h & i) | (j & (h | i)));
      k += p;
      g = p + q;
    };
    {
      p = f + ((rotate(k, (uint)(32 - 6))) ^ (rotate(k, (uint)(32 - 11))) ^ (rotate(k, (uint)(32 - 25)))) + (m ^ (k & (l ^ m))) + 0xAB1C5ED5 + e[7];
      q = ((rotate(g, (uint)(32 - 2))) ^ (rotate(g, (uint)(32 - 13))) ^ (rotate(g, (uint)(32 - 22)))) + ((g & h) | (i & (g | h)));
      j += p;
      f = p + q;
    };
    {
      p = m + ((rotate(j, (uint)(32 - 6))) ^ (rotate(j, (uint)(32 - 11))) ^ (rotate(j, (uint)(32 - 25)))) + (l ^ (j & (k ^ l))) + 0xD807AA98 + e[8];
      q = ((rotate(f, (uint)(32 - 2))) ^ (rotate(f, (uint)(32 - 13))) ^ (rotate(f, (uint)(32 - 22)))) + ((f & g) | (h & (f | g)));
      i += p;
      m = p + q;
    };
    {
      p = l + ((rotate(i, (uint)(32 - 6))) ^ (rotate(i, (uint)(32 - 11))) ^ (rotate(i, (uint)(32 - 25)))) + (k ^ (i & (j ^ k))) + 0x12835B01 + e[9];
      q = ((rotate(m, (uint)(32 - 2))) ^ (rotate(m, (uint)(32 - 13))) ^ (rotate(m, (uint)(32 - 22)))) + ((m & f) | (g & (m | f)));
      h += p;
      l = p + q;
    };
    {
      p = k + ((rotate(h, (uint)(32 - 6))) ^ (rotate(h, (uint)(32 - 11))) ^ (rotate(h, (uint)(32 - 25)))) + (j ^ (h & (i ^ j))) + 0x243185BE + e[10];
      q = ((rotate(l, (uint)(32 - 2))) ^ (rotate(l, (uint)(32 - 13))) ^ (rotate(l, (uint)(32 - 22)))) + ((l & m) | (f & (l | m)));
      g += p;
      k = p + q;
    };
    {
      p = j + ((rotate(g, (uint)(32 - 6))) ^ (rotate(g, (uint)(32 - 11))) ^ (rotate(g, (uint)(32 - 25)))) + (i ^ (g & (h ^ i))) + 0x550C7DC3 + e[11];
      q = ((rotate(k, (uint)(32 - 2))) ^ (rotate(k, (uint)(32 - 13))) ^ (rotate(k, (uint)(32 - 22)))) + ((k & l) | (m & (k | l)));
      f += p;
      j = p + q;
    };
    {
      p = i + ((rotate(f, (uint)(32 - 6))) ^ (rotate(f, (uint)(32 - 11))) ^ (rotate(f, (uint)(32 - 25)))) + (h ^ (f & (g ^ h))) + 0x72BE5D74 + e[12];
      q = ((rotate(j, (uint)(32 - 2))) ^ (rotate(j, (uint)(32 - 13))) ^ (rotate(j, (uint)(32 - 22)))) + ((j & k) | (l & (j | k)));
      m += p;
      i = p + q;
    };
    {
      p = h + ((rotate(m, (uint)(32 - 6))) ^ (rotate(m, (uint)(32 - 11))) ^ (rotate(m, (uint)(32 - 25)))) + (g ^ (m & (f ^ g))) + 0x80DEB1FE + e[13];
      q = ((rotate(i, (uint)(32 - 2))) ^ (rotate(i, (uint)(32 - 13))) ^ (rotate(i, (uint)(32 - 22)))) + ((i & j) | (k & (i | j)));
      l += p;
      h = p + q;
    };
    {
      p = g + ((rotate(l, (uint)(32 - 6))) ^ (rotate(l, (uint)(32 - 11))) ^ (rotate(l, (uint)(32 - 25)))) + (f ^ (l & (m ^ f))) + 0x9BDC06A7 + e[14];
      q = ((rotate(h, (uint)(32 - 2))) ^ (rotate(h, (uint)(32 - 13))) ^ (rotate(h, (uint)(32 - 22)))) + ((h & i) | (j & (h | i)));
      k += p;
      g = p + q;
    };
    {
      p = f + ((rotate(k, (uint)(32 - 6))) ^ (rotate(k, (uint)(32 - 11))) ^ (rotate(k, (uint)(32 - 25)))) + (m ^ (k & (l ^ m))) + 0xC19BF174 + e[15];
      q = ((rotate(g, (uint)(32 - 2))) ^ (rotate(g, (uint)(32 - 13))) ^ (rotate(g, (uint)(32 - 22)))) + ((g & h) | (i & (g | h)));
      j += p;
      f = p + q;
    };
    {
      p = m + ((rotate(j, (uint)(32 - 6))) ^ (rotate(j, (uint)(32 - 11))) ^ (rotate(j, (uint)(32 - 25)))) + (l ^ (j & (k ^ l))) + 0xE49B69C1 + (e[16] = ((rotate(e[16 - 2], (uint)(32 - 17))) ^ (rotate(e[16 - 2], (uint)(32 - 19))) ^ ((e[16 - 2] & Ga) >> 10)) + e[16 - 7] + ((rotate(e[16 - 15], (uint)(32 - 7))) ^ (rotate(e[16 - 15], (uint)(32 - 18))) ^ ((e[16 - 15] & Ga) >> 3)) + e[16 - 16]);
      q = ((rotate(f, (uint)(32 - 2))) ^ (rotate(f, (uint)(32 - 13))) ^ (rotate(f, (uint)(32 - 22)))) + ((f & g) | (h & (f | g)));
      i += p;
      m = p + q;
    };
    {
      p = l + ((rotate(i, (uint)(32 - 6))) ^ (rotate(i, (uint)(32 - 11))) ^ (rotate(i, (uint)(32 - 25)))) + (k ^ (i & (j ^ k))) + 0xEFBE4786 + (e[17] = ((rotate(e[17 - 2], (uint)(32 - 17))) ^ (rotate(e[17 - 2], (uint)(32 - 19))) ^ ((e[17 - 2] & Ga) >> 10)) + e[17 - 7] + ((rotate(e[17 - 15], (uint)(32 - 7))) ^ (rotate(e[17 - 15], (uint)(32 - 18))) ^ ((e[17 - 15] & Ga) >> 3)) + e[17 - 16]);
      q = ((rotate(m, (uint)(32 - 2))) ^ (rotate(m, (uint)(32 - 13))) ^ (rotate(m, (uint)(32 - 22)))) + ((m & f) | (g & (m | f)));
      h += p;
      l = p + q;
    };
    {
      p = k + ((rotate(h, (uint)(32 - 6))) ^ (rotate(h, (uint)(32 - 11))) ^ (rotate(h, (uint)(32 - 25)))) + (j ^ (h & (i ^ j))) + 0x0FC19DC6 + (e[18] = ((rotate(e[18 - 2], (uint)(32 - 17))) ^ (rotate(e[18 - 2], (uint)(32 - 19))) ^ ((e[18 - 2] & Ga) >> 10)) + e[18 - 7] + ((rotate(e[18 - 15], (uint)(32 - 7))) ^ (rotate(e[18 - 15], (uint)(32 - 18))) ^ ((e[18 - 15] & Ga) >> 3)) + e[18 - 16]);
      q = ((rotate(l, (uint)(32 - 2))) ^ (rotate(l, (uint)(32 - 13))) ^ (rotate(l, (uint)(32 - 22)))) + ((l & m) | (f & (l | m)));
      g += p;
      k = p + q;
    };
    {
      p = j + ((rotate(g, (uint)(32 - 6))) ^ (rotate(g, (uint)(32 - 11))) ^ (rotate(g, (uint)(32 - 25)))) + (i ^ (g & (h ^ i))) + 0x240CA1CC + (e[19] = ((rotate(e[19 - 2], (uint)(32 - 17))) ^ (rotate(e[19 - 2], (uint)(32 - 19))) ^ ((e[19 - 2] & Ga) >> 10)) + e[19 - 7] + ((rotate(e[19 - 15], (uint)(32 - 7))) ^ (rotate(e[19 - 15], (uint)(32 - 18))) ^ ((e[19 - 15] & Ga) >> 3)) + e[19 - 16]);
      q = ((rotate(k, (uint)(32 - 2))) ^ (rotate(k, (uint)(32 - 13))) ^ (rotate(k, (uint)(32 - 22)))) + ((k & l) | (m & (k | l)));
      f += p;
      j = p + q;
    };
    {
      p = i + ((rotate(f, (uint)(32 - 6))) ^ (rotate(f, (uint)(32 - 11))) ^ (rotate(f, (uint)(32 - 25)))) + (h ^ (f & (g ^ h))) + 0x2DE92C6F + (e[20] = ((rotate(e[20 - 2], (uint)(32 - 17))) ^ (rotate(e[20 - 2], (uint)(32 - 19))) ^ ((e[20 - 2] & Ga) >> 10)) + e[20 - 7] + ((rotate(e[20 - 15], (uint)(32 - 7))) ^ (rotate(e[20 - 15], (uint)(32 - 18))) ^ ((e[20 - 15] & Ga) >> 3)) + e[20 - 16]);
      q = ((rotate(j, (uint)(32 - 2))) ^ (rotate(j, (uint)(32 - 13))) ^ (rotate(j, (uint)(32 - 22)))) + ((j & k) | (l & (j | k)));
      m += p;
      i = p + q;
    };
    {
      p = h + ((rotate(m, (uint)(32 - 6))) ^ (rotate(m, (uint)(32 - 11))) ^ (rotate(m, (uint)(32 - 25)))) + (g ^ (m & (f ^ g))) + 0x4A7484AA + (e[21] = ((rotate(e[21 - 2], (uint)(32 - 17))) ^ (rotate(e[21 - 2], (uint)(32 - 19))) ^ ((e[21 - 2] & Ga) >> 10)) + e[21 - 7] + ((rotate(e[21 - 15], (uint)(32 - 7))) ^ (rotate(e[21 - 15], (uint)(32 - 18))) ^ ((e[21 - 15] & Ga) >> 3)) + e[21 - 16]);
      q = ((rotate(i, (uint)(32 - 2))) ^ (rotate(i, (uint)(32 - 13))) ^ (rotate(i, (uint)(32 - 22)))) + ((i & j) | (k & (i | j)));
      l += p;
      h = p + q;
    };
    {
      p = g + ((rotate(l, (uint)(32 - 6))) ^ (rotate(l, (uint)(32 - 11))) ^ (rotate(l, (uint)(32 - 25)))) + (f ^ (l & (m ^ f))) + 0x5CB0A9DC + (e[22] = ((rotate(e[22 - 2], (uint)(32 - 17))) ^ (rotate(e[22 - 2], (uint)(32 - 19))) ^ ((e[22 - 2] & Ga) >> 10)) + e[22 - 7] + ((rotate(e[22 - 15], (uint)(32 - 7))) ^ (rotate(e[22 - 15], (uint)(32 - 18))) ^ ((e[22 - 15] & Ga) >> 3)) + e[22 - 16]);
      q = ((rotate(h, (uint)(32 - 2))) ^ (rotate(h, (uint)(32 - 13))) ^ (rotate(h, (uint)(32 - 22)))) + ((h & i) | (j & (h | i)));
      k += p;
      g = p + q;
    };
    {
      p = f + ((rotate(k, (uint)(32 - 6))) ^ (rotate(k, (uint)(32 - 11))) ^ (rotate(k, (uint)(32 - 25)))) + (m ^ (k & (l ^ m))) + 0x76F988DA + (e[23] = ((rotate(e[23 - 2], (uint)(32 - 17))) ^ (rotate(e[23 - 2], (uint)(32 - 19))) ^ ((e[23 - 2] & Ga) >> 10)) + e[23 - 7] + ((rotate(e[23 - 15], (uint)(32 - 7))) ^ (rotate(e[23 - 15], (uint)(32 - 18))) ^ ((e[23 - 15] & Ga) >> 3)) + e[23 - 16]);
      q = ((rotate(g, (uint)(32 - 2))) ^ (rotate(g, (uint)(32 - 13))) ^ (rotate(g, (uint)(32 - 22)))) + ((g & h) | (i & (g | h)));
      j += p;
      f = p + q;
    };
    {
      p = m + ((rotate(j, (uint)(32 - 6))) ^ (rotate(j, (uint)(32 - 11))) ^ (rotate(j, (uint)(32 - 25)))) + (l ^ (j & (k ^ l))) + 0x983E5152 + (e[24] = ((rotate(e[24 - 2], (uint)(32 - 17))) ^ (rotate(e[24 - 2], (uint)(32 - 19))) ^ ((e[24 - 2] & Ga) >> 10)) + e[24 - 7] + ((rotate(e[24 - 15], (uint)(32 - 7))) ^ (rotate(e[24 - 15], (uint)(32 - 18))) ^ ((e[24 - 15] & Ga) >> 3)) + e[24 - 16]);
      q = ((rotate(f, (uint)(32 - 2))) ^ (rotate(f, (uint)(32 - 13))) ^ (rotate(f, (uint)(32 - 22)))) + ((f & g) | (h & (f | g)));
      i += p;
      m = p + q;
    };
    {
      p = l + ((rotate(i, (uint)(32 - 6))) ^ (rotate(i, (uint)(32 - 11))) ^ (rotate(i, (uint)(32 - 25)))) + (k ^ (i & (j ^ k))) + 0xA831C66D + (e[25] = ((rotate(e[25 - 2], (uint)(32 - 17))) ^ (rotate(e[25 - 2], (uint)(32 - 19))) ^ ((e[25 - 2] & Ga) >> 10)) + e[25 - 7] + ((rotate(e[25 - 15], (uint)(32 - 7))) ^ (rotate(e[25 - 15], (uint)(32 - 18))) ^ ((e[25 - 15] & Ga) >> 3)) + e[25 - 16]);
      q = ((rotate(m, (uint)(32 - 2))) ^ (rotate(m, (uint)(32 - 13))) ^ (rotate(m, (uint)(32 - 22)))) + ((m & f) | (g & (m | f)));
      h += p;
      l = p + q;
    };
    {
      p = k + ((rotate(h, (uint)(32 - 6))) ^ (rotate(h, (uint)(32 - 11))) ^ (rotate(h, (uint)(32 - 25)))) + (j ^ (h & (i ^ j))) + 0xB00327C8 + (e[26] = ((rotate(e[26 - 2], (uint)(32 - 17))) ^ (rotate(e[26 - 2], (uint)(32 - 19))) ^ ((e[26 - 2] & Ga) >> 10)) + e[26 - 7] + ((rotate(e[26 - 15], (uint)(32 - 7))) ^ (rotate(e[26 - 15], (uint)(32 - 18))) ^ ((e[26 - 15] & Ga) >> 3)) + e[26 - 16]);
      q = ((rotate(l, (uint)(32 - 2))) ^ (rotate(l, (uint)(32 - 13))) ^ (rotate(l, (uint)(32 - 22)))) + ((l & m) | (f & (l | m)));
      g += p;
      k = p + q;
    };
    {
      p = j + ((rotate(g, (uint)(32 - 6))) ^ (rotate(g, (uint)(32 - 11))) ^ (rotate(g, (uint)(32 - 25)))) + (i ^ (g & (h ^ i))) + 0xBF597FC7 + (e[27] = ((rotate(e[27 - 2], (uint)(32 - 17))) ^ (rotate(e[27 - 2], (uint)(32 - 19))) ^ ((e[27 - 2] & Ga) >> 10)) + e[27 - 7] + ((rotate(e[27 - 15], (uint)(32 - 7))) ^ (rotate(e[27 - 15], (uint)(32 - 18))) ^ ((e[27 - 15] & Ga) >> 3)) + e[27 - 16]);
      q = ((rotate(k, (uint)(32 - 2))) ^ (rotate(k, (uint)(32 - 13))) ^ (rotate(k, (uint)(32 - 22)))) + ((k & l) | (m & (k | l)));
      f += p;
      j = p + q;
    };
    {
      p = i + ((rotate(f, (uint)(32 - 6))) ^ (rotate(f, (uint)(32 - 11))) ^ (rotate(f, (uint)(32 - 25)))) + (h ^ (f & (g ^ h))) + 0xC6E00BF3 + (e[28] = ((rotate(e[28 - 2], (uint)(32 - 17))) ^ (rotate(e[28 - 2], (uint)(32 - 19))) ^ ((e[28 - 2] & Ga) >> 10)) + e[28 - 7] + ((rotate(e[28 - 15], (uint)(32 - 7))) ^ (rotate(e[28 - 15], (uint)(32 - 18))) ^ ((e[28 - 15] & Ga) >> 3)) + e[28 - 16]);
      q = ((rotate(j, (uint)(32 - 2))) ^ (rotate(j, (uint)(32 - 13))) ^ (rotate(j, (uint)(32 - 22)))) + ((j & k) | (l & (j | k)));
      m += p;
      i = p + q;
    };
    {
      p = h + ((rotate(m, (uint)(32 - 6))) ^ (rotate(m, (uint)(32 - 11))) ^ (rotate(m, (uint)(32 - 25)))) + (g ^ (m & (f ^ g))) + 0xD5A79147 + (e[29] = ((rotate(e[29 - 2], (uint)(32 - 17))) ^ (rotate(e[29 - 2], (uint)(32 - 19))) ^ ((e[29 - 2] & Ga) >> 10)) + e[29 - 7] + ((rotate(e[29 - 15], (uint)(32 - 7))) ^ (rotate(e[29 - 15], (uint)(32 - 18))) ^ ((e[29 - 15] & Ga) >> 3)) + e[29 - 16]);
      q = ((rotate(i, (uint)(32 - 2))) ^ (rotate(i, (uint)(32 - 13))) ^ (rotate(i, (uint)(32 - 22)))) + ((i & j) | (k & (i | j)));
      l += p;
      h = p + q;
    };
    {
      p = g + ((rotate(l, (uint)(32 - 6))) ^ (rotate(l, (uint)(32 - 11))) ^ (rotate(l, (uint)(32 - 25)))) + (f ^ (l & (m ^ f))) + 0x06CA6351 + (e[30] = ((rotate(e[30 - 2], (uint)(32 - 17))) ^ (rotate(e[30 - 2], (uint)(32 - 19))) ^ ((e[30 - 2] & Ga) >> 10)) + e[30 - 7] + ((rotate(e[30 - 15], (uint)(32 - 7))) ^ (rotate(e[30 - 15], (uint)(32 - 18))) ^ ((e[30 - 15] & Ga) >> 3)) + e[30 - 16]);
      q = ((rotate(h, (uint)(32 - 2))) ^ (rotate(h, (uint)(32 - 13))) ^ (rotate(h, (uint)(32 - 22)))) + ((h & i) | (j & (h | i)));
      k += p;
      g = p + q;
    };
    {
      p = f + ((rotate(k, (uint)(32 - 6))) ^ (rotate(k, (uint)(32 - 11))) ^ (rotate(k, (uint)(32 - 25)))) + (m ^ (k & (l ^ m))) + 0x14292967 + (e[31] = ((rotate(e[31 - 2], (uint)(32 - 17))) ^ (rotate(e[31 - 2], (uint)(32 - 19))) ^ ((e[31 - 2] & Ga) >> 10)) + e[31 - 7] + ((rotate(e[31 - 15], (uint)(32 - 7))) ^ (rotate(e[31 - 15], (uint)(32 - 18))) ^ ((e[31 - 15] & Ga) >> 3)) + e[31 - 16]);
      q = ((rotate(g, (uint)(32 - 2))) ^ (rotate(g, (uint)(32 - 13))) ^ (rotate(g, (uint)(32 - 22)))) + ((g & h) | (i & (g | h)));
      j += p;
      f = p + q;
    };
    {
      p = m + ((rotate(j, (uint)(32 - 6))) ^ (rotate(j, (uint)(32 - 11))) ^ (rotate(j, (uint)(32 - 25)))) + (l ^ (j & (k ^ l))) + 0x27B70A85 + (e[32] = ((rotate(e[32 - 2], (uint)(32 - 17))) ^ (rotate(e[32 - 2], (uint)(32 - 19))) ^ ((e[32 - 2] & Ga) >> 10)) + e[32 - 7] + ((rotate(e[32 - 15], (uint)(32 - 7))) ^ (rotate(e[32 - 15], (uint)(32 - 18))) ^ ((e[32 - 15] & Ga) >> 3)) + e[32 - 16]);
      q = ((rotate(f, (uint)(32 - 2))) ^ (rotate(f, (uint)(32 - 13))) ^ (rotate(f, (uint)(32 - 22)))) + ((f & g) | (h & (f | g)));
      i += p;
      m = p + q;
    };
    {
      p = l + ((rotate(i, (uint)(32 - 6))) ^ (rotate(i, (uint)(32 - 11))) ^ (rotate(i, (uint)(32 - 25)))) + (k ^ (i & (j ^ k))) + 0x2E1B2138 + (e[33] = ((rotate(e[33 - 2], (uint)(32 - 17))) ^ (rotate(e[33 - 2], (uint)(32 - 19))) ^ ((e[33 - 2] & Ga) >> 10)) + e[33 - 7] + ((rotate(e[33 - 15], (uint)(32 - 7))) ^ (rotate(e[33 - 15], (uint)(32 - 18))) ^ ((e[33 - 15] & Ga) >> 3)) + e[33 - 16]);
      q = ((rotate(m, (uint)(32 - 2))) ^ (rotate(m, (uint)(32 - 13))) ^ (rotate(m, (uint)(32 - 22)))) + ((m & f) | (g & (m | f)));
      h += p;
      l = p + q;
    };
    {
      p = k + ((rotate(h, (uint)(32 - 6))) ^ (rotate(h, (uint)(32 - 11))) ^ (rotate(h, (uint)(32 - 25)))) + (j ^ (h & (i ^ j))) + 0x4D2C6DFC + (e[34] = ((rotate(e[34 - 2], (uint)(32 - 17))) ^ (rotate(e[34 - 2], (uint)(32 - 19))) ^ ((e[34 - 2] & Ga) >> 10)) + e[34 - 7] + ((rotate(e[34 - 15], (uint)(32 - 7))) ^ (rotate(e[34 - 15], (uint)(32 - 18))) ^ ((e[34 - 15] & Ga) >> 3)) + e[34 - 16]);
      q = ((rotate(l, (uint)(32 - 2))) ^ (rotate(l, (uint)(32 - 13))) ^ (rotate(l, (uint)(32 - 22)))) + ((l & m) | (f & (l | m)));
      g += p;
      k = p + q;
    };
    {
      p = j + ((rotate(g, (uint)(32 - 6))) ^ (rotate(g, (uint)(32 - 11))) ^ (rotate(g, (uint)(32 - 25)))) + (i ^ (g & (h ^ i))) + 0x53380D13 + (e[35] = ((rotate(e[35 - 2], (uint)(32 - 17))) ^ (rotate(e[35 - 2], (uint)(32 - 19))) ^ ((e[35 - 2] & Ga) >> 10)) + e[35 - 7] + ((rotate(e[35 - 15], (uint)(32 - 7))) ^ (rotate(e[35 - 15], (uint)(32 - 18))) ^ ((e[35 - 15] & Ga) >> 3)) + e[35 - 16]);
      q = ((rotate(k, (uint)(32 - 2))) ^ (rotate(k, (uint)(32 - 13))) ^ (rotate(k, (uint)(32 - 22)))) + ((k & l) | (m & (k | l)));
      f += p;
      j = p + q;
    };
    {
      p = i + ((rotate(f, (uint)(32 - 6))) ^ (rotate(f, (uint)(32 - 11))) ^ (rotate(f, (uint)(32 - 25)))) + (h ^ (f & (g ^ h))) + 0x650A7354 + (e[36] = ((rotate(e[36 - 2], (uint)(32 - 17))) ^ (rotate(e[36 - 2], (uint)(32 - 19))) ^ ((e[36 - 2] & Ga) >> 10)) + e[36 - 7] + ((rotate(e[36 - 15], (uint)(32 - 7))) ^ (rotate(e[36 - 15], (uint)(32 - 18))) ^ ((e[36 - 15] & Ga) >> 3)) + e[36 - 16]);
      q = ((rotate(j, (uint)(32 - 2))) ^ (rotate(j, (uint)(32 - 13))) ^ (rotate(j, (uint)(32 - 22)))) + ((j & k) | (l & (j | k)));
      m += p;
      i = p + q;
    };
    {
      p = h + ((rotate(m, (uint)(32 - 6))) ^ (rotate(m, (uint)(32 - 11))) ^ (rotate(m, (uint)(32 - 25)))) + (g ^ (m & (f ^ g))) + 0x766A0ABB + (e[37] = ((rotate(e[37 - 2], (uint)(32 - 17))) ^ (rotate(e[37 - 2], (uint)(32 - 19))) ^ ((e[37 - 2] & Ga) >> 10)) + e[37 - 7] + ((rotate(e[37 - 15], (uint)(32 - 7))) ^ (rotate(e[37 - 15], (uint)(32 - 18))) ^ ((e[37 - 15] & Ga) >> 3)) + e[37 - 16]);
      q = ((rotate(i, (uint)(32 - 2))) ^ (rotate(i, (uint)(32 - 13))) ^ (rotate(i, (uint)(32 - 22)))) + ((i & j) | (k & (i | j)));
      l += p;
      h = p + q;
    };
    {
      p = g + ((rotate(l, (uint)(32 - 6))) ^ (rotate(l, (uint)(32 - 11))) ^ (rotate(l, (uint)(32 - 25)))) + (f ^ (l & (m ^ f))) + 0x81C2C92E + (e[38] = ((rotate(e[38 - 2], (uint)(32 - 17))) ^ (rotate(e[38 - 2], (uint)(32 - 19))) ^ ((e[38 - 2] & Ga) >> 10)) + e[38 - 7] + ((rotate(e[38 - 15], (uint)(32 - 7))) ^ (rotate(e[38 - 15], (uint)(32 - 18))) ^ ((e[38 - 15] & Ga) >> 3)) + e[38 - 16]);
      q = ((rotate(h, (uint)(32 - 2))) ^ (rotate(h, (uint)(32 - 13))) ^ (rotate(h, (uint)(32 - 22)))) + ((h & i) | (j & (h | i)));
      k += p;
      g = p + q;
    };
    {
      p = f + ((rotate(k, (uint)(32 - 6))) ^ (rotate(k, (uint)(32 - 11))) ^ (rotate(k, (uint)(32 - 25)))) + (m ^ (k & (l ^ m))) + 0x92722C85 + (e[39] = ((rotate(e[39 - 2], (uint)(32 - 17))) ^ (rotate(e[39 - 2], (uint)(32 - 19))) ^ ((e[39 - 2] & Ga) >> 10)) + e[39 - 7] + ((rotate(e[39 - 15], (uint)(32 - 7))) ^ (rotate(e[39 - 15], (uint)(32 - 18))) ^ ((e[39 - 15] & Ga) >> 3)) + e[39 - 16]);
      q = ((rotate(g, (uint)(32 - 2))) ^ (rotate(g, (uint)(32 - 13))) ^ (rotate(g, (uint)(32 - 22)))) + ((g & h) | (i & (g | h)));
      j += p;
      f = p + q;
    };
    {
      p = m + ((rotate(j, (uint)(32 - 6))) ^ (rotate(j, (uint)(32 - 11))) ^ (rotate(j, (uint)(32 - 25)))) + (l ^ (j & (k ^ l))) + 0xA2BFE8A1 + (e[40] = ((rotate(e[40 - 2], (uint)(32 - 17))) ^ (rotate(e[40 - 2], (uint)(32 - 19))) ^ ((e[40 - 2] & Ga) >> 10)) + e[40 - 7] + ((rotate(e[40 - 15], (uint)(32 - 7))) ^ (rotate(e[40 - 15], (uint)(32 - 18))) ^ ((e[40 - 15] & Ga) >> 3)) + e[40 - 16]);
      q = ((rotate(f, (uint)(32 - 2))) ^ (rotate(f, (uint)(32 - 13))) ^ (rotate(f, (uint)(32 - 22)))) + ((f & g) | (h & (f | g)));
      i += p;
      m = p + q;
    };
    {
      p = l + ((rotate(i, (uint)(32 - 6))) ^ (rotate(i, (uint)(32 - 11))) ^ (rotate(i, (uint)(32 - 25)))) + (k ^ (i & (j ^ k))) + 0xA81A664B + (e[41] = ((rotate(e[41 - 2], (uint)(32 - 17))) ^ (rotate(e[41 - 2], (uint)(32 - 19))) ^ ((e[41 - 2] & Ga) >> 10)) + e[41 - 7] + ((rotate(e[41 - 15], (uint)(32 - 7))) ^ (rotate(e[41 - 15], (uint)(32 - 18))) ^ ((e[41 - 15] & Ga) >> 3)) + e[41 - 16]);
      q = ((rotate(m, (uint)(32 - 2))) ^ (rotate(m, (uint)(32 - 13))) ^ (rotate(m, (uint)(32 - 22)))) + ((m & f) | (g & (m | f)));
      h += p;
      l = p + q;
    };
    {
      p = k + ((rotate(h, (uint)(32 - 6))) ^ (rotate(h, (uint)(32 - 11))) ^ (rotate(h, (uint)(32 - 25)))) + (j ^ (h & (i ^ j))) + 0xC24B8B70 + (e[42] = ((rotate(e[42 - 2], (uint)(32 - 17))) ^ (rotate(e[42 - 2], (uint)(32 - 19))) ^ ((e[42 - 2] & Ga) >> 10)) + e[42 - 7] + ((rotate(e[42 - 15], (uint)(32 - 7))) ^ (rotate(e[42 - 15], (uint)(32 - 18))) ^ ((e[42 - 15] & Ga) >> 3)) + e[42 - 16]);
      q = ((rotate(l, (uint)(32 - 2))) ^ (rotate(l, (uint)(32 - 13))) ^ (rotate(l, (uint)(32 - 22)))) + ((l & m) | (f & (l | m)));
      g += p;
      k = p + q;
    };
    {
      p = j + ((rotate(g, (uint)(32 - 6))) ^ (rotate(g, (uint)(32 - 11))) ^ (rotate(g, (uint)(32 - 25)))) + (i ^ (g & (h ^ i))) + 0xC76C51A3 + (e[43] = ((rotate(e[43 - 2], (uint)(32 - 17))) ^ (rotate(e[43 - 2], (uint)(32 - 19))) ^ ((e[43 - 2] & Ga) >> 10)) + e[43 - 7] + ((rotate(e[43 - 15], (uint)(32 - 7))) ^ (rotate(e[43 - 15], (uint)(32 - 18))) ^ ((e[43 - 15] & Ga) >> 3)) + e[43 - 16]);
      q = ((rotate(k, (uint)(32 - 2))) ^ (rotate(k, (uint)(32 - 13))) ^ (rotate(k, (uint)(32 - 22)))) + ((k & l) | (m & (k | l)));
      f += p;
      j = p + q;
    };
    {
      p = i + ((rotate(f, (uint)(32 - 6))) ^ (rotate(f, (uint)(32 - 11))) ^ (rotate(f, (uint)(32 - 25)))) + (h ^ (f & (g ^ h))) + 0xD192E819 + (e[44] = ((rotate(e[44 - 2], (uint)(32 - 17))) ^ (rotate(e[44 - 2], (uint)(32 - 19))) ^ ((e[44 - 2] & Ga) >> 10)) + e[44 - 7] + ((rotate(e[44 - 15], (uint)(32 - 7))) ^ (rotate(e[44 - 15], (uint)(32 - 18))) ^ ((e[44 - 15] & Ga) >> 3)) + e[44 - 16]);
      q = ((rotate(j, (uint)(32 - 2))) ^ (rotate(j, (uint)(32 - 13))) ^ (rotate(j, (uint)(32 - 22)))) + ((j & k) | (l & (j | k)));
      m += p;
      i = p + q;
    };
    {
      p = h + ((rotate(m, (uint)(32 - 6))) ^ (rotate(m, (uint)(32 - 11))) ^ (rotate(m, (uint)(32 - 25)))) + (g ^ (m & (f ^ g))) + 0xD6990624 + (e[45] = ((rotate(e[45 - 2], (uint)(32 - 17))) ^ (rotate(e[45 - 2], (uint)(32 - 19))) ^ ((e[45 - 2] & Ga) >> 10)) + e[45 - 7] + ((rotate(e[45 - 15], (uint)(32 - 7))) ^ (rotate(e[45 - 15], (uint)(32 - 18))) ^ ((e[45 - 15] & Ga) >> 3)) + e[45 - 16]);
      q = ((rotate(i, (uint)(32 - 2))) ^ (rotate(i, (uint)(32 - 13))) ^ (rotate(i, (uint)(32 - 22)))) + ((i & j) | (k & (i | j)));
      l += p;
      h = p + q;
    };
    {
      p = g + ((rotate(l, (uint)(32 - 6))) ^ (rotate(l, (uint)(32 - 11))) ^ (rotate(l, (uint)(32 - 25)))) + (f ^ (l & (m ^ f))) + 0xF40E3585 + (e[46] = ((rotate(e[46 - 2], (uint)(32 - 17))) ^ (rotate(e[46 - 2], (uint)(32 - 19))) ^ ((e[46 - 2] & Ga) >> 10)) + e[46 - 7] + ((rotate(e[46 - 15], (uint)(32 - 7))) ^ (rotate(e[46 - 15], (uint)(32 - 18))) ^ ((e[46 - 15] & Ga) >> 3)) + e[46 - 16]);
      q = ((rotate(h, (uint)(32 - 2))) ^ (rotate(h, (uint)(32 - 13))) ^ (rotate(h, (uint)(32 - 22)))) + ((h & i) | (j & (h | i)));
      k += p;
      g = p + q;
    };
    {
      p = f + ((rotate(k, (uint)(32 - 6))) ^ (rotate(k, (uint)(32 - 11))) ^ (rotate(k, (uint)(32 - 25)))) + (m ^ (k & (l ^ m))) + 0x106AA070 + (e[47] = ((rotate(e[47 - 2], (uint)(32 - 17))) ^ (rotate(e[47 - 2], (uint)(32 - 19))) ^ ((e[47 - 2] & Ga) >> 10)) + e[47 - 7] + ((rotate(e[47 - 15], (uint)(32 - 7))) ^ (rotate(e[47 - 15], (uint)(32 - 18))) ^ ((e[47 - 15] & Ga) >> 3)) + e[47 - 16]);
      q = ((rotate(g, (uint)(32 - 2))) ^ (rotate(g, (uint)(32 - 13))) ^ (rotate(g, (uint)(32 - 22)))) + ((g & h) | (i & (g | h)));
      j += p;
      f = p + q;
    };
    {
      p = m + ((rotate(j, (uint)(32 - 6))) ^ (rotate(j, (uint)(32 - 11))) ^ (rotate(j, (uint)(32 - 25)))) + (l ^ (j & (k ^ l))) + 0x19A4C116 + (e[48] = ((rotate(e[48 - 2], (uint)(32 - 17))) ^ (rotate(e[48 - 2], (uint)(32 - 19))) ^ ((e[48 - 2] & Ga) >> 10)) + e[48 - 7] + ((rotate(e[48 - 15], (uint)(32 - 7))) ^ (rotate(e[48 - 15], (uint)(32 - 18))) ^ ((e[48 - 15] & Ga) >> 3)) + e[48 - 16]);
      q = ((rotate(f, (uint)(32 - 2))) ^ (rotate(f, (uint)(32 - 13))) ^ (rotate(f, (uint)(32 - 22)))) + ((f & g) | (h & (f | g)));
      i += p;
      m = p + q;
    };
    {
      p = l + ((rotate(i, (uint)(32 - 6))) ^ (rotate(i, (uint)(32 - 11))) ^ (rotate(i, (uint)(32 - 25)))) + (k ^ (i & (j ^ k))) + 0x1E376C08 + (e[49] = ((rotate(e[49 - 2], (uint)(32 - 17))) ^ (rotate(e[49 - 2], (uint)(32 - 19))) ^ ((e[49 - 2] & Ga) >> 10)) + e[49 - 7] + ((rotate(e[49 - 15], (uint)(32 - 7))) ^ (rotate(e[49 - 15], (uint)(32 - 18))) ^ ((e[49 - 15] & Ga) >> 3)) + e[49 - 16]);
      q = ((rotate(m, (uint)(32 - 2))) ^ (rotate(m, (uint)(32 - 13))) ^ (rotate(m, (uint)(32 - 22)))) + ((m & f) | (g & (m | f)));
      h += p;
      l = p + q;
    };
    {
      p = k + ((rotate(h, (uint)(32 - 6))) ^ (rotate(h, (uint)(32 - 11))) ^ (rotate(h, (uint)(32 - 25)))) + (j ^ (h & (i ^ j))) + 0x2748774C + (e[50] = ((rotate(e[50 - 2], (uint)(32 - 17))) ^ (rotate(e[50 - 2], (uint)(32 - 19))) ^ ((e[50 - 2] & Ga) >> 10)) + e[50 - 7] + ((rotate(e[50 - 15], (uint)(32 - 7))) ^ (rotate(e[50 - 15], (uint)(32 - 18))) ^ ((e[50 - 15] & Ga) >> 3)) + e[50 - 16]);
      q = ((rotate(l, (uint)(32 - 2))) ^ (rotate(l, (uint)(32 - 13))) ^ (rotate(l, (uint)(32 - 22)))) + ((l & m) | (f & (l | m)));
      g += p;
      k = p + q;
    };
    {
      p = j + ((rotate(g, (uint)(32 - 6))) ^ (rotate(g, (uint)(32 - 11))) ^ (rotate(g, (uint)(32 - 25)))) + (i ^ (g & (h ^ i))) + 0x34B0BCB5 + (e[51] = ((rotate(e[51 - 2], (uint)(32 - 17))) ^ (rotate(e[51 - 2], (uint)(32 - 19))) ^ ((e[51 - 2] & Ga) >> 10)) + e[51 - 7] + ((rotate(e[51 - 15], (uint)(32 - 7))) ^ (rotate(e[51 - 15], (uint)(32 - 18))) ^ ((e[51 - 15] & Ga) >> 3)) + e[51 - 16]);
      q = ((rotate(k, (uint)(32 - 2))) ^ (rotate(k, (uint)(32 - 13))) ^ (rotate(k, (uint)(32 - 22)))) + ((k & l) | (m & (k | l)));
      f += p;
      j = p + q;
    };
    {
      p = i + ((rotate(f, (uint)(32 - 6))) ^ (rotate(f, (uint)(32 - 11))) ^ (rotate(f, (uint)(32 - 25)))) + (h ^ (f & (g ^ h))) + 0x391C0CB3 + (e[52] = ((rotate(e[52 - 2], (uint)(32 - 17))) ^ (rotate(e[52 - 2], (uint)(32 - 19))) ^ ((e[52 - 2] & Ga) >> 10)) + e[52 - 7] + ((rotate(e[52 - 15], (uint)(32 - 7))) ^ (rotate(e[52 - 15], (uint)(32 - 18))) ^ ((e[52 - 15] & Ga) >> 3)) + e[52 - 16]);
      q = ((rotate(j, (uint)(32 - 2))) ^ (rotate(j, (uint)(32 - 13))) ^ (rotate(j, (uint)(32 - 22)))) + ((j & k) | (l & (j | k)));
      m += p;
      i = p + q;
    };
    {
      p = h + ((rotate(m, (uint)(32 - 6))) ^ (rotate(m, (uint)(32 - 11))) ^ (rotate(m, (uint)(32 - 25)))) + (g ^ (m & (f ^ g))) + 0x4ED8AA4A + (e[53] = ((rotate(e[53 - 2], (uint)(32 - 17))) ^ (rotate(e[53 - 2], (uint)(32 - 19))) ^ ((e[53 - 2] & Ga) >> 10)) + e[53 - 7] + ((rotate(e[53 - 15], (uint)(32 - 7))) ^ (rotate(e[53 - 15], (uint)(32 - 18))) ^ ((e[53 - 15] & Ga) >> 3)) + e[53 - 16]);
      q = ((rotate(i, (uint)(32 - 2))) ^ (rotate(i, (uint)(32 - 13))) ^ (rotate(i, (uint)(32 - 22)))) + ((i & j) | (k & (i | j)));
      l += p;
      h = p + q;
    };
    {
      p = g + ((rotate(l, (uint)(32 - 6))) ^ (rotate(l, (uint)(32 - 11))) ^ (rotate(l, (uint)(32 - 25)))) + (f ^ (l & (m ^ f))) + 0x5B9CCA4F + (e[54] = ((rotate(e[54 - 2], (uint)(32 - 17))) ^ (rotate(e[54 - 2], (uint)(32 - 19))) ^ ((e[54 - 2] & Ga) >> 10)) + e[54 - 7] + ((rotate(e[54 - 15], (uint)(32 - 7))) ^ (rotate(e[54 - 15], (uint)(32 - 18))) ^ ((e[54 - 15] & Ga) >> 3)) + e[54 - 16]);
      q = ((rotate(h, (uint)(32 - 2))) ^ (rotate(h, (uint)(32 - 13))) ^ (rotate(h, (uint)(32 - 22)))) + ((h & i) | (j & (h | i)));
      k += p;
      g = p + q;
    };
    {
      p = f + ((rotate(k, (uint)(32 - 6))) ^ (rotate(k, (uint)(32 - 11))) ^ (rotate(k, (uint)(32 - 25)))) + (m ^ (k & (l ^ m))) + 0x682E6FF3 + (e[55] = ((rotate(e[55 - 2], (uint)(32 - 17))) ^ (rotate(e[55 - 2], (uint)(32 - 19))) ^ ((e[55 - 2] & Ga) >> 10)) + e[55 - 7] + ((rotate(e[55 - 15], (uint)(32 - 7))) ^ (rotate(e[55 - 15], (uint)(32 - 18))) ^ ((e[55 - 15] & Ga) >> 3)) + e[55 - 16]);
      q = ((rotate(g, (uint)(32 - 2))) ^ (rotate(g, (uint)(32 - 13))) ^ (rotate(g, (uint)(32 - 22)))) + ((g & h) | (i & (g | h)));
      j += p;
      f = p + q;
    };
    {
      p = m + ((rotate(j, (uint)(32 - 6))) ^ (rotate(j, (uint)(32 - 11))) ^ (rotate(j, (uint)(32 - 25)))) + (l ^ (j & (k ^ l))) + 0x748F82EE + (e[56] = ((rotate(e[56 - 2], (uint)(32 - 17))) ^ (rotate(e[56 - 2], (uint)(32 - 19))) ^ ((e[56 - 2] & Ga) >> 10)) + e[56 - 7] + ((rotate(e[56 - 15], (uint)(32 - 7))) ^ (rotate(e[56 - 15], (uint)(32 - 18))) ^ ((e[56 - 15] & Ga) >> 3)) + e[56 - 16]);
      q = ((rotate(f, (uint)(32 - 2))) ^ (rotate(f, (uint)(32 - 13))) ^ (rotate(f, (uint)(32 - 22)))) + ((f & g) | (h & (f | g)));
      i += p;
      m = p + q;
    };
    {
      p = l + ((rotate(i, (uint)(32 - 6))) ^ (rotate(i, (uint)(32 - 11))) ^ (rotate(i, (uint)(32 - 25)))) + (k ^ (i & (j ^ k))) + 0x78A5636F + (e[57] = ((rotate(e[57 - 2], (uint)(32 - 17))) ^ (rotate(e[57 - 2], (uint)(32 - 19))) ^ ((e[57 - 2] & Ga) >> 10)) + e[57 - 7] + ((rotate(e[57 - 15], (uint)(32 - 7))) ^ (rotate(e[57 - 15], (uint)(32 - 18))) ^ ((e[57 - 15] & Ga) >> 3)) + e[57 - 16]);
      q = ((rotate(m, (uint)(32 - 2))) ^ (rotate(m, (uint)(32 - 13))) ^ (rotate(m, (uint)(32 - 22)))) + ((m & f) | (g & (m | f)));
      h += p;
      l = p + q;
    };
    {
      p = k + ((rotate(h, (uint)(32 - 6))) ^ (rotate(h, (uint)(32 - 11))) ^ (rotate(h, (uint)(32 - 25)))) + (j ^ (h & (i ^ j))) + 0x84C87814 + (e[58] = ((rotate(e[58 - 2], (uint)(32 - 17))) ^ (rotate(e[58 - 2], (uint)(32 - 19))) ^ ((e[58 - 2] & Ga) >> 10)) + e[58 - 7] + ((rotate(e[58 - 15], (uint)(32 - 7))) ^ (rotate(e[58 - 15], (uint)(32 - 18))) ^ ((e[58 - 15] & Ga) >> 3)) + e[58 - 16]);
      q = ((rotate(l, (uint)(32 - 2))) ^ (rotate(l, (uint)(32 - 13))) ^ (rotate(l, (uint)(32 - 22)))) + ((l & m) | (f & (l | m)));
      g += p;
      k = p + q;
    };
    {
      p = j + ((rotate(g, (uint)(32 - 6))) ^ (rotate(g, (uint)(32 - 11))) ^ (rotate(g, (uint)(32 - 25)))) + (i ^ (g & (h ^ i))) + 0x8CC70208 + (e[59] = ((rotate(e[59 - 2], (uint)(32 - 17))) ^ (rotate(e[59 - 2], (uint)(32 - 19))) ^ ((e[59 - 2] & Ga) >> 10)) + e[59 - 7] + ((rotate(e[59 - 15], (uint)(32 - 7))) ^ (rotate(e[59 - 15], (uint)(32 - 18))) ^ ((e[59 - 15] & Ga) >> 3)) + e[59 - 16]);
      q = ((rotate(k, (uint)(32 - 2))) ^ (rotate(k, (uint)(32 - 13))) ^ (rotate(k, (uint)(32 - 22)))) + ((k & l) | (m & (k | l)));
      f += p;
      j = p + q;
    };
    {
      p = i + ((rotate(f, (uint)(32 - 6))) ^ (rotate(f, (uint)(32 - 11))) ^ (rotate(f, (uint)(32 - 25)))) + (h ^ (f & (g ^ h))) + 0x90BEFFFA + (e[60] = ((rotate(e[60 - 2], (uint)(32 - 17))) ^ (rotate(e[60 - 2], (uint)(32 - 19))) ^ ((e[60 - 2] & Ga) >> 10)) + e[60 - 7] + ((rotate(e[60 - 15], (uint)(32 - 7))) ^ (rotate(e[60 - 15], (uint)(32 - 18))) ^ ((e[60 - 15] & Ga) >> 3)) + e[60 - 16]);
      q = ((rotate(j, (uint)(32 - 2))) ^ (rotate(j, (uint)(32 - 13))) ^ (rotate(j, (uint)(32 - 22)))) + ((j & k) | (l & (j | k)));
      m += p;
      i = p + q;
    };
    {
      p = h + ((rotate(m, (uint)(32 - 6))) ^ (rotate(m, (uint)(32 - 11))) ^ (rotate(m, (uint)(32 - 25)))) + (g ^ (m & (f ^ g))) + 0xA4506CEB + (e[61] = ((rotate(e[61 - 2], (uint)(32 - 17))) ^ (rotate(e[61 - 2], (uint)(32 - 19))) ^ ((e[61 - 2] & Ga) >> 10)) + e[61 - 7] + ((rotate(e[61 - 15], (uint)(32 - 7))) ^ (rotate(e[61 - 15], (uint)(32 - 18))) ^ ((e[61 - 15] & Ga) >> 3)) + e[61 - 16]);
      q = ((rotate(i, (uint)(32 - 2))) ^ (rotate(i, (uint)(32 - 13))) ^ (rotate(i, (uint)(32 - 22)))) + ((i & j) | (k & (i | j)));
      l += p;
      h = p + q;
    };

    m += 0x5be0cd19;

    if ((m == 0)) {
      r = o + aa;
    }
  }

  b[n].m_bestnonce = r;
}
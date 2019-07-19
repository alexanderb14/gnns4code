typedef uchar uint8_t; typedef char int8_t; typedef ushort uint16_t; typedef short int16_t; typedef uint uint32_t; typedef int int32_t; typedef ulong uint64_t; typedef long int64_t; typedef uint32_t host_size_t; typedef struct dyna_salt_t {
  host_size_t salt_cmp_size;
  host_size_t bitfield_and_offset;
} dyna_salt;
inline uint A(uint a) {
  return bitselect(rotate(a, 24U), rotate(a, 8U), 0x00FF00FFU);
}
__kernel void B(__global uint* a, __constant uint* b, __global const uint* c, __global uint* d) {
  uint e[16] = {0}, f[3], g[5];
  uint h, i, j, k, l, m;
  uint n = get_global_id(0);
  uint o = c[n];
  uint p = o & 63;
  uint q;
  uint r = p % 4;
  uint s = 8 * r;
  uint t = 32 - s;
  uint u = (0xffffffff - (1 << s)) + 1;
  uint v = 0xffffffff - u;

  a += o >> 6;

  for (q = 0; q < (p + 3) / 4; q++)
    e[q] = A(*a++);

  f[0] = A(*b++);
  f[1] = A(*b++);
  f[2] = A(*b);

  e[p / 4] |= (f[0] & u) >> s;
  e[p / 4 + 1] = ((f[0] & v) << t) | ((f[1] & u) >> s);
  e[p / 4 + 2] = ((f[1] & v) << t) | ((f[2] & u) >> s);
  e[p / 4 + 3] = (f[2] & v) << t;

  e[15] = (p + 10) << 3;

  {
    i = 0x67452301;
    j = 0xefcdab89;
    k = 0x98badcfe;
    l = 0x10325476;
    m = 0xc3d2e1f0;
    {
      m += rotate(i, 5U) + bitselect(l, k, j) + 0x5a827999 + e[0];
      j = rotate(j, 30U);
    };
    {
      l += rotate(m, 5U) + bitselect(k, j, i) + 0x5a827999 + e[1];
      i = rotate(i, 30U);
    };
    {
      k += rotate(l, 5U) + bitselect(j, i, m) + 0x5a827999 + e[2];
      m = rotate(m, 30U);
    };
    {
      j += rotate(k, 5U) + bitselect(i, m, l) + 0x5a827999 + e[3];
      l = rotate(l, 30U);
    };
    {
      i += rotate(j, 5U) + bitselect(m, l, k) + 0x5a827999 + e[4];
      k = rotate(k, 30U);
    };
    {
      m += rotate(i, 5U) + bitselect(l, k, j) + 0x5a827999 + e[5];
      j = rotate(j, 30U);
    };
    {
      l += rotate(m, 5U) + bitselect(k, j, i) + 0x5a827999 + e[6];
      i = rotate(i, 30U);
    };
    {
      k += rotate(l, 5U) + bitselect(j, i, m) + 0x5a827999 + e[7];
      m = rotate(m, 30U);
    };
    {
      j += rotate(k, 5U) + bitselect(i, m, l) + 0x5a827999 + e[8];
      l = rotate(l, 30U);
    };
    {
      i += rotate(j, 5U) + bitselect(m, l, k) + 0x5a827999 + e[9];
      k = rotate(k, 30U);
    };
    {
      m += rotate(i, 5U) + bitselect(l, k, j) + 0x5a827999 + e[10];
      j = rotate(j, 30U);
    };
    {
      l += rotate(m, 5U) + bitselect(k, j, i) + 0x5a827999 + e[11];
      i = rotate(i, 30U);
    };
    {
      k += rotate(l, 5U) + bitselect(j, i, m) + 0x5a827999 + e[12];
      m = rotate(m, 30U);
    };
    {
      j += rotate(k, 5U) + bitselect(i, m, l) + 0x5a827999 + e[13];
      l = rotate(l, 30U);
    };
    {
      i += rotate(j, 5U) + bitselect(m, l, k) + 0x5a827999 + e[14];
      k = rotate(k, 30U);
    };
    {
      m += rotate(i, 5U) + bitselect(l, k, j) + 0x5a827999 + e[15];
      j = rotate(j, 30U);
    };
    {
      l += rotate(m, 5U) + bitselect(k, j, i) + 0x5a827999 + (h = e[(16 - 3) & 0x0F] ^ e[(16 - 8) & 0x0F] ^ e[(16 - 14) & 0x0F] ^ e[16 & 0x0F], (e[16 & 0x0F] = rotate(h, 1U)));
      i = rotate(i, 30U);
    };
    {
      k += rotate(l, 5U) + bitselect(j, i, m) + 0x5a827999 + (h = e[(17 - 3) & 0x0F] ^ e[(17 - 8) & 0x0F] ^ e[(17 - 14) & 0x0F] ^ e[17 & 0x0F], (e[17 & 0x0F] = rotate(h, 1U)));
      m = rotate(m, 30U);
    };
    {
      j += rotate(k, 5U) + bitselect(i, m, l) + 0x5a827999 + (h = e[(18 - 3) & 0x0F] ^ e[(18 - 8) & 0x0F] ^ e[(18 - 14) & 0x0F] ^ e[18 & 0x0F], (e[18 & 0x0F] = rotate(h, 1U)));
      l = rotate(l, 30U);
    };
    {
      i += rotate(j, 5U) + bitselect(m, l, k) + 0x5a827999 + (h = e[(19 - 3) & 0x0F] ^ e[(19 - 8) & 0x0F] ^ e[(19 - 14) & 0x0F] ^ e[19 & 0x0F], (e[19 & 0x0F] = rotate(h, 1U)));
      k = rotate(k, 30U);
    };
    {
      m += rotate(i, 5U) + (j ^ k ^ l) + 0x6ed9eba1 + (h = e[(20 - 3) & 0x0F] ^ e[(20 - 8) & 0x0F] ^ e[(20 - 14) & 0x0F] ^ e[20 & 0x0F], (e[20 & 0x0F] = rotate(h, 1U)));
      j = rotate(j, 30U);
    };
    {
      l += rotate(m, 5U) + (i ^ j ^ k) + 0x6ed9eba1 + (h = e[(21 - 3) & 0x0F] ^ e[(21 - 8) & 0x0F] ^ e[(21 - 14) & 0x0F] ^ e[21 & 0x0F], (e[21 & 0x0F] = rotate(h, 1U)));
      i = rotate(i, 30U);
    };
    {
      k += rotate(l, 5U) + (m ^ i ^ j) + 0x6ed9eba1 + (h = e[(22 - 3) & 0x0F] ^ e[(22 - 8) & 0x0F] ^ e[(22 - 14) & 0x0F] ^ e[22 & 0x0F], (e[22 & 0x0F] = rotate(h, 1U)));
      m = rotate(m, 30U);
    };
    {
      j += rotate(k, 5U) + (l ^ m ^ i) + 0x6ed9eba1 + (h = e[(23 - 3) & 0x0F] ^ e[(23 - 8) & 0x0F] ^ e[(23 - 14) & 0x0F] ^ e[23 & 0x0F], (e[23 & 0x0F] = rotate(h, 1U)));
      l = rotate(l, 30U);
    };
    {
      i += rotate(j, 5U) + (k ^ l ^ m) + 0x6ed9eba1 + (h = e[(24 - 3) & 0x0F] ^ e[(24 - 8) & 0x0F] ^ e[(24 - 14) & 0x0F] ^ e[24 & 0x0F], (e[24 & 0x0F] = rotate(h, 1U)));
      k = rotate(k, 30U);
    };
    {
      m += rotate(i, 5U) + (j ^ k ^ l) + 0x6ed9eba1 + (h = e[(25 - 3) & 0x0F] ^ e[(25 - 8) & 0x0F] ^ e[(25 - 14) & 0x0F] ^ e[25 & 0x0F], (e[25 & 0x0F] = rotate(h, 1U)));
      j = rotate(j, 30U);
    };
    {
      l += rotate(m, 5U) + (i ^ j ^ k) + 0x6ed9eba1 + (h = e[(26 - 3) & 0x0F] ^ e[(26 - 8) & 0x0F] ^ e[(26 - 14) & 0x0F] ^ e[26 & 0x0F], (e[26 & 0x0F] = rotate(h, 1U)));
      i = rotate(i, 30U);
    };
    {
      k += rotate(l, 5U) + (m ^ i ^ j) + 0x6ed9eba1 + (h = e[(27 - 3) & 0x0F] ^ e[(27 - 8) & 0x0F] ^ e[(27 - 14) & 0x0F] ^ e[27 & 0x0F], (e[27 & 0x0F] = rotate(h, 1U)));
      m = rotate(m, 30U);
    };
    {
      j += rotate(k, 5U) + (l ^ m ^ i) + 0x6ed9eba1 + (h = e[(28 - 3) & 0x0F] ^ e[(28 - 8) & 0x0F] ^ e[(28 - 14) & 0x0F] ^ e[28 & 0x0F], (e[28 & 0x0F] = rotate(h, 1U)));
      l = rotate(l, 30U);
    };
    {
      i += rotate(j, 5U) + (k ^ l ^ m) + 0x6ed9eba1 + (h = e[(29 - 3) & 0x0F] ^ e[(29 - 8) & 0x0F] ^ e[(29 - 14) & 0x0F] ^ e[29 & 0x0F], (e[29 & 0x0F] = rotate(h, 1U)));
      k = rotate(k, 30U);
    };
    {
      m += rotate(i, 5U) + (j ^ k ^ l) + 0x6ed9eba1 + (h = e[(30 - 3) & 0x0F] ^ e[(30 - 8) & 0x0F] ^ e[(30 - 14) & 0x0F] ^ e[30 & 0x0F], (e[30 & 0x0F] = rotate(h, 1U)));
      j = rotate(j, 30U);
    };
    {
      l += rotate(m, 5U) + (i ^ j ^ k) + 0x6ed9eba1 + (h = e[(31 - 3) & 0x0F] ^ e[(31 - 8) & 0x0F] ^ e[(31 - 14) & 0x0F] ^ e[31 & 0x0F], (e[31 & 0x0F] = rotate(h, 1U)));
      i = rotate(i, 30U);
    };
    {
      k += rotate(l, 5U) + (m ^ i ^ j) + 0x6ed9eba1 + (h = e[(32 - 3) & 0x0F] ^ e[(32 - 8) & 0x0F] ^ e[(32 - 14) & 0x0F] ^ e[32 & 0x0F], (e[32 & 0x0F] = rotate(h, 1U)));
      m = rotate(m, 30U);
    };
    {
      j += rotate(k, 5U) + (l ^ m ^ i) + 0x6ed9eba1 + (h = e[(33 - 3) & 0x0F] ^ e[(33 - 8) & 0x0F] ^ e[(33 - 14) & 0x0F] ^ e[33 & 0x0F], (e[33 & 0x0F] = rotate(h, 1U)));
      l = rotate(l, 30U);
    };
    {
      i += rotate(j, 5U) + (k ^ l ^ m) + 0x6ed9eba1 + (h = e[(34 - 3) & 0x0F] ^ e[(34 - 8) & 0x0F] ^ e[(34 - 14) & 0x0F] ^ e[34 & 0x0F], (e[34 & 0x0F] = rotate(h, 1U)));
      k = rotate(k, 30U);
    };
    {
      m += rotate(i, 5U) + (j ^ k ^ l) + 0x6ed9eba1 + (h = e[(35 - 3) & 0x0F] ^ e[(35 - 8) & 0x0F] ^ e[(35 - 14) & 0x0F] ^ e[35 & 0x0F], (e[35 & 0x0F] = rotate(h, 1U)));
      j = rotate(j, 30U);
    };
    {
      l += rotate(m, 5U) + (i ^ j ^ k) + 0x6ed9eba1 + (h = e[(36 - 3) & 0x0F] ^ e[(36 - 8) & 0x0F] ^ e[(36 - 14) & 0x0F] ^ e[36 & 0x0F], (e[36 & 0x0F] = rotate(h, 1U)));
      i = rotate(i, 30U);
    };
    {
      k += rotate(l, 5U) + (m ^ i ^ j) + 0x6ed9eba1 + (h = e[(37 - 3) & 0x0F] ^ e[(37 - 8) & 0x0F] ^ e[(37 - 14) & 0x0F] ^ e[37 & 0x0F], (e[37 & 0x0F] = rotate(h, 1U)));
      m = rotate(m, 30U);
    };
    {
      j += rotate(k, 5U) + (l ^ m ^ i) + 0x6ed9eba1 + (h = e[(38 - 3) & 0x0F] ^ e[(38 - 8) & 0x0F] ^ e[(38 - 14) & 0x0F] ^ e[38 & 0x0F], (e[38 & 0x0F] = rotate(h, 1U)));
      l = rotate(l, 30U);
    };
    {
      i += rotate(j, 5U) + (k ^ l ^ m) + 0x6ed9eba1 + (h = e[(39 - 3) & 0x0F] ^ e[(39 - 8) & 0x0F] ^ e[(39 - 14) & 0x0F] ^ e[39 & 0x0F], (e[39 & 0x0F] = rotate(h, 1U)));
      k = rotate(k, 30U);
    };
    {
      m += rotate(i, 5U) + bitselect(j, k, (l) ^ (j)) + 0x8f1bbcdc + (h = e[(40 - 3) & 0x0F] ^ e[(40 - 8) & 0x0F] ^ e[(40 - 14) & 0x0F] ^ e[40 & 0x0F], (e[40 & 0x0F] = rotate(h, 1U)));
      j = rotate(j, 30U);
    };
    {
      l += rotate(m, 5U) + bitselect(i, j, (k) ^ (i)) + 0x8f1bbcdc + (h = e[(41 - 3) & 0x0F] ^ e[(41 - 8) & 0x0F] ^ e[(41 - 14) & 0x0F] ^ e[41 & 0x0F], (e[41 & 0x0F] = rotate(h, 1U)));
      i = rotate(i, 30U);
    };
    {
      k += rotate(l, 5U) + bitselect(m, i, (j) ^ (m)) + 0x8f1bbcdc + (h = e[(42 - 3) & 0x0F] ^ e[(42 - 8) & 0x0F] ^ e[(42 - 14) & 0x0F] ^ e[42 & 0x0F], (e[42 & 0x0F] = rotate(h, 1U)));
      m = rotate(m, 30U);
    };
    {
      j += rotate(k, 5U) + bitselect(l, m, (i) ^ (l)) + 0x8f1bbcdc + (h = e[(43 - 3) & 0x0F] ^ e[(43 - 8) & 0x0F] ^ e[(43 - 14) & 0x0F] ^ e[43 & 0x0F], (e[43 & 0x0F] = rotate(h, 1U)));
      l = rotate(l, 30U);
    };
    {
      i += rotate(j, 5U) + bitselect(k, l, (m) ^ (k)) + 0x8f1bbcdc + (h = e[(44 - 3) & 0x0F] ^ e[(44 - 8) & 0x0F] ^ e[(44 - 14) & 0x0F] ^ e[44 & 0x0F], (e[44 & 0x0F] = rotate(h, 1U)));
      k = rotate(k, 30U);
    };
    {
      m += rotate(i, 5U) + bitselect(j, k, (l) ^ (j)) + 0x8f1bbcdc + (h = e[(45 - 3) & 0x0F] ^ e[(45 - 8) & 0x0F] ^ e[(45 - 14) & 0x0F] ^ e[45 & 0x0F], (e[45 & 0x0F] = rotate(h, 1U)));
      j = rotate(j, 30U);
    };
    {
      l += rotate(m, 5U) + bitselect(i, j, (k) ^ (i)) + 0x8f1bbcdc + (h = e[(46 - 3) & 0x0F] ^ e[(46 - 8) & 0x0F] ^ e[(46 - 14) & 0x0F] ^ e[46 & 0x0F], (e[46 & 0x0F] = rotate(h, 1U)));
      i = rotate(i, 30U);
    };
    {
      k += rotate(l, 5U) + bitselect(m, i, (j) ^ (m)) + 0x8f1bbcdc + (h = e[(47 - 3) & 0x0F] ^ e[(47 - 8) & 0x0F] ^ e[(47 - 14) & 0x0F] ^ e[47 & 0x0F], (e[47 & 0x0F] = rotate(h, 1U)));
      m = rotate(m, 30U);
    };
    {
      j += rotate(k, 5U) + bitselect(l, m, (i) ^ (l)) + 0x8f1bbcdc + (h = e[(48 - 3) & 0x0F] ^ e[(48 - 8) & 0x0F] ^ e[(48 - 14) & 0x0F] ^ e[48 & 0x0F], (e[48 & 0x0F] = rotate(h, 1U)));
      l = rotate(l, 30U);
    };
    {
      i += rotate(j, 5U) + bitselect(k, l, (m) ^ (k)) + 0x8f1bbcdc + (h = e[(49 - 3) & 0x0F] ^ e[(49 - 8) & 0x0F] ^ e[(49 - 14) & 0x0F] ^ e[49 & 0x0F], (e[49 & 0x0F] = rotate(h, 1U)));
      k = rotate(k, 30U);
    };
    {
      m += rotate(i, 5U) + bitselect(j, k, (l) ^ (j)) + 0x8f1bbcdc + (h = e[(50 - 3) & 0x0F] ^ e[(50 - 8) & 0x0F] ^ e[(50 - 14) & 0x0F] ^ e[50 & 0x0F], (e[50 & 0x0F] = rotate(h, 1U)));
      j = rotate(j, 30U);
    };
    {
      l += rotate(m, 5U) + bitselect(i, j, (k) ^ (i)) + 0x8f1bbcdc + (h = e[(51 - 3) & 0x0F] ^ e[(51 - 8) & 0x0F] ^ e[(51 - 14) & 0x0F] ^ e[51 & 0x0F], (e[51 & 0x0F] = rotate(h, 1U)));
      i = rotate(i, 30U);
    };
    {
      k += rotate(l, 5U) + bitselect(m, i, (j) ^ (m)) + 0x8f1bbcdc + (h = e[(52 - 3) & 0x0F] ^ e[(52 - 8) & 0x0F] ^ e[(52 - 14) & 0x0F] ^ e[52 & 0x0F], (e[52 & 0x0F] = rotate(h, 1U)));
      m = rotate(m, 30U);
    };
    {
      j += rotate(k, 5U) + bitselect(l, m, (i) ^ (l)) + 0x8f1bbcdc + (h = e[(53 - 3) & 0x0F] ^ e[(53 - 8) & 0x0F] ^ e[(53 - 14) & 0x0F] ^ e[53 & 0x0F], (e[53 & 0x0F] = rotate(h, 1U)));
      l = rotate(l, 30U);
    };
    {
      i += rotate(j, 5U) + bitselect(k, l, (m) ^ (k)) + 0x8f1bbcdc + (h = e[(54 - 3) & 0x0F] ^ e[(54 - 8) & 0x0F] ^ e[(54 - 14) & 0x0F] ^ e[54 & 0x0F], (e[54 & 0x0F] = rotate(h, 1U)));
      k = rotate(k, 30U);
    };
    {
      m += rotate(i, 5U) + bitselect(j, k, (l) ^ (j)) + 0x8f1bbcdc + (h = e[(55 - 3) & 0x0F] ^ e[(55 - 8) & 0x0F] ^ e[(55 - 14) & 0x0F] ^ e[55 & 0x0F], (e[55 & 0x0F] = rotate(h, 1U)));
      j = rotate(j, 30U);
    };
    {
      l += rotate(m, 5U) + bitselect(i, j, (k) ^ (i)) + 0x8f1bbcdc + (h = e[(56 - 3) & 0x0F] ^ e[(56 - 8) & 0x0F] ^ e[(56 - 14) & 0x0F] ^ e[56 & 0x0F], (e[56 & 0x0F] = rotate(h, 1U)));
      i = rotate(i, 30U);
    };
    {
      k += rotate(l, 5U) + bitselect(m, i, (j) ^ (m)) + 0x8f1bbcdc + (h = e[(57 - 3) & 0x0F] ^ e[(57 - 8) & 0x0F] ^ e[(57 - 14) & 0x0F] ^ e[57 & 0x0F], (e[57 & 0x0F] = rotate(h, 1U)));
      m = rotate(m, 30U);
    };
    {
      j += rotate(k, 5U) + bitselect(l, m, (i) ^ (l)) + 0x8f1bbcdc + (h = e[(58 - 3) & 0x0F] ^ e[(58 - 8) & 0x0F] ^ e[(58 - 14) & 0x0F] ^ e[58 & 0x0F], (e[58 & 0x0F] = rotate(h, 1U)));
      l = rotate(l, 30U);
    };
    {
      i += rotate(j, 5U) + bitselect(k, l, (m) ^ (k)) + 0x8f1bbcdc + (h = e[(59 - 3) & 0x0F] ^ e[(59 - 8) & 0x0F] ^ e[(59 - 14) & 0x0F] ^ e[59 & 0x0F], (e[59 & 0x0F] = rotate(h, 1U)));
      k = rotate(k, 30U);
    };
    {
      m += rotate(i, 5U) + (j ^ k ^ l) + 0xca62c1d6 + (h = e[(60 - 3) & 0x0F] ^ e[(60 - 8) & 0x0F] ^ e[(60 - 14) & 0x0F] ^ e[60 & 0x0F], (e[60 & 0x0F] = rotate(h, 1U)));
      j = rotate(j, 30U);
    };
    {
      l += rotate(m, 5U) + (i ^ j ^ k) + 0xca62c1d6 + (h = e[(61 - 3) & 0x0F] ^ e[(61 - 8) & 0x0F] ^ e[(61 - 14) & 0x0F] ^ e[61 & 0x0F], (e[61 & 0x0F] = rotate(h, 1U)));
      i = rotate(i, 30U);
    };
    {
      k += rotate(l, 5U) + (m ^ i ^ j) + 0xca62c1d6 + (h = e[(62 - 3) & 0x0F] ^ e[(62 - 8) & 0x0F] ^ e[(62 - 14) & 0x0F] ^ e[62 & 0x0F], (e[62 & 0x0F] = rotate(h, 1U)));
      m = rotate(m, 30U);
    };
    {
      j += rotate(k, 5U) + (l ^ m ^ i) + 0xca62c1d6 + (h = e[(63 - 3) & 0x0F] ^ e[(63 - 8) & 0x0F] ^ e[(63 - 14) & 0x0F] ^ e[63 & 0x0F], (e[63 & 0x0F] = rotate(h, 1U)));
      l = rotate(l, 30U);
    };
    {
      i += rotate(j, 5U) + (k ^ l ^ m) + 0xca62c1d6 + (h = e[(64 - 3) & 0x0F] ^ e[(64 - 8) & 0x0F] ^ e[(64 - 14) & 0x0F] ^ e[64 & 0x0F], (e[64 & 0x0F] = rotate(h, 1U)));
      k = rotate(k, 30U);
    };
    {
      m += rotate(i, 5U) + (j ^ k ^ l) + 0xca62c1d6 + (h = e[(65 - 3) & 0x0F] ^ e[(65 - 8) & 0x0F] ^ e[(65 - 14) & 0x0F] ^ e[65 & 0x0F], (e[65 & 0x0F] = rotate(h, 1U)));
      j = rotate(j, 30U);
    };
    {
      l += rotate(m, 5U) + (i ^ j ^ k) + 0xca62c1d6 + (h = e[(66 - 3) & 0x0F] ^ e[(66 - 8) & 0x0F] ^ e[(66 - 14) & 0x0F] ^ e[66 & 0x0F], (e[66 & 0x0F] = rotate(h, 1U)));
      i = rotate(i, 30U);
    };
    {
      k += rotate(l, 5U) + (m ^ i ^ j) + 0xca62c1d6 + (h = e[(67 - 3) & 0x0F] ^ e[(67 - 8) & 0x0F] ^ e[(67 - 14) & 0x0F] ^ e[67 & 0x0F], (e[67 & 0x0F] = rotate(h, 1U)));
      m = rotate(m, 30U);
    };
    {
      j += rotate(k, 5U) + (l ^ m ^ i) + 0xca62c1d6 + (h = e[(68 - 3) & 0x0F] ^ e[(68 - 8) & 0x0F] ^ e[(68 - 14) & 0x0F] ^ e[68 & 0x0F], (e[68 & 0x0F] = rotate(h, 1U)));
      l = rotate(l, 30U);
    };
    {
      i += rotate(j, 5U) + (k ^ l ^ m) + 0xca62c1d6 + (h = e[(69 - 3) & 0x0F] ^ e[(69 - 8) & 0x0F] ^ e[(69 - 14) & 0x0F] ^ e[69 & 0x0F], (e[69 & 0x0F] = rotate(h, 1U)));
      k = rotate(k, 30U);
    };
    {
      m += rotate(i, 5U) + (j ^ k ^ l) + 0xca62c1d6 + (h = e[(70 - 3) & 0x0F] ^ e[(70 - 8) & 0x0F] ^ e[(70 - 14) & 0x0F] ^ e[70 & 0x0F], (e[70 & 0x0F] = rotate(h, 1U)));
      j = rotate(j, 30U);
    };
    {
      l += rotate(m, 5U) + (i ^ j ^ k) + 0xca62c1d6 + (h = e[(71 - 3) & 0x0F] ^ e[(71 - 8) & 0x0F] ^ e[(71 - 14) & 0x0F] ^ e[71 & 0x0F], (e[71 & 0x0F] = rotate(h, 1U)));
      i = rotate(i, 30U);
    };
    {
      k += rotate(l, 5U) + (m ^ i ^ j) + 0xca62c1d6 + (h = e[(72 - 3) & 0x0F] ^ e[(72 - 8) & 0x0F] ^ e[(72 - 14) & 0x0F] ^ e[72 & 0x0F], (e[72 & 0x0F] = rotate(h, 1U)));
      m = rotate(m, 30U);
    };
    {
      j += rotate(k, 5U) + (l ^ m ^ i) + 0xca62c1d6 + (h = e[(73 - 3) & 0x0F] ^ e[(73 - 8) & 0x0F] ^ e[(73 - 14) & 0x0F] ^ e[73 & 0x0F], (e[73 & 0x0F] = rotate(h, 1U)));
      l = rotate(l, 30U);
    };
    {
      i += rotate(j, 5U) + (k ^ l ^ m) + 0xca62c1d6 + (h = e[(74 - 3) & 0x0F] ^ e[(74 - 8) & 0x0F] ^ e[(74 - 14) & 0x0F] ^ e[74 & 0x0F], (e[74 & 0x0F] = rotate(h, 1U)));
      k = rotate(k, 30U);
    };
    {
      m += rotate(i, 5U) + (j ^ k ^ l) + 0xca62c1d6 + (h = e[(75 - 3) & 0x0F] ^ e[(75 - 8) & 0x0F] ^ e[(75 - 14) & 0x0F] ^ e[75 & 0x0F], (e[75 & 0x0F] = rotate(h, 1U)));
      j = rotate(j, 30U);
    };
    {
      l += rotate(m, 5U) + (i ^ j ^ k) + 0xca62c1d6 + (h = e[(76 - 3) & 0x0F] ^ e[(76 - 8) & 0x0F] ^ e[(76 - 14) & 0x0F] ^ e[76 & 0x0F], (e[76 & 0x0F] = rotate(h, 1U)));
      i = rotate(i, 30U);
    };
    {
      k += rotate(l, 5U) + (m ^ i ^ j) + 0xca62c1d6 + (h = e[(77 - 3) & 0x0F] ^ e[(77 - 8) & 0x0F] ^ e[(77 - 14) & 0x0F] ^ e[77 & 0x0F], (e[77 & 0x0F] = rotate(h, 1U)));
      m = rotate(m, 30U);
    };
    {
      j += rotate(k, 5U) + (l ^ m ^ i) + 0xca62c1d6 + (h = e[(78 - 3) & 0x0F] ^ e[(78 - 8) & 0x0F] ^ e[(78 - 14) & 0x0F] ^ e[78 & 0x0F], (e[78 & 0x0F] = rotate(h, 1U)));
      l = rotate(l, 30U);
    };
    {
      i += rotate(j, 5U) + (k ^ l ^ m) + 0xca62c1d6 + (h = e[(79 - 3) & 0x0F] ^ e[(79 - 8) & 0x0F] ^ e[(79 - 14) & 0x0F] ^ e[79 & 0x0F], (e[79 & 0x0F] = rotate(h, 1U)));
      k = rotate(k, 30U);
    };
    ;
    g[0] = i + 0x67452301;
    g[1] = j + 0xefcdab89;
    g[2] = k + 0x98badcfe;
    g[3] = l + 0x10325476;
    g[4] = m + 0xc3d2e1f0;
  };

  d[n * 5] = A(g[0]);
  d[n * 5 + 1] = A(g[1]);
  d[n * 5 + 2] = A(g[2]);
  d[n * 5 + 3] = A(g[3]);
  d[n * 5 + 4] = A(g[4]);
}
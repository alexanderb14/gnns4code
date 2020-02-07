__kernel void A(__global uint4* a, __constant char* b, __constant char* c, const uint d, const uint e) {
  uint f[5];
  uint g = get_global_id(0);
  int h = g;

  int i, j = 0, k = 0;
  f[0] = 0;
  f[1] = 0;
  f[2] = 0;
  f[3] = 0;
  f[4] = 0;

  for (int l = 0; l < e; ++l) {
    i = h / d;
    j = c[l] + k + h - i * d;
    if (j >= d) {
      j -= d;
      k = 1;
    } else
      k = 0;
    f[l >> 2] |= b[j] << ((l & 3) << 3);
    h = i;
  }

  f[e >> 2] |= ((uint)(0x00000080) << ((e & 3) << 3));

  uint m, n, o, p;
  m = 0x67452301;
  n = 0xefcdab89;
  o = 0x98badcfe;
  p = 0x10325476;

  {
    m += (p ^ (n & (o ^ p))) + f[0] + 0xD76AA478;
    m = ((m << 7) | ((m & 0xFFFFFFFF) >> (32 - 7))) + n;
  };
  {
    p += (o ^ (m & (n ^ o))) + f[1] + 0xE8C7B756;
    p = ((p << 12) | ((p & 0xFFFFFFFF) >> (32 - 12))) + m;
  };
  {
    o += (n ^ (p & (m ^ n))) + f[2] + 0x242070DB;
    o = ((o << 17) | ((o & 0xFFFFFFFF) >> (32 - 17))) + p;
  };
  {
    n += (m ^ (o & (p ^ m))) + f[3] + 0xC1BDCEEE;
    n = ((n << 22) | ((n & 0xFFFFFFFF) >> (32 - 22))) + o;
  };
  {
    m += (p ^ (n & (o ^ p))) + f[4] + 0xF57C0FAF;
    m = ((m << 7) | ((m & 0xFFFFFFFF) >> (32 - 7))) + n;
  };
  {
    p += (o ^ (m & (n ^ o))) + 0x4787C62A;
    p = ((p << 12) | ((p & 0xFFFFFFFF) >> (32 - 12))) + m;
  };
  {
    o += (n ^ (p & (m ^ n))) + 0xA8304613;
    o = ((o << 17) | ((o & 0xFFFFFFFF) >> (32 - 17))) + p;
  };
  {
    n += (m ^ (o & (p ^ m))) + 0xFD469501;
    n = ((n << 22) | ((n & 0xFFFFFFFF) >> (32 - 22))) + o;
  };
  {
    m += (p ^ (n & (o ^ p))) + 0x698098D8;
    m = ((m << 7) | ((m & 0xFFFFFFFF) >> (32 - 7))) + n;
  };
  {
    p += (o ^ (m & (n ^ o))) + 0x8B44F7AF;
    p = ((p << 12) | ((p & 0xFFFFFFFF) >> (32 - 12))) + m;
  };
  {
    o += (n ^ (p & (m ^ n))) + 0xFFFF5BB1;
    o = ((o << 17) | ((o & 0xFFFFFFFF) >> (32 - 17))) + p;
  };
  {
    n += (m ^ (o & (p ^ m))) + 0x895CD7BE;
    n = ((n << 22) | ((n & 0xFFFFFFFF) >> (32 - 22))) + o;
  };
  {
    m += (p ^ (n & (o ^ p))) + 0x6B901122;
    m = ((m << 7) | ((m & 0xFFFFFFFF) >> (32 - 7))) + n;
  };
  {
    p += (o ^ (m & (n ^ o))) + 0xFD987193;
    p = ((p << 12) | ((p & 0xFFFFFFFF) >> (32 - 12))) + m;
  };
  {
    o += (n ^ (p & (m ^ n))) + (e << 3) + 0xA679438E;
    o = ((o << 17) | ((o & 0xFFFFFFFF) >> (32 - 17))) + p;
  };
  {
    n += (m ^ (o & (p ^ m))) + 0x49B40821;
    n = ((n << 22) | ((n & 0xFFFFFFFF) >> (32 - 22))) + o;
  };

  {
    m += (o ^ (p & (n ^ o))) + f[1] + 0xF61E2562;
    m = ((m << 5) | ((m & 0xFFFFFFFF) >> (32 - 5))) + n;
  };
  {
    p += (n ^ (o & (m ^ n))) + 0xC040B340;
    p = ((p << 9) | ((p & 0xFFFFFFFF) >> (32 - 9))) + m;
  };
  {
    o += (m ^ (n & (p ^ m))) + 0x265E5A51;
    o = ((o << 14) | ((o & 0xFFFFFFFF) >> (32 - 14))) + p;
  };
  {
    n += (p ^ (m & (o ^ p))) + f[0] + 0xE9B6C7AA;
    n = ((n << 20) | ((n & 0xFFFFFFFF) >> (32 - 20))) + o;
  };
  {
    m += (o ^ (p & (n ^ o))) + 0xD62F105D;
    m = ((m << 5) | ((m & 0xFFFFFFFF) >> (32 - 5))) + n;
  };
  {
    p += (n ^ (o & (m ^ n))) + 0x02441453;
    p = ((p << 9) | ((p & 0xFFFFFFFF) >> (32 - 9))) + m;
  };
  {
    o += (m ^ (n & (p ^ m))) + 0xD8A1E681;
    o = ((o << 14) | ((o & 0xFFFFFFFF) >> (32 - 14))) + p;
  };
  {
    n += (p ^ (m & (o ^ p))) + f[4] + 0xE7D3FBC8;
    n = ((n << 20) | ((n & 0xFFFFFFFF) >> (32 - 20))) + o;
  };
  {
    m += (o ^ (p & (n ^ o))) + 0x21E1CDE6;
    m = ((m << 5) | ((m & 0xFFFFFFFF) >> (32 - 5))) + n;
  };
  {
    p += (n ^ (o & (m ^ n))) + (e << 3) + 0xC33707D6;
    p = ((p << 9) | ((p & 0xFFFFFFFF) >> (32 - 9))) + m;
  };
  {
    o += (m ^ (n & (p ^ m))) + f[3] + 0xF4D50D87;
    o = ((o << 14) | ((o & 0xFFFFFFFF) >> (32 - 14))) + p;
  };
  {
    n += (p ^ (m & (o ^ p))) + 0x455A14ED;
    n = ((n << 20) | ((n & 0xFFFFFFFF) >> (32 - 20))) + o;
  };
  {
    m += (o ^ (p & (n ^ o))) + 0xA9E3E905;
    m = ((m << 5) | ((m & 0xFFFFFFFF) >> (32 - 5))) + n;
  };
  {
    p += (n ^ (o & (m ^ n))) + f[2] + 0xFCEFA3F8;
    p = ((p << 9) | ((p & 0xFFFFFFFF) >> (32 - 9))) + m;
  };
  {
    o += (m ^ (n & (p ^ m))) + 0x676F02D9;
    o = ((o << 14) | ((o & 0xFFFFFFFF) >> (32 - 14))) + p;
  };
  {
    n += (p ^ (m & (o ^ p))) + 0x8D2A4C8A;
    n = ((n << 20) | ((n & 0xFFFFFFFF) >> (32 - 20))) + o;
  };

  {
    m += (n ^ o ^ p) + 0xFFFA3942;
    m = ((m << 4) | ((m & 0xFFFFFFFF) >> (32 - 4))) + n;
  };
  {
    p += (m ^ n ^ o) + 0x8771F681;
    p = ((p << 11) | ((p & 0xFFFFFFFF) >> (32 - 11))) + m;
  };
  {
    o += (p ^ m ^ n) + 0x6D9D6122;
    o = ((o << 16) | ((o & 0xFFFFFFFF) >> (32 - 16))) + p;
  };
  {
    n += (o ^ p ^ m) + (e << 3) + 0xFDE5380C;
    n = ((n << 23) | ((n & 0xFFFFFFFF) >> (32 - 23))) + o;
  };
  {
    m += (n ^ o ^ p) + f[1] + 0xA4BEEA44;
    m = ((m << 4) | ((m & 0xFFFFFFFF) >> (32 - 4))) + n;
  };
  {
    p += (m ^ n ^ o) + f[4] + 0x4BDECFA9;
    p = ((p << 11) | ((p & 0xFFFFFFFF) >> (32 - 11))) + m;
  };
  {
    o += (p ^ m ^ n) + 0xF6BB4B60;
    o = ((o << 16) | ((o & 0xFFFFFFFF) >> (32 - 16))) + p;
  };
  {
    n += (o ^ p ^ m) + 0xBEBFBC70;
    n = ((n << 23) | ((n & 0xFFFFFFFF) >> (32 - 23))) + o;
  };
  {
    m += (n ^ o ^ p) + 0x289B7EC6;
    m = ((m << 4) | ((m & 0xFFFFFFFF) >> (32 - 4))) + n;
  };
  {
    p += (m ^ n ^ o) + f[0] + 0xEAA127FA;
    p = ((p << 11) | ((p & 0xFFFFFFFF) >> (32 - 11))) + m;
  };
  {
    o += (p ^ m ^ n) + f[3] + 0xD4EF3085;
    o = ((o << 16) | ((o & 0xFFFFFFFF) >> (32 - 16))) + p;
  };
  {
    n += (o ^ p ^ m) + 0x04881D05;
    n = ((n << 23) | ((n & 0xFFFFFFFF) >> (32 - 23))) + o;
  };
  {
    m += (n ^ o ^ p) + 0xD9D4D039;
    m = ((m << 4) | ((m & 0xFFFFFFFF) >> (32 - 4))) + n;
  };
  {
    p += (m ^ n ^ o) + 0xE6DB99E5;
    p = ((p << 11) | ((p & 0xFFFFFFFF) >> (32 - 11))) + m;
  };
  {
    o += (p ^ m ^ n) + 0x1FA27CF8;
    o = ((o << 16) | ((o & 0xFFFFFFFF) >> (32 - 16))) + p;
  };
  {
    n += (o ^ p ^ m) + f[2] + 0xC4AC5665;
    n = ((n << 23) | ((n & 0xFFFFFFFF) >> (32 - 23))) + o;
  };

  {
    m += (o ^ (n | ~p)) + f[0] + 0xF4292244;
    m = ((m << 6) | ((m & 0xFFFFFFFF) >> (32 - 6))) + n;
  };
  {
    p += (n ^ (m | ~o)) + 0x432AFF97;
    p = ((p << 10) | ((p & 0xFFFFFFFF) >> (32 - 10))) + m;
  };
  {
    o += (m ^ (p | ~n)) + (e << 3) + 0xAB9423A7;
    o = ((o << 15) | ((o & 0xFFFFFFFF) >> (32 - 15))) + p;
  };
  {
    n += (p ^ (o | ~m)) + 0xFC93A039;
    n = ((n << 21) | ((n & 0xFFFFFFFF) >> (32 - 21))) + o;
  };
  {
    m += (o ^ (n | ~p)) + 0x655B59C3;
    m = ((m << 6) | ((m & 0xFFFFFFFF) >> (32 - 6))) + n;
  };
  {
    p += (n ^ (m | ~o)) + f[3] + 0x8F0CCC92;
    p = ((p << 10) | ((p & 0xFFFFFFFF) >> (32 - 10))) + m;
  };
  {
    o += (m ^ (p | ~n)) + 0xFFEFF47D;
    o = ((o << 15) | ((o & 0xFFFFFFFF) >> (32 - 15))) + p;
  };
  {
    n += (p ^ (o | ~m)) + f[1] + 0x85845DD1;
    n = ((n << 21) | ((n & 0xFFFFFFFF) >> (32 - 21))) + o;
  };
  {
    m += (o ^ (n | ~p)) + 0x6FA87E4F;
    m = ((m << 6) | ((m & 0xFFFFFFFF) >> (32 - 6))) + n;
  };
  {
    p += (n ^ (m | ~o)) + 0xFE2CE6E0;
    p = ((p << 10) | ((p & 0xFFFFFFFF) >> (32 - 10))) + m;
  };
  {
    o += (m ^ (p | ~n)) + 0xA3014314;
    o = ((o << 15) | ((o & 0xFFFFFFFF) >> (32 - 15))) + p;
  };
  {
    n += (p ^ (o | ~m)) + 0x4E0811A1;
    n = ((n << 21) | ((n & 0xFFFFFFFF) >> (32 - 21))) + o;
  };
  {
    m += (o ^ (n | ~p)) + f[4] + 0xF7537E82;
    m = ((m << 6) | ((m & 0xFFFFFFFF) >> (32 - 6))) + n;
  };
  {
    p += (n ^ (m | ~o)) + 0xBD3AF235;
    p = ((p << 10) | ((p & 0xFFFFFFFF) >> (32 - 10))) + m;
  };
  {
    o += (m ^ (p | ~n)) + f[2] + 0x2AD7D2BB;
    o = ((o << 15) | ((o & 0xFFFFFFFF) >> (32 - 15))) + p;
  };
  {
    n += (p ^ (o | ~m)) + 0xEB86D391;
    n = ((n << 21) | ((n & 0xFFFFFFFF) >> (32 - 21))) + o;
  };

  a[g].x = m + 0x67452301;
  a[g].y = n + 0xefcdab89;
  a[g].z = o + 0x98badcfe;
  a[g].w = p + 0x10325476;
}
__constant unsigned int Ga[64] = {7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22, 5, 9, 14, 20, 5, 9, 14, 20, 5, 9, 14, 20, 5, 9, 14, 20, 4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23, 6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21};

__constant unsigned int Gb[64] = {0xd76aa478, 0xe8c7b756, 0x242070db, 0xc1bdceee, 0xf57c0faf, 0x4787c62a, 0xa8304613, 0xfd469501, 0x698098d8, 0x8b44f7af, 0xffff5bb1, 0x895cd7be, 0x6b901122, 0xfd987193, 0xa679438e, 0x49b40821, 0xf61e2562, 0xc040b340, 0x265e5a51, 0xe9b6c7aa, 0xd62f105d, 0x02441453, 0xd8a1e681, 0xe7d3fbc8, 0x21e1cde6, 0xc33707d6, 0xf4d50d87, 0x455a14ed, 0xa9e3e905, 0xfcefa3f8, 0x676f02d9, 0x8d2a4c8a,
                                  0xfffa3942, 0x8771f681, 0x6d9d6122, 0xfde5380c, 0xa4beea44, 0x4bdecfa9, 0xf6bb4b60, 0xbebfbc70, 0x289b7ec6, 0xeaa127fa, 0xd4ef3085, 0x04881d05, 0xd9d4d039, 0xe6db99e5, 0x1fa27cf8, 0xc4ac5665, 0xf4292244, 0x432aff97, 0xab9423a7, 0xfc93a039, 0x655b59c3, 0x8f0ccc92, 0xffeff47d, 0x85845dd1, 0x6fa87e4f, 0xfe2ce6e0, 0xa3014314, 0x4e0811a1, 0xf7537e82, 0xbd3af235, 0x2ad7d2bb, 0xeb86d391};

unsigned int A(unsigned int a, unsigned int b) {
  return (a << b) | (a >> (32 - b));
}

void B(unsigned char* a, unsigned long b, unsigned char* c, unsigned int* d) {
  unsigned int e, f;
  unsigned int* g;
  unsigned char* h;

  unsigned int i[4] = {0x67452301, 0xefcdab89, 0x98badcfe, 0x10325476};

  unsigned int j, k, l, m, n, o, p;

  *d = 0;

  a[b] = 0x80;

  for (e = b + 1; e < 64 - 8; e++) {
    a[e] = 0x00;
  }

  f = 7;
  for (; e < 64; e++) {
    a[e] = (b >> (8 * f)) & 0xFF;
    f--;
  }

  j = i[0];
  k = i[1];
  l = i[2];
  m = i[3];

  g = (unsigned int*)a;
  for (e = 0; e < 63; e++) {
    if (e >= 0 && e <= 15) {
      o = (k & l) | ((~k) & m);
      p = e;
    }
    if (e >= 16 && e <= 31) {
      o = (m & k) | ((~m) & l);
      p = (5 * e + 1) % 16;
    }
    if (e >= 32 && e <= 47) {
      o = k ^ l ^ m;
      p = (3 * e + 5) % 16;
    }
    if (e >= 48 && e <= 63) {
      o = l ^ (k | (~m));
      p = (7 * e) % 16;
    }
    f = m;
    m = l;
    l = k;
    k = k + A((j + o + Gb[e] + g[p]), Ga[e]);
    j = f;
  }

  i[0] += j;
  i[1] += k;
  i[2] += l;
  i[3] += m;

  h = (unsigned char*)i;
  f = 1;
  for (e = 0; e < 16; e++) {
    f &= (h[e] == c[e]);
  }
  *d = f;
}

__kernel void C(__global unsigned char* a, unsigned int b, __global unsigned char* c, unsigned int d) {
  __private unsigned char e[64];
  __private unsigned char f[16];
  __private unsigned int g[1] = {0};
  B(e, 12, f, g);
}
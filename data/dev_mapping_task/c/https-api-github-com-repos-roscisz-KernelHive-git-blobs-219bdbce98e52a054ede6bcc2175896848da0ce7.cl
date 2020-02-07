void A(unsigned char* a, unsigned long b, unsigned char* c) {
  unsigned int d, e;
  unsigned int* f;
  unsigned char* g;

  unsigned int h[4] = {0x67452301, 0xefcdab89, 0x98badcfe, 0x10325476};

  unsigned int i, j, k, l, m;

  a[b] = 0x80;

  for (d = b + 1; d < 64 - 8; d++) {
    a[d] = 0x00;
  }

  e = 0;
  for (; d < 64; d++) {
    a[d] = ((8 * b) >> (8 * e)) & 0xFF;
    e++;
  }

  i = h[0];
  j = h[1];
  k = h[2];
  l = h[3];

  f = (unsigned int*)a;
  m = i + (((j) & (k)) | (~(j) & (l))) + f[0] + (((unsigned int)~0) ^ 0x28955b87);
  i = (((m) << (7)) | ((m) >> (32 - (7)))) + j;
  m = l + (((i) & (j)) | (~(i) & (k))) + f[1] + (((unsigned int)~0) ^ 0x173848a9);
  l = (((m) << (12)) | ((m) >> (32 - (12)))) + i;
  m = k + (((l) & (i)) | (~(l) & (j))) + f[2] + 0x242070db;
  k = (((m) << (17)) | ((m) >> (32 - (17)))) + l;
  m = j + (((k) & (l)) | (~(k) & (i))) + f[3] + (((unsigned int)~0) ^ 0x3e423111);
  j = (((m) << (22)) | ((m) >> (32 - (22)))) + k;
  m = i + (((j) & (k)) | (~(j) & (l))) + f[4] + (((unsigned int)~0) ^ 0x0a83f050);
  i = (((m) << (7)) | ((m) >> (32 - (7)))) + j;
  m = l + (((i) & (j)) | (~(i) & (k))) + f[5] + 0x4787c62a;
  l = (((m) << (12)) | ((m) >> (32 - (12)))) + i;
  m = k + (((l) & (i)) | (~(l) & (j))) + f[6] + (((unsigned int)~0) ^ 0x57cfb9ec);
  k = (((m) << (17)) | ((m) >> (32 - (17)))) + l;
  m = j + (((k) & (l)) | (~(k) & (i))) + f[7] + (((unsigned int)~0) ^ 0x02b96afe);
  j = (((m) << (22)) | ((m) >> (32 - (22)))) + k;
  m = i + (((j) & (k)) | (~(j) & (l))) + f[8] + 0x698098d8;
  i = (((m) << (7)) | ((m) >> (32 - (7)))) + j;
  m = l + (((i) & (j)) | (~(i) & (k))) + f[9] + (((unsigned int)~0) ^ 0x74bb0850);
  l = (((m) << (12)) | ((m) >> (32 - (12)))) + i;
  m = k + (((l) & (i)) | (~(l) & (j))) + f[10] + (((unsigned int)~0) ^ 0x0000a44e);
  k = (((m) << (17)) | ((m) >> (32 - (17)))) + l;
  m = j + (((k) & (l)) | (~(k) & (i))) + f[11] + (((unsigned int)~0) ^ 0x76a32841);
  j = (((m) << (22)) | ((m) >> (32 - (22)))) + k;
  m = i + (((j) & (k)) | (~(j) & (l))) + f[12] + 0x6b901122;
  i = (((m) << (7)) | ((m) >> (32 - (7)))) + j;
  m = l + (((i) & (j)) | (~(i) & (k))) + f[13] + (((unsigned int)~0) ^ 0x02678e6c);
  l = (((m) << (12)) | ((m) >> (32 - (12)))) + i;
  m = k + (((l) & (i)) | (~(l) & (j))) + f[14] + (((unsigned int)~0) ^ 0x5986bc71);
  k = (((m) << (17)) | ((m) >> (32 - (17)))) + l;
  m = j + (((k) & (l)) | (~(k) & (i))) + f[15] + 0x49b40821;
  j = (((m) << (22)) | ((m) >> (32 - (22)))) + k;
  m = i + (((j) & (l)) | ((k) & ~(l))) + f[1] + (((unsigned int)~0) ^ 0x09e1da9d);
  i = (((m) << (5)) | ((m) >> (32 - (5)))) + j;
  m = l + (((i) & (k)) | ((j) & ~(k))) + f[6] + (((unsigned int)~0) ^ 0x3fbf4cbf);
  l = (((m) << (9)) | ((m) >> (32 - (9)))) + i;
  m = k + (((l) & (j)) | ((i) & ~(j))) + f[11] + 0x265e5a51;
  k = (((m) << (14)) | ((m) >> (32 - (14)))) + l;
  m = j + (((k) & (i)) | ((l) & ~(i))) + f[0] + (((unsigned int)~0) ^ 0x16493855);
  j = (((m) << (20)) | ((m) >> (32 - (20)))) + k;
  m = i + (((j) & (l)) | ((k) & ~(l))) + f[5] + (((unsigned int)~0) ^ 0x29d0efa2);
  i = (((m) << (5)) | ((m) >> (32 - (5)))) + j;
  m = l + (((i) & (k)) | ((j) & ~(k))) + f[10] + 0x02441453;
  l = (((m) << (9)) | ((m) >> (32 - (9)))) + i;
  m = k + (((l) & (j)) | ((i) & ~(j))) + f[15] + (((unsigned int)~0) ^ 0x275e197e);
  k = (((m) << (14)) | ((m) >> (32 - (14)))) + l;
  m = j + (((k) & (i)) | ((l) & ~(i))) + f[4] + (((unsigned int)~0) ^ 0x182c0437);
  j = (((m) << (20)) | ((m) >> (32 - (20)))) + k;
  m = i + (((j) & (l)) | ((k) & ~(l))) + f[9] + 0x21e1cde6;
  i = (((m) << (5)) | ((m) >> (32 - (5)))) + j;
  m = l + (((i) & (k)) | ((j) & ~(k))) + f[14] + (((unsigned int)~0) ^ 0x3cc8f829);
  l = (((m) << (9)) | ((m) >> (32 - (9)))) + i;
  m = k + (((l) & (j)) | ((i) & ~(j))) + f[3] + (((unsigned int)~0) ^ 0x0b2af278);
  k = (((m) << (14)) | ((m) >> (32 - (14)))) + l;
  m = j + (((k) & (i)) | ((l) & ~(i))) + f[8] + 0x455a14ed;
  j = (((m) << (20)) | ((m) >> (32 - (20)))) + k;
  m = i + (((j) & (l)) | ((k) & ~(l))) + f[13] + (((unsigned int)~0) ^ 0x561c16fa);
  i = (((m) << (5)) | ((m) >> (32 - (5)))) + j;
  m = l + (((i) & (k)) | ((j) & ~(k))) + f[2] + (((unsigned int)~0) ^ 0x03105c07);
  l = (((m) << (9)) | ((m) >> (32 - (9)))) + i;
  m = k + (((l) & (j)) | ((i) & ~(j))) + f[7] + 0x676f02d9;
  k = (((m) << (14)) | ((m) >> (32 - (14)))) + l;
  m = j + (((k) & (i)) | ((l) & ~(i))) + f[12] + (((unsigned int)~0) ^ 0x72d5b375);
  j = (((m) << (20)) | ((m) >> (32 - (20)))) + k;
  m = i + ((j) ^ (k) ^ (l)) + f[5] + (((unsigned int)~0) ^ 0x0005c6bd);
  i = (((m) << (4)) | ((m) >> (32 - (4)))) + j;
  m = l + ((i) ^ (j) ^ (k)) + f[8] + (((unsigned int)~0) ^ 0x788e097e);
  l = (((m) << (11)) | ((m) >> (32 - (11)))) + i;
  m = k + ((l) ^ (i) ^ (j)) + f[11] + 0x6d9d6122;
  k = (((m) << (16)) | ((m) >> (32 - (16)))) + l;
  m = j + ((k) ^ (l) ^ (i)) + f[14] + (((unsigned int)~0) ^ 0x021ac7f3);
  j = (((m) << (23)) | ((m) >> (32 - (23)))) + k;
  m = i + ((j) ^ (k) ^ (l)) + f[1] + (((unsigned int)~0) ^ 0x5b4115bb);
  i = (((m) << (4)) | ((m) >> (32 - (4)))) + j;
  m = l + ((i) ^ (j) ^ (k)) + f[4] + 0x4bdecfa9;
  l = (((m) << (11)) | ((m) >> (32 - (11)))) + i;
  m = k + ((l) ^ (i) ^ (j)) + f[7] + (((unsigned int)~0) ^ 0x0944b49f);
  k = (((m) << (16)) | ((m) >> (32 - (16)))) + l;
  m = j + ((k) ^ (l) ^ (i)) + f[10] + (((unsigned int)~0) ^ 0x4140438f);
  j = (((m) << (23)) | ((m) >> (32 - (23)))) + k;
  m = i + ((j) ^ (k) ^ (l)) + f[13] + 0x289b7ec6;
  i = (((m) << (4)) | ((m) >> (32 - (4)))) + j;
  m = l + ((i) ^ (j) ^ (k)) + f[0] + (((unsigned int)~0) ^ 0x155ed805);
  l = (((m) << (11)) | ((m) >> (32 - (11)))) + i;
  m = k + ((l) ^ (i) ^ (j)) + f[3] + (((unsigned int)~0) ^ 0x2b10cf7a);
  k = (((m) << (16)) | ((m) >> (32 - (16)))) + l;
  m = j + ((k) ^ (l) ^ (i)) + f[6] + 0x04881d05;
  j = (((m) << (23)) | ((m) >> (32 - (23)))) + k;
  m = i + ((j) ^ (k) ^ (l)) + f[9] + (((unsigned int)~0) ^ 0x262b2fc6);
  i = (((m) << (4)) | ((m) >> (32 - (4)))) + j;
  m = l + ((i) ^ (j) ^ (k)) + f[12] + (((unsigned int)~0) ^ 0x1924661a);
  l = (((m) << (11)) | ((m) >> (32 - (11)))) + i;
  m = k + ((l) ^ (i) ^ (j)) + f[15] + 0x1fa27cf8;
  k = (((m) << (16)) | ((m) >> (32 - (16)))) + l;
  m = j + ((k) ^ (l) ^ (i)) + f[2] + (((unsigned int)~0) ^ 0x3b53a99a);
  j = (((m) << (23)) | ((m) >> (32 - (23)))) + k;
  m = i + ((k) ^ ((j) | ~(l))) + f[0] + (((unsigned int)~0) ^ 0x0bd6ddbb);
  i = (((m) << (6)) | ((m) >> (32 - (6)))) + j;
  m = l + ((j) ^ ((i) | ~(k))) + f[7] + 0x432aff97;
  l = (((m) << (10)) | ((m) >> (32 - (10)))) + i;
  m = k + ((i) ^ ((l) | ~(j))) + f[14] + (((unsigned int)~0) ^ 0x546bdc58);
  k = (((m) << (15)) | ((m) >> (32 - (15)))) + l;
  m = j + ((l) ^ ((k) | ~(i))) + f[5] + (((unsigned int)~0) ^ 0x036c5fc6);
  j = (((m) << (21)) | ((m) >> (32 - (21)))) + k;
  m = i + ((k) ^ ((j) | ~(l))) + f[12] + 0x655b59c3;
  i = (((m) << (6)) | ((m) >> (32 - (6)))) + j;
  m = l + ((j) ^ ((i) | ~(k))) + f[3] + (((unsigned int)~0) ^ 0x70f3336d);
  l = (((m) << (10)) | ((m) >> (32 - (10)))) + i;
  m = k + ((i) ^ ((l) | ~(j))) + f[10] + (((unsigned int)~0) ^ 0x00100b82);
  k = (((m) << (15)) | ((m) >> (32 - (15)))) + l;
  m = j + ((l) ^ ((k) | ~(i))) + f[1] + (((unsigned int)~0) ^ 0x7a7ba22e);
  j = (((m) << (21)) | ((m) >> (32 - (21)))) + k;
  m = i + ((k) ^ ((j) | ~(l))) + f[8] + 0x6fa87e4f;
  i = (((m) << (6)) | ((m) >> (32 - (6)))) + j;
  m = l + ((j) ^ ((i) | ~(k))) + f[15] + (((unsigned int)~0) ^ 0x01d3191f);
  l = (((m) << (10)) | ((m) >> (32 - (10)))) + i;
  m = k + ((i) ^ ((l) | ~(j))) + f[6] + (((unsigned int)~0) ^ 0x5cfebceb);
  k = (((m) << (15)) | ((m) >> (32 - (15)))) + l;
  m = j + ((l) ^ ((k) | ~(i))) + f[13] + 0x4e0811a1;
  j = (((m) << (21)) | ((m) >> (32 - (21)))) + k;
  m = i + ((k) ^ ((j) | ~(l))) + f[4] + (((unsigned int)~0) ^ 0x08ac817d);
  i = (((m) << (6)) | ((m) >> (32 - (6)))) + j;
  m = l + ((j) ^ ((i) | ~(k))) + f[11] + (((unsigned int)~0) ^ 0x42c50dca);
  l = (((m) << (10)) | ((m) >> (32 - (10)))) + i;
  m = k + ((i) ^ ((l) | ~(j))) + f[2] + 0x2ad7d2bb;
  k = (((m) << (15)) | ((m) >> (32 - (15)))) + l;
  m = j + ((l) ^ ((k) | ~(i))) + f[9] + (((unsigned int)~0) ^ 0x14792c6e);
  j = (((m) << (21)) | ((m) >> (32 - (21)))) + k;

  h[0] += i;
  h[1] += j;
  h[2] += k;
  h[3] += l;

  g = (unsigned char*)h;
  for (d = 0; d < 16; d++) {
    c[d] = g[d];
  }
}
void B(unsigned char* a, unsigned char* b, __local unsigned int* c) {
  unsigned int d = 1, e;
  for (e = 0; e < 16; e++) {
    d &= (a[e] == b[e]);
  }
  c[0] = d;
}

void C(long a, unsigned char* b, __local unsigned long* c) {
  unsigned char d[26] = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
  unsigned char e[64];
  int f, g = 26, h = 0;
  while (a >= 0) {
    f = a % g;
    e[h] = d[f];
    h++;
    a -= (f + g);
    a /= g;
  }
  g = h - 1;
  while (h >= 0) {
    b[g - h] = e[h];
    h--;
  }
  c[0] = g + 1;
}

__kernel void D(__global unsigned char* a, unsigned int b, __global unsigned char* c, unsigned int d) {
  unsigned char e[sizeof(long)];
  unsigned char f[64];
  unsigned char g[16];
  unsigned char h[16];
  long i[1] = {0};
  long j[1] = {0};
  long k = 0;

  long l = 0;
  int m = get_global_size(0);
  int n = get_global_id(0);

  int o;

  __local unsigned int p[512];
  __local unsigned long q[512];
  __local int r;
  __local int s;

  p[n] = 0;
  q[n] = 0;
  if (n == 0) {
    r = -1;
    s = -1;
  }

  for (o = 0; o < 16; o++) {
    g[o] = a[o];
  }
  barrier(2);

  for (o = 0; o < sizeof(long); o++) {
    e[o] = a[o + 16];
  }
  barrier(2);
  *i = *((long*)e);

  for (o = 0; o < sizeof(long); o++) {
    e[o] = a[o + 16 + sizeof(long)];
  }
  barrier(2);
  *j = *((long*)e);

  k = *i;
  barrier(1);

  while (r <= 0 && k <= *j && l < 100000) {
    C(k, f, q + n);
    A(f, q[n], h);
    B(h, g, p + n);
    barrier(1);
    if (p[n] > 0) {
      r = q[n];
      s = n;
    }
    l++;
    k = *i + (l * m) + n;
    barrier(1);
  }
  barrier(1);

  if (r > 0 && n == s) {
    c[0] = (r)&0xFF;
    c[1] = (r >> 8) & 0xFF;
    c[2] = (r >> 16) & 0xFF;
    c[3] = (r >> 24) & 0xFF;
    for (o = 0; o < r; o++) {
      c[o + 4] = f[o];
    }
  } else if (r <= 0 && n == 0) {
    if (l >= 100000) {
      c[0] = 0xFF;
      c[1] = 0xFF;
      c[2] = 0xFF;
      c[3] = 0xFF;

      for (o = 0; o < sizeof(long); o++) {
        a[o + 16] = (k >> o * 8) & 0xFF;
      }
    } else {
      c[0] = 0;
      c[1] = 0;
      c[2] = 0;
      c[3] = 0;
    }
  }
}
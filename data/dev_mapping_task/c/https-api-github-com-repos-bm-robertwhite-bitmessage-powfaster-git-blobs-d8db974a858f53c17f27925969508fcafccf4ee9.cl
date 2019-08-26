typedef struct {
  unsigned long H[8];
  unsigned int buffer[32];
  unsigned int buflen;
} sha512_ctx;

typedef struct {
  unsigned long target;
  char v[72 + 1];
} sha512_key;

__constant unsigned long Ga[] = {
    0x428a2f98d728ae22UL, 0x7137449123ef65cdUL, 0xb5c0fbcfec4d3b2fUL, 0xe9b5dba58189dbbcUL, 0x3956c25bf348b538UL, 0x59f111f1b605d019UL, 0x923f82a4af194f9bUL, 0xab1c5ed5da6d8118UL, 0xd807aa98a3030242UL, 0x12835b0145706fbeUL, 0x243185be4ee4b28cUL, 0x550c7dc3d5ffb4e2UL, 0x72be5d74f27b896fUL, 0x80deb1fe3b1696b1UL, 0x9bdc06a725c71235UL, 0xc19bf174cf692694UL, 0xe49b69c19ef14ad2UL, 0xefbe4786384f25e3UL, 0x0fc19dc68b8cd5b5UL, 0x240ca1cc77ac9c65UL,
    0x2de92c6f592b0275UL, 0x4a7484aa6ea6e483UL, 0x5cb0a9dcbd41fbd4UL, 0x76f988da831153b5UL, 0x983e5152ee66dfabUL, 0xa831c66d2db43210UL, 0xb00327c898fb213fUL, 0xbf597fc7beef0ee4UL, 0xc6e00bf33da88fc2UL, 0xd5a79147930aa725UL, 0x06ca6351e003826fUL, 0x142929670a0e6e70UL, 0x27b70a8546d22ffcUL, 0x2e1b21385c26c926UL, 0x4d2c6dfc5ac42aedUL, 0x53380d139d95b3dfUL, 0x650a73548baf63deUL, 0x766a0abb3c77b2a8UL, 0x81c2c92e47edaee6UL, 0x92722c851482353bUL,
    0xa2bfe8a14cf10364UL, 0xa81a664bbc423001UL, 0xc24b8b70d0f89791UL, 0xc76c51a30654be30UL, 0xd192e819d6ef5218UL, 0xd69906245565a910UL, 0xf40e35855771202aUL, 0x106aa07032bbd1b8UL, 0x19a4c116b8d2d0c8UL, 0x1e376c085141ab53UL, 0x2748774cdf8eeb99UL, 0x34b0bcb5e19b48a8UL, 0x391c0cb3c5c95a63UL, 0x4ed8aa4ae3418acbUL, 0x5b9cca4f7763e373UL, 0x682e6ff3d6b2b8a3UL, 0x748f82ee5defb2fcUL, 0x78a5636f43172f60UL, 0x84c87814a1f0ab72UL, 0x8cc702081a6439ecUL,
    0x90befffa23631e28UL, 0xa4506cebde82bde9UL, 0xbef9a3f7b2c67915UL, 0xc67178f2e372532bUL, 0xca273eceea26619cUL, 0xd186b8c721c0c207UL, 0xeada7dd6cde0eb1eUL, 0xf57d4f7fee6ed178UL, 0x06f067aa72176fbaUL, 0x0a637dc5a2c898a6UL, 0x113f9804bef90daeUL, 0x1b710b35131c471bUL, 0x28db77f523047d84UL, 0x32caab7b40c72493UL, 0x3c9ebe0a15c9bebcUL, 0x431d67c49c100d4cUL, 0x4cc5d4becb3e42b6UL, 0x597f299cfc657e2aUL, 0x5fcb6fab3ad6faecUL, 0x6c44198c4a475817UL,
};

void A(sha512_ctx* a, const char* b, unsigned char c) {
  unsigned int* d = a->buffer;

  for (unsigned int e = 0; e < c; e++) {
    (d)[(e) >> 2] = ((d)[(e) >> 2] & ~(0xffU << (((e)&3) << 3))) + ((b[e]) << (((e)&3) << 3));
  }
  a->buflen = c;

  unsigned int f = a->buflen;
  (d)[(f) >> 2] = ((d)[(f) >> 2] & ~(0xffU << (((f)&3) << 3))) + ((0x80) << (((f)&3) << 3));
  while ((++f & 3) != 0) {
    (d)[(f) >> 2] = ((d)[(f) >> 2] & ~(0xffU << (((f)&3) << 3))) + ((0) << (((f)&3) << 3));
  }

  unsigned int* g = d + (f >> 2);
  for (unsigned int e = f; e < 128; e += 4) {
    *g++ = 0;
  }

  unsigned long* h = (unsigned long*)a->buffer;
  h[15] = __builtin_astype(__builtin_astype(((unsigned long)a->buflen) * 8, uchar8).s76543210, ulong);
}

inline unsigned long B(char* a) {
  __private sha512_ctx b;
  A(&b, a, 72);

  int c;

  unsigned long d = 0x6a09e667f3bcc908UL;
  unsigned long e = 0xbb67ae8584caa73bUL;
  unsigned long f = 0x3c6ef372fe94f82bUL;
  unsigned long g = 0xa54ff53a5f1d36f1UL;
  unsigned long h = 0x510e527fade682d1UL;
  unsigned long i = 0x9b05688c2b3e6c1fUL;
  unsigned long j = 0x1f83d9abfb41bd6bUL;
  unsigned long k = 0x5be0cd19137e2179UL;

  __private unsigned long l[16];

  unsigned long* m = (unsigned long*)b.buffer;

  for (c = 0; c < 16; c++)
    l[c] = __builtin_astype(__builtin_astype(m[c], uchar8).s76543210, ulong);

  unsigned long n, o;
  for (c = 0; c < 16; c++) {
    n = Ga[c] + l[c] + k + ((((h >> 14) | (h << (64 - 14)))) ^ (((h >> 18) | (h << (64 - 18)))) ^ (((h >> 41) | (h << (64 - 41))))) + ((h & i) ^ ((~h) & j));
    o = ((d & e) ^ (d & f) ^ (e & f)) + ((((d >> 28) | (d << (64 - 28)))) ^ (((d >> 34) | (d << (64 - 34)))) ^ (((d >> 39) | (d << (64 - 39)))));

    k = j;
    j = i;
    i = h;
    h = g + n;
    g = f;
    f = e;
    e = d;
    d = n + o;
  }

  for (c = 16; c < 80; c++) {
    l[c & 15] = ((((l[(c - 2) & 15] >> 19) | (l[(c - 2) & 15] << (64 - 19)))) ^ (((l[(c - 2) & 15] >> 61) | (l[(c - 2) & 15] << (64 - 61)))) ^ (l[(c - 2) & 15] >> 6)) + ((((l[(c - 15) & 15] >> 1) | (l[(c - 15) & 15] << (64 - 1)))) ^ (((l[(c - 15) & 15] >> 8) | (l[(c - 15) & 15] << (64 - 8)))) ^ (l[(c - 15) & 15] >> 7)) + l[(c - 16) & 15] + l[(c - 7) & 15];
    n = Ga[c] + l[c & 15] + k + ((((h >> 14) | (h << (64 - 14)))) ^ (((h >> 18) | (h << (64 - 18)))) ^ (((h >> 41) | (h << (64 - 41))))) + ((h & i) ^ ((~h) & j));
    o = ((d & e) ^ (d & f) ^ (e & f)) + ((((d >> 28) | (d << (64 - 28)))) ^ (((d >> 34) | (d << (64 - 34)))) ^ (((d >> 39) | (d << (64 - 39)))));

    k = j;
    j = i;
    i = h;
    h = g + n;
    g = f;
    f = e;
    e = d;
    d = n + o;
  }

  unsigned long p[8];

  p[0] = __builtin_astype(__builtin_astype(d + 0x6a09e667f3bcc908UL, uchar8).s76543210, ulong);
  p[1] = __builtin_astype(__builtin_astype(e + 0xbb67ae8584caa73bUL, uchar8).s76543210, ulong);
  p[2] = __builtin_astype(__builtin_astype(f + 0x3c6ef372fe94f82bUL, uchar8).s76543210, ulong);
  p[3] = __builtin_astype(__builtin_astype(g + 0xa54ff53a5f1d36f1UL, uchar8).s76543210, ulong);
  p[4] = __builtin_astype(__builtin_astype(h + 0x510e527fade682d1UL, uchar8).s76543210, ulong);
  p[5] = __builtin_astype(__builtin_astype(i + 0x9b05688c2b3e6c1fUL, uchar8).s76543210, ulong);
  p[6] = __builtin_astype(__builtin_astype(j + 0x1f83d9abfb41bd6bUL, uchar8).s76543210, ulong);
  p[7] = __builtin_astype(__builtin_astype(k + 0x5be0cd19137e2179UL, uchar8).s76543210, ulong);

  A(&b, (char*)p, 64);

  d = 0x6a09e667f3bcc908UL;
  e = 0xbb67ae8584caa73bUL;
  f = 0x3c6ef372fe94f82bUL;
  g = 0xa54ff53a5f1d36f1UL;
  h = 0x510e527fade682d1UL;
  i = 0x9b05688c2b3e6c1fUL;
  j = 0x1f83d9abfb41bd6bUL;
  k = 0x5be0cd19137e2179UL;

  m = (unsigned long*)b.buffer;

  for (c = 0; c < 16; c++)
    l[c] = __builtin_astype(__builtin_astype(m[c], uchar8).s76543210, ulong);

  for (c = 0; c < 16; c++) {
    n = Ga[c] + l[c] + k + ((((h >> 14) | (h << (64 - 14)))) ^ (((h >> 18) | (h << (64 - 18)))) ^ (((h >> 41) | (h << (64 - 41))))) + ((h & i) ^ ((~h) & j));
    o = ((d & e) ^ (d & f) ^ (e & f)) + ((((d >> 28) | (d << (64 - 28)))) ^ (((d >> 34) | (d << (64 - 34)))) ^ (((d >> 39) | (d << (64 - 39)))));

    k = j;
    j = i;
    i = h;
    h = g + n;
    g = f;
    f = e;
    e = d;
    d = n + o;
  }

  for (c = 16; c < 80; c++) {
    l[c & 15] = ((((l[(c - 2) & 15] >> 19) | (l[(c - 2) & 15] << (64 - 19)))) ^ (((l[(c - 2) & 15] >> 61) | (l[(c - 2) & 15] << (64 - 61)))) ^ (l[(c - 2) & 15] >> 6)) + ((((l[(c - 15) & 15] >> 1) | (l[(c - 15) & 15] << (64 - 1)))) ^ (((l[(c - 15) & 15] >> 8) | (l[(c - 15) & 15] << (64 - 8)))) ^ (l[(c - 15) & 15] >> 7)) + l[(c - 16) & 15] + l[(c - 7) & 15];
    n = Ga[c] + l[c & 15] + k + ((((h >> 14) | (h << (64 - 14)))) ^ (((h >> 18) | (h << (64 - 18)))) ^ (((h >> 41) | (h << (64 - 41))))) + ((h & i) ^ ((~h) & j));
    o = ((d & e) ^ (d & f) ^ (e & f)) + ((((d >> 28) | (d << (64 - 28)))) ^ (((d >> 34) | (d << (64 - 34)))) ^ (((d >> 39) | (d << (64 - 39)))));

    k = j;
    j = i;
    i = h;
    h = g + n;
    g = f;
    f = e;
    e = d;
    d = n + o;
  }
  return __builtin_astype(__builtin_astype(d + 0x6a09e667f3bcc908UL, uchar8).s76543210, ulong);
}

__kernel void C(__global const sha512_key* a, __global unsigned long* b, unsigned long c) {
  unsigned long d = get_global_id(0);
  if (d == 0 && c == 0) {
    *b = 0;
  }
  unsigned long e;

  unsigned long f[9];

  __global unsigned long* g = (__global unsigned long*)a->v;
  for (int h = 1; h < 9; h++) {
    f[h] = g[h];
  }

  f[0] = __builtin_astype(__builtin_astype(d + (c), uchar8).s76543210, ulong);

  e = B((char*)f);
  if (__builtin_astype(__builtin_astype(e, uchar8).s76543210, ulong) < a->target) {
    *b = __builtin_astype(__builtin_astype(f[0], uchar8).s76543210, ulong);
  }
}
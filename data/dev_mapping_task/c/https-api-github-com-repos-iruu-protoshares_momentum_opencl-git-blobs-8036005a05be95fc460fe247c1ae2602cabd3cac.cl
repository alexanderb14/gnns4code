__constant unsigned long Ga[] = {
    0x428a2f98d728ae22UL, 0x7137449123ef65cdUL, 0xb5c0fbcfec4d3b2fUL, 0xe9b5dba58189dbbcUL, 0x3956c25bf348b538UL, 0x59f111f1b605d019UL, 0x923f82a4af194f9bUL, 0xab1c5ed5da6d8118UL, 0xd807aa98a3030242UL, 0x12835b0145706fbeUL, 0x243185be4ee4b28cUL, 0x550c7dc3d5ffb4e2UL, 0x72be5d74f27b896fUL, 0x80deb1fe3b1696b1UL, 0x9bdc06a725c71235UL, 0xc19bf174cf692694UL, 0xe49b69c19ef14ad2UL, 0xefbe4786384f25e3UL, 0x0fc19dc68b8cd5b5UL, 0x240ca1cc77ac9c65UL,
    0x2de92c6f592b0275UL, 0x4a7484aa6ea6e483UL, 0x5cb0a9dcbd41fbd4UL, 0x76f988da831153b5UL, 0x983e5152ee66dfabUL, 0xa831c66d2db43210UL, 0xb00327c898fb213fUL, 0xbf597fc7beef0ee4UL, 0xc6e00bf33da88fc2UL, 0xd5a79147930aa725UL, 0x06ca6351e003826fUL, 0x142929670a0e6e70UL, 0x27b70a8546d22ffcUL, 0x2e1b21385c26c926UL, 0x4d2c6dfc5ac42aedUL, 0x53380d139d95b3dfUL, 0x650a73548baf63deUL, 0x766a0abb3c77b2a8UL, 0x81c2c92e47edaee6UL, 0x92722c851482353bUL,
    0xa2bfe8a14cf10364UL, 0xa81a664bbc423001UL, 0xc24b8b70d0f89791UL, 0xc76c51a30654be30UL, 0xd192e819d6ef5218UL, 0xd69906245565a910UL, 0xf40e35855771202aUL, 0x106aa07032bbd1b8UL, 0x19a4c116b8d2d0c8UL, 0x1e376c085141ab53UL, 0x2748774cdf8eeb99UL, 0x34b0bcb5e19b48a8UL, 0x391c0cb3c5c95a63UL, 0x4ed8aa4ae3418acbUL, 0x5b9cca4f7763e373UL, 0x682e6ff3d6b2b8a3UL, 0x748f82ee5defb2fcUL, 0x78a5636f43172f60UL, 0x84c87814a1f0ab72UL, 0x8cc702081a6439ecUL,
    0x90befffa23631e28UL, 0xa4506cebde82bde9UL, 0xbef9a3f7b2c67915UL, 0xc67178f2e372532bUL, 0xca273eceea26619cUL, 0xd186b8c721c0c207UL, 0xeada7dd6cde0eb1eUL, 0xf57d4f7fee6ed178UL, 0x06f067aa72176fbaUL, 0x0a637dc5a2c898a6UL, 0x113f9804bef90daeUL, 0x1b710b35131c471bUL, 0x28db77f523047d84UL, 0x32caab7b40c72493UL, 0x3c9ebe0a15c9bebcUL, 0x431d67c49c100d4cUL, 0x4cc5d4becb3e42b6UL, 0x597f299cfc657e2aUL, 0x5fcb6fab3ad6faecUL, 0x6c44198c4a475817UL,
};

__constant unsigned long Gb[] = {
    0x6a09e667f3bcc908UL, 0xbb67ae8584caa73bUL, 0x3c6ef372fe94f82bUL, 0xa54ff53a5f1d36f1UL, 0x510e527fade682d1UL, 0x9b05688c2b3e6c1fUL, 0x1f83d9abfb41bd6bUL, 0x5be0cd19137e2179UL,
};

inline void A(unsigned long* a) {
  unsigned long b = Gb[0];
  unsigned long c = Gb[1];
  unsigned long d = Gb[2];
  unsigned long e = Gb[3];
  unsigned long f = Gb[4];
  unsigned long g = Gb[5];
  unsigned long h = Gb[6];
  unsigned long i = Gb[7];
  unsigned long j, k;

  for (int l = 0; l < 80; l++) {
    if (l > 15) {
      a[l & 15] = ((rotate(a[(l - 2) & 15], (unsigned long)64 - 19)) ^ (rotate(a[(l - 2) & 15], (unsigned long)64 - 61)) ^ (a[(l - 2) & 15] >> 6)) + ((rotate(a[(l - 15) & 15], (unsigned long)64 - 1)) ^ (rotate(a[(l - 15) & 15], (unsigned long)64 - 8)) ^ (a[(l - 15) & 15] >> 7)) + a[(l - 16) & 15] + a[(l - 7) & 15];
    }
    j = Ga[l] + a[l & 15] + i + ((rotate(f, (unsigned long)64 - 14)) ^ (rotate(f, (unsigned long)64 - 18)) ^ (rotate(f, (unsigned long)64 - 41))) + bitselect(h, g, f);
    k = bitselect(b, c, d ^ b) + ((rotate(b, (unsigned long)64 - 28)) ^ (rotate(b, (unsigned long)64 - 34)) ^ (rotate(b, (unsigned long)64 - 39)));
    i = h;
    h = g;
    g = f;
    f = e + j;
    e = d;
    d = c;
    c = b;
    b = j + k;
  }

  a[0] = (((Gb[0] + b) << 56) | (((Gb[0] + b) & 0xff00) << 40) | (((Gb[0] + b) & 0xff0000) << 24) | (((Gb[0] + b) & 0xff000000) << 8) | (((Gb[0] + b) >> 8) & 0xff000000) | (((Gb[0] + b) >> 24) & 0xff0000) | (((Gb[0] + b) >> 40) & 0xff00) | ((Gb[0] + b) >> 56));
  a[1] = (((Gb[1] + c) << 56) | (((Gb[1] + c) & 0xff00) << 40) | (((Gb[1] + c) & 0xff0000) << 24) | (((Gb[1] + c) & 0xff000000) << 8) | (((Gb[1] + c) >> 8) & 0xff000000) | (((Gb[1] + c) >> 24) & 0xff0000) | (((Gb[1] + c) >> 40) & 0xff00) | ((Gb[1] + c) >> 56));
  a[2] = (((Gb[2] + d) << 56) | (((Gb[2] + d) & 0xff00) << 40) | (((Gb[2] + d) & 0xff0000) << 24) | (((Gb[2] + d) & 0xff000000) << 8) | (((Gb[2] + d) >> 8) & 0xff000000) | (((Gb[2] + d) >> 24) & 0xff0000) | (((Gb[2] + d) >> 40) & 0xff00) | ((Gb[2] + d) >> 56));
  a[3] = (((Gb[3] + e) << 56) | (((Gb[3] + e) & 0xff00) << 40) | (((Gb[3] + e) & 0xff0000) << 24) | (((Gb[3] + e) & 0xff000000) << 8) | (((Gb[3] + e) >> 8) & 0xff000000) | (((Gb[3] + e) >> 24) & 0xff0000) | (((Gb[3] + e) >> 40) & 0xff00) | ((Gb[3] + e) >> 56));
  a[4] = (((Gb[4] + f) << 56) | (((Gb[4] + f) & 0xff00) << 40) | (((Gb[4] + f) & 0xff0000) << 24) | (((Gb[4] + f) & 0xff000000) << 8) | (((Gb[4] + f) >> 8) & 0xff000000) | (((Gb[4] + f) >> 24) & 0xff0000) | (((Gb[4] + f) >> 40) & 0xff00) | ((Gb[4] + f) >> 56));
  a[5] = (((Gb[5] + g) << 56) | (((Gb[5] + g) & 0xff00) << 40) | (((Gb[5] + g) & 0xff0000) << 24) | (((Gb[5] + g) & 0xff000000) << 8) | (((Gb[5] + g) >> 8) & 0xff000000) | (((Gb[5] + g) >> 24) & 0xff0000) | (((Gb[5] + g) >> 40) & 0xff00) | ((Gb[5] + g) >> 56));
  a[6] = (((Gb[6] + h) << 56) | (((Gb[6] + h) & 0xff00) << 40) | (((Gb[6] + h) & 0xff0000) << 24) | (((Gb[6] + h) & 0xff000000) << 8) | (((Gb[6] + h) >> 8) & 0xff000000) | (((Gb[6] + h) >> 24) & 0xff0000) | (((Gb[6] + h) >> 40) & 0xff00) | ((Gb[6] + h) >> 56));
  a[7] = (((Gb[7] + i) << 56) | (((Gb[7] + i) & 0xff00) << 40) | (((Gb[7] + i) & 0xff0000) << 24) | (((Gb[7] + i) & 0xff000000) << 8) | (((Gb[7] + i) >> 8) & 0xff000000) | (((Gb[7] + i) >> 24) & 0xff0000) | (((Gb[7] + i) >> 40) & 0xff00) | ((Gb[7] + i) >> 56));
}
inline unsigned int B(unsigned long a, unsigned int b) {
  return (unsigned int)((a >> b) | (a << (50 - b)));
}
kernel void C(constant unsigned long* a, global unsigned int* b, global unsigned int* c) {
  unsigned long d[16];
  const unsigned int e = get_global_id(0);
  for (int f = 0; f < 16; f++)
    d[f] = a[f];

  ((unsigned int*)d)[1] = (((e * 8) << 24) | (((e * 8) << 8) & 0x00ff0000) | (((e * 8) >> 8) & 0x0000ff00) | ((e * 8) >> 24));

  A(d);

  unsigned int g = 0;
  for (int f = 0; f < 8; f++) {
    d[f] = d[f] >> (64 - 50);
    const BITMAP_INDEX_TYPE h = ((d[f]) & ((1024 * 8lu) - 1lu));
    const unsigned int i = (h / 32);
    const unsigned int j = (h % 32);
    const unsigned int k = 1 << j;
    unsigned int l = atomic_or(&b[i], k);

    if (l & k && g == 0) {
      g = 1;
      const unsigned int m = atomic_add(c, 1) + 1;
      c[m] = e * 8;
    }
  }
}

kernel void D(global float8* a) {
  a[get_global_id(0)] = 0;
}

kernel void E(constant unsigned long* a, global unsigned int* b, global unsigned int* c) {
  unsigned long d[16];
  const unsigned int e = get_global_id(0);
  const unsigned int f = c[e + 1];
  for (int g = 0; g < 16; g++)
    d[g] = a[g];

  ((unsigned int*)d)[1] = (((f) << 24) | (((f) << 8) & 0x00ff0000) | (((f) >> 8) & 0x0000ff00) | ((f) >> 24));

  A(d);

  for (int g = 0; g < 8; g++) {
    d[g] = d[g] >> (64 - 50);
    const BITMAP_INDEX_TYPE h = ((d[g]) & ((1024 * 8lu) - 1lu));
    const unsigned int i = h / 32;
    const unsigned int j = h % 32;
    const unsigned int k = 1 << j;
    atomic_or(&b[i], k);
  }
}

kernel void F(constant unsigned long* a, global unsigned int* b, global unsigned int* c) {
  unsigned long d[16];
  const unsigned int e = get_global_id(0);
  for (int f = 0; f < 16; f++)
    d[f] = a[f];

  ((unsigned int*)d)[1] = (((e * 8) << 24) | (((e * 8) << 8) & 0x00ff0000) | (((e * 8) >> 8) & 0x0000ff00) | ((e * 8) >> 24));

  A(d);
  unsigned int g = 0;
  for (int f = 0; f < 8; f++) {
    d[f] = d[f] >> (64 - 50);
    const BITMAP_INDEX_TYPE h = ((d[f]) & ((1024 * 8lu) - 1lu));
    const unsigned int i = h / 32;
    const unsigned int j = h % 32;
    const unsigned int k = 1 << j;
    const unsigned int l = b[i] & k;
    if (l & k && g == 0) {
      g = 1;
      const unsigned int m = atomic_add(c, 1) + 1;
      c[m] = e * 8;
    }
  }
}

kernel void G(constant unsigned long* a, global unsigned int* b, global unsigned int* c, global unsigned int* d, unsigned int e) {
  unsigned long f[16];
  const unsigned int g = get_global_id(0);
  const unsigned int h = c[g + 1];
  for (int i = 0; i < 16; i++)
    f[i] = a[i];

  ((unsigned int*)f)[1] = (((h) << 24) | (((h) << 8) & 0x00ff0000) | (((h) >> 8) & 0x0000ff00) | ((h) >> 24));

  A(f);
  unsigned int j = 0;
  for (int i = 0; i < 8; i++) {
    const BITMAP_INDEX_TYPE k = ((B(f[i] >> (64 - 50), e)) & ((1024 * 8lu) - 1lu));
    const unsigned int l = k / 32;
    const unsigned int m = k % 32;
    const unsigned int n = 1 << m;
    const unsigned int o = atomic_or(&b[l], n);
    if (o & n && j == 0) {
      j = 1;
      const unsigned int p = atomic_add(d, 1) + 1;
      d[p] = h;
    }
  }
}

kernel void H(constant unsigned long* a, global unsigned int* b, global unsigned int* c, unsigned int d) {
  unsigned long e[16];
  const unsigned int f = get_global_id(0);
  const unsigned int g = c[f + 1];
  for (int h = 0; h < 16; h++)
    e[h] = a[h];

  ((unsigned int*)e)[1] = (((g) << 24) | (((g) << 8) & 0x00ff0000) | (((g) >> 8) & 0x0000ff00) | ((g) >> 24));

  A(e);

  for (int h = 0; h < 8; h++) {
    const BITMAP_INDEX_TYPE i = ((B(e[h] >> (64 - 50), d)) & ((1024 * 8lu) - 1lu));
    const unsigned int j = i / 32;
    const unsigned int k = i % 32;
    const unsigned int l = 1 << k;
    atomic_or(&b[j], l);
  }
}

kernel void I(constant unsigned long* a, global unsigned int* b, global unsigned int* c, global unsigned int* d, unsigned int e) {
  unsigned long f[16];
  const unsigned int g = get_global_id(0);
  const unsigned int h = c[g + 1];
  for (int i = 0; i < 16; i++)
    f[i] = a[i];

  ((unsigned int*)f)[1] = (((h) << 24) | (((h) << 8) & 0x00ff0000) | (((h) >> 8) & 0x0000ff00) | ((h) >> 24));

  A(f);
  unsigned int j = 0;
  for (int i = 0; i < 8; i++) {
    const BITMAP_INDEX_TYPE k = ((B(f[i] >> (64 - 50), e)) & ((1024 * 8lu) - 1lu));
    const unsigned int l = k / 32;
    const unsigned int m = k % 32;
    const unsigned int n = 1 << m;
    const unsigned int o = b[l] & n;
    if (o & n && j == 0) {
      j = 1;
      const unsigned int p = atomic_add(d, 1) + 1;
      d[p] = h;
    }
  }
}
kernel void J(constant unsigned long* a, global unsigned int* b, global unsigned int* c, global unsigned int* d) {
  unsigned long e[16];
  const unsigned int f = get_global_id(0);
  for (int g = 0; g < 16; g++)
    e[g] = a[g];

  ((unsigned int*)e)[1] = (((f * 8) << 24) | (((f * 8) << 8) & 0x00ff0000) | (((f * 8) >> 8) & 0x0000ff00) | ((f * 8) >> 24));

  A(e);

  unsigned int h = 0;
  for (int g = 0; g < 8; g++) {
    e[g] = e[g] >> (64 - 50);
    BITMAP_INDEX_TYPE i = ((e[g]) & ((1024 * 8lu) - 1lu));
    const unsigned int j = i / 32;
    global unsigned int* k = (j >= 1024 / 8) ? &c[j - 1024 / 8] : &b[j];
    const unsigned int l = (i % 32);
    const unsigned int m = 1 << l;
    unsigned int n = atomic_or(k, m);

    if (n & m && h == 0) {
      h = 1;
      const unsigned int o = atomic_add(d, 1) + 1;
      d[o] = f * 8;
    }
  }
}

kernel void K(global float8* a, global float8* b) {
  const unsigned int c = get_global_id(0);
  a[c] = 0;
  b[c] = 0;
}

kernel void L(constant unsigned long* a, global unsigned int* b, global unsigned int* c, global unsigned int* d) {
  unsigned long e[16];
  const unsigned int f = get_global_id(0);
  const unsigned int g = d[f + 1];
  for (int h = 0; h < 16; h++)
    e[h] = a[h];

  ((unsigned int*)e)[1] = (((g) << 24) | (((g) << 8) & 0x00ff0000) | (((g) >> 8) & 0x0000ff00) | ((g) >> 24));

  A(e);

  for (int h = 0; h < 8; h++) {
    e[h] = e[h] >> (64 - 50);
    BITMAP_INDEX_TYPE i = ((e[h]) & ((1024 * 8lu) - 1lu));
    const unsigned int j = i / 32;
    global unsigned int* k = (j >= 1024 / 8) ? &c[j - 1024 / 8] : &b[j];
    const unsigned int l = i % 32;
    const unsigned int m = 1 << l;
    atomic_or(k, m);
  }
}

kernel void M(constant unsigned long* a, global unsigned int* b, global unsigned int* c, global unsigned int* d) {
  unsigned long e[16];
  const unsigned int f = get_global_id(0);
  for (int g = 0; g < 16; g++)
    e[g] = a[g];

  ((unsigned int*)e)[1] = (((f * 8) << 24) | (((f * 8) << 8) & 0x00ff0000) | (((f * 8) >> 8) & 0x0000ff00) | ((f * 8) >> 24));

  A(e);
  unsigned int h = 0;
  for (int g = 0; g < 8; g++) {
    e[g] = e[g] >> (64 - 50);
    BITMAP_INDEX_TYPE i = ((e[g]) & ((1024 * 8lu) - 1lu));
    const unsigned int j = i / 32;
    global unsigned int* k = (j >= 1024 / 8) ? &c[j - 1024 / 8] : &b[j];
    const unsigned int l = i % 32;
    const unsigned int m = 1 << l;
    const unsigned int n = *k & m;
    if (n & m && h == 0) {
      h = 1;
      const unsigned int o = atomic_add(d, 1) + 1;
      d[o] = f * 8;
    }
  }
}

kernel void N(constant unsigned long* a, global unsigned int* b, global unsigned int* c, global unsigned int* d, global unsigned int* e, unsigned int f) {
  unsigned long g[16];
  const unsigned int h = get_global_id(0);
  const unsigned int i = d[h + 1];
  for (int j = 0; j < 16; j++)
    g[j] = a[j];

  ((unsigned int*)g)[1] = (((i) << 24) | (((i) << 8) & 0x00ff0000) | (((i) >> 8) & 0x0000ff00) | ((i) >> 24));

  A(g);
  unsigned int k = 0;
  for (int j = 0; j < 8; j++) {
    BITMAP_INDEX_TYPE l = ((B(g[j] >> (64 - 50), f)) & ((1024 * 8lu) - 1lu));
    const unsigned int m = l / 32;
    global unsigned int* n = (m >= 1024 / 8) ? &c[m - 1024 / 8] : &b[m];
    const unsigned int o = l % 32;
    const unsigned int p = 1 << o;
    const unsigned int q = atomic_or(n, p);
    if (q & p && k == 0) {
      k = 1;
      const unsigned int r = atomic_add(e, 1) + 1;
      e[r] = i;
    }
  }
}

kernel void O(constant unsigned long* a, global unsigned int* b, global unsigned int* c, global unsigned int* d, unsigned int e) {
  unsigned long f[16];
  const unsigned int g = get_global_id(0);
  const unsigned int h = d[g + 1];
  for (int i = 0; i < 16; i++)
    f[i] = a[i];

  ((unsigned int*)f)[1] = (((h) << 24) | (((h) << 8) & 0x00ff0000) | (((h) >> 8) & 0x0000ff00) | ((h) >> 24));

  A(f);

  for (int i = 0; i < 8; i++) {
    BITMAP_INDEX_TYPE j = ((B(f[i] >> (64 - 50), e)) & ((1024 * 8lu) - 1lu));
    const unsigned int k = j / 32;
    global unsigned int* l = (k >= 1024 / 8) ? &c[k - 1024 / 8] : &b[k];
    const unsigned int m = j % 32;
    const unsigned int n = 1 << m;
    atomic_or(l, n);
  }
}

kernel void P(constant unsigned long* a, global unsigned int* b, global unsigned int* c, global unsigned int* d, global unsigned int* e, unsigned int f) {
  unsigned long g[16];
  const unsigned int h = get_global_id(0);
  const unsigned int i = d[h + 1];
  for (int j = 0; j < 16; j++)
    g[j] = a[j];

  ((unsigned int*)g)[1] = (((i) << 24) | (((i) << 8) & 0x00ff0000) | (((i) >> 8) & 0x0000ff00) | ((i) >> 24));

  A(g);
  unsigned int k = 0;
  for (int j = 0; j < 8; j++) {
    BITMAP_INDEX_TYPE l = ((B(g[j] >> (64 - 50), f)) & ((1024 * 8lu) - 1lu));
    const unsigned int m = l / 32;
    global unsigned int* n = (m >= 1024 / 8) ? &c[m - 1024 / 8] : &b[m];
    const unsigned int o = l % 32;
    const unsigned int p = 1 << o;
    const unsigned int q = *n & p;
    if (q & p && k == 0) {
      k = 1;
      const unsigned int r = atomic_add(e, 1) + 1;
      e[r] = i;
    }
  }
}
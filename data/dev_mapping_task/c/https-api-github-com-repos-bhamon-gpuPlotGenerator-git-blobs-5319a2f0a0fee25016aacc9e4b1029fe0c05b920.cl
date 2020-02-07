typedef struct {
  unsigned int A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, AA, AB;
  unsigned int B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, BA, BB, BC, BD, BE, BF;
  unsigned int C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, CA, CB, CC, CD, CE, CF;
  unsigned int Wlow, Whigh;
} shabal_context_t;

void A(shabal_context_t* a) {
  a->A0 = 0x52f84552;
  a->A1 = 0xe54b7999;
  a->A2 = 0x2d8ee3ec;
  a->A3 = 0xb9645191;
  a->A4 = 0xe0078b86;
  a->A5 = 0xbb7c44c9;
  a->A6 = 0xd2b5c1ca;
  a->A7 = 0xb0d2eb8c;
  a->A8 = 0x14ce5a45;
  a->A9 = 0x22af50dc;
  a->AA = 0xeffdbc6b;
  a->AB = 0xeb21b74a;

  a->B0 = 0xb555c6ee;
  a->B1 = 0x3e710596;
  a->B2 = 0xa72a652f;
  a->B3 = 0x9301515f;
  a->B4 = 0xda28c1fa;
  a->B5 = 0x696fd868;
  a->B6 = 0x9cb6bf72;
  a->B7 = 0x0afe4002;
  a->B8 = 0xa6e03615;
  a->B9 = 0x5138c1d4;
  a->BA = 0xbe216306;
  a->BB = 0xb38b8890;
  a->BC = 0x3ea8b96b;
  a->BD = 0x3299ace4;
  a->BE = 0x30924dd4;
  a->BF = 0x55cb34a5;

  a->C0 = 0xb405f031;
  a->C1 = 0xc4233eba;
  a->C2 = 0xb3733979;
  a->C3 = 0xc0dd9d55;
  a->C4 = 0xc51c28ae;
  a->C5 = 0xa327b8e1;
  a->C6 = 0x56c56167;
  a->C7 = 0xed614433;
  a->C8 = 0x88b59d60;
  a->C9 = 0x60e2ceba;
  a->CA = 0x758b4b8b;
  a->CB = 0x83e82a7f;
  a->CC = 0xbc968828;
  a->CD = 0xe6e00bf7;
  a->CE = 0xba839e55;
  a->CF = 0x9b491c60;

  a->Wlow = 1;
  a->Whigh = 0;
}

void B(shabal_context_t* a, __global unsigned char* b, unsigned int c, unsigned int d) {
  __global unsigned int* e = (__global unsigned int*)b;
  unsigned int f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u;
  unsigned int v = d >> 6;
  unsigned int w = d & 63;

  for (unsigned int x = 0; x < v; ++x) {
    unsigned long y = (c >> 2) + (x << 4);
    f = e[y];
    g = e[y + 1];
    h = e[y + 2];
    i = e[y + 3];
    j = e[y + 4];
    k = e[y + 5];
    l = e[y + 6];
    m = e[y + 7];
    n = e[y + 8];
    o = e[y + 9];
    p = e[y + 10];
    q = e[y + 11];
    r = e[y + 12];
    s = e[y + 13];
    t = e[y + 14];
    u = e[y + 15];

    do {
      a->B0 = (__builtin_astype(a->B0 + f, uint));
      a->B1 = (__builtin_astype(a->B1 + g, uint));
      a->B2 = (__builtin_astype(a->B2 + h, uint));
      a->B3 = (__builtin_astype(a->B3 + i, uint));
      a->B4 = (__builtin_astype(a->B4 + j, uint));
      a->B5 = (__builtin_astype(a->B5 + k, uint));
      a->B6 = (__builtin_astype(a->B6 + l, uint));
      a->B7 = (__builtin_astype(a->B7 + m, uint));
      a->B8 = (__builtin_astype(a->B8 + n, uint));
      a->B9 = (__builtin_astype(a->B9 + o, uint));
      a->BA = (__builtin_astype(a->BA + p, uint));
      a->BB = (__builtin_astype(a->BB + q, uint));
      a->BC = (__builtin_astype(a->BC + r, uint));
      a->BD = (__builtin_astype(a->BD + s, uint));
      a->BE = (__builtin_astype(a->BE + t, uint));
      a->BF = (__builtin_astype(a->BF + u, uint));
    } while (0);
    do {
      a->A0 ^= a->Wlow;
      a->A1 ^= a->Whigh;
    } while (0);
    do {
      a->B0 = (__builtin_astype(a->B0 << 17, uint)) | (a->B0 >> 15);
      a->B1 = (__builtin_astype(a->B1 << 17, uint)) | (a->B1 >> 15);
      a->B2 = (__builtin_astype(a->B2 << 17, uint)) | (a->B2 >> 15);
      a->B3 = (__builtin_astype(a->B3 << 17, uint)) | (a->B3 >> 15);
      a->B4 = (__builtin_astype(a->B4 << 17, uint)) | (a->B4 >> 15);
      a->B5 = (__builtin_astype(a->B5 << 17, uint)) | (a->B5 >> 15);
      a->B6 = (__builtin_astype(a->B6 << 17, uint)) | (a->B6 >> 15);
      a->B7 = (__builtin_astype(a->B7 << 17, uint)) | (a->B7 >> 15);
      a->B8 = (__builtin_astype(a->B8 << 17, uint)) | (a->B8 >> 15);
      a->B9 = (__builtin_astype(a->B9 << 17, uint)) | (a->B9 >> 15);
      a->BA = (__builtin_astype(a->BA << 17, uint)) | (a->BA >> 15);
      a->BB = (__builtin_astype(a->BB << 17, uint)) | (a->BB >> 15);
      a->BC = (__builtin_astype(a->BC << 17, uint)) | (a->BC >> 15);
      a->BD = (__builtin_astype(a->BD << 17, uint)) | (a->BD >> 15);
      a->BE = (__builtin_astype(a->BE << 17, uint)) | (a->BE >> 15);
      a->BF = (__builtin_astype(a->BF << 17, uint)) | (a->BF >> 15);
      do {
        do {
          a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->C8) * 3U, uint)) ^ a->BD ^ (a->B9 & ~a->B6) ^ f;
          a->B0 = (__builtin_astype(~(((a->B0 << 1) | (a->B0 >> 31)) ^ a->A0), uint));
        } while (0);
        do {
          a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->C7) * 3U, uint)) ^ a->BE ^ (a->BA & ~a->B7) ^ g;
          a->B1 = (__builtin_astype(~(((a->B1 << 1) | (a->B1 >> 31)) ^ a->A1), uint));
        } while (0);
        do {
          a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->C6) * 3U, uint)) ^ a->BF ^ (a->BB & ~a->B8) ^ h;
          a->B2 = (__builtin_astype(~(((a->B2 << 1) | (a->B2 >> 31)) ^ a->A2), uint));
        } while (0);
        do {
          a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->C5) * 3U, uint)) ^ a->B0 ^ (a->BC & ~a->B9) ^ i;
          a->B3 = (__builtin_astype(~(((a->B3 << 1) | (a->B3 >> 31)) ^ a->A3), uint));
        } while (0);
        do {
          a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->C4) * 3U, uint)) ^ a->B1 ^ (a->BD & ~a->BA) ^ j;
          a->B4 = (__builtin_astype(~(((a->B4 << 1) | (a->B4 >> 31)) ^ a->A4), uint));
        } while (0);
        do {
          a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->C3) * 3U, uint)) ^ a->B2 ^ (a->BE & ~a->BB) ^ k;
          a->B5 = (__builtin_astype(~(((a->B5 << 1) | (a->B5 >> 31)) ^ a->A5), uint));
        } while (0);
        do {
          a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->C2) * 3U, uint)) ^ a->B3 ^ (a->BF & ~a->BC) ^ l;
          a->B6 = (__builtin_astype(~(((a->B6 << 1) | (a->B6 >> 31)) ^ a->A6), uint));
        } while (0);
        do {
          a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->C1) * 3U, uint)) ^ a->B4 ^ (a->B0 & ~a->BD) ^ m;
          a->B7 = (__builtin_astype(~(((a->B7 << 1) | (a->B7 >> 31)) ^ a->A7), uint));
        } while (0);
        do {
          a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->C0) * 3U, uint)) ^ a->B5 ^ (a->B1 & ~a->BE) ^ n;
          a->B8 = (__builtin_astype(~(((a->B8 << 1) | (a->B8 >> 31)) ^ a->A8), uint));
        } while (0);
        do {
          a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->CF) * 3U, uint)) ^ a->B6 ^ (a->B2 & ~a->BF) ^ o;
          a->B9 = (__builtin_astype(~(((a->B9 << 1) | (a->B9 >> 31)) ^ a->A9), uint));
        } while (0);
        do {
          a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->CE) * 3U, uint)) ^ a->B7 ^ (a->B3 & ~a->B0) ^ p;
          a->BA = (__builtin_astype(~(((a->BA << 1) | (a->BA >> 31)) ^ a->AA), uint));
        } while (0);
        do {
          a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->CD) * 3U, uint)) ^ a->B8 ^ (a->B4 & ~a->B1) ^ q;
          a->BB = (__builtin_astype(~(((a->BB << 1) | (a->BB >> 31)) ^ a->AB), uint));
        } while (0);
        do {
          a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->CC) * 3U, uint)) ^ a->B9 ^ (a->B5 & ~a->B2) ^ r;
          a->BC = (__builtin_astype(~(((a->BC << 1) | (a->BC >> 31)) ^ a->A0), uint));
        } while (0);
        do {
          a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->CB) * 3U, uint)) ^ a->BA ^ (a->B6 & ~a->B3) ^ s;
          a->BD = (__builtin_astype(~(((a->BD << 1) | (a->BD >> 31)) ^ a->A1), uint));
        } while (0);
        do {
          a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->CA) * 3U, uint)) ^ a->BB ^ (a->B7 & ~a->B4) ^ t;
          a->BE = (__builtin_astype(~(((a->BE << 1) | (a->BE >> 31)) ^ a->A2), uint));
        } while (0);
        do {
          a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->C9) * 3U, uint)) ^ a->BC ^ (a->B8 & ~a->B5) ^ u;
          a->BF = (__builtin_astype(~(((a->BF << 1) | (a->BF >> 31)) ^ a->A3), uint));
        } while (0);
      } while (0);
      do {
        do {
          a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->C8) * 3U, uint)) ^ a->BD ^ (a->B9 & ~a->B6) ^ f;
          a->B0 = (__builtin_astype(~(((a->B0 << 1) | (a->B0 >> 31)) ^ a->A4), uint));
        } while (0);
        do {
          a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->C7) * 3U, uint)) ^ a->BE ^ (a->BA & ~a->B7) ^ g;
          a->B1 = (__builtin_astype(~(((a->B1 << 1) | (a->B1 >> 31)) ^ a->A5), uint));
        } while (0);
        do {
          a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->C6) * 3U, uint)) ^ a->BF ^ (a->BB & ~a->B8) ^ h;
          a->B2 = (__builtin_astype(~(((a->B2 << 1) | (a->B2 >> 31)) ^ a->A6), uint));
        } while (0);
        do {
          a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->C5) * 3U, uint)) ^ a->B0 ^ (a->BC & ~a->B9) ^ i;
          a->B3 = (__builtin_astype(~(((a->B3 << 1) | (a->B3 >> 31)) ^ a->A7), uint));
        } while (0);
        do {
          a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->C4) * 3U, uint)) ^ a->B1 ^ (a->BD & ~a->BA) ^ j;
          a->B4 = (__builtin_astype(~(((a->B4 << 1) | (a->B4 >> 31)) ^ a->A8), uint));
        } while (0);
        do {
          a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->C3) * 3U, uint)) ^ a->B2 ^ (a->BE & ~a->BB) ^ k;
          a->B5 = (__builtin_astype(~(((a->B5 << 1) | (a->B5 >> 31)) ^ a->A9), uint));
        } while (0);
        do {
          a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->C2) * 3U, uint)) ^ a->B3 ^ (a->BF & ~a->BC) ^ l;
          a->B6 = (__builtin_astype(~(((a->B6 << 1) | (a->B6 >> 31)) ^ a->AA), uint));
        } while (0);
        do {
          a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->C1) * 3U, uint)) ^ a->B4 ^ (a->B0 & ~a->BD) ^ m;
          a->B7 = (__builtin_astype(~(((a->B7 << 1) | (a->B7 >> 31)) ^ a->AB), uint));
        } while (0);
        do {
          a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->C0) * 3U, uint)) ^ a->B5 ^ (a->B1 & ~a->BE) ^ n;
          a->B8 = (__builtin_astype(~(((a->B8 << 1) | (a->B8 >> 31)) ^ a->A0), uint));
        } while (0);
        do {
          a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->CF) * 3U, uint)) ^ a->B6 ^ (a->B2 & ~a->BF) ^ o;
          a->B9 = (__builtin_astype(~(((a->B9 << 1) | (a->B9 >> 31)) ^ a->A1), uint));
        } while (0);
        do {
          a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->CE) * 3U, uint)) ^ a->B7 ^ (a->B3 & ~a->B0) ^ p;
          a->BA = (__builtin_astype(~(((a->BA << 1) | (a->BA >> 31)) ^ a->A2), uint));
        } while (0);
        do {
          a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->CD) * 3U, uint)) ^ a->B8 ^ (a->B4 & ~a->B1) ^ q;
          a->BB = (__builtin_astype(~(((a->BB << 1) | (a->BB >> 31)) ^ a->A3), uint));
        } while (0);
        do {
          a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->CC) * 3U, uint)) ^ a->B9 ^ (a->B5 & ~a->B2) ^ r;
          a->BC = (__builtin_astype(~(((a->BC << 1) | (a->BC >> 31)) ^ a->A4), uint));
        } while (0);
        do {
          a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->CB) * 3U, uint)) ^ a->BA ^ (a->B6 & ~a->B3) ^ s;
          a->BD = (__builtin_astype(~(((a->BD << 1) | (a->BD >> 31)) ^ a->A5), uint));
        } while (0);
        do {
          a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->CA) * 3U, uint)) ^ a->BB ^ (a->B7 & ~a->B4) ^ t;
          a->BE = (__builtin_astype(~(((a->BE << 1) | (a->BE >> 31)) ^ a->A6), uint));
        } while (0);
        do {
          a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->C9) * 3U, uint)) ^ a->BC ^ (a->B8 & ~a->B5) ^ u;
          a->BF = (__builtin_astype(~(((a->BF << 1) | (a->BF >> 31)) ^ a->A7), uint));
        } while (0);
      } while (0);
      do {
        do {
          a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->C8) * 3U, uint)) ^ a->BD ^ (a->B9 & ~a->B6) ^ f;
          a->B0 = (__builtin_astype(~(((a->B0 << 1) | (a->B0 >> 31)) ^ a->A8), uint));
        } while (0);
        do {
          a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->C7) * 3U, uint)) ^ a->BE ^ (a->BA & ~a->B7) ^ g;
          a->B1 = (__builtin_astype(~(((a->B1 << 1) | (a->B1 >> 31)) ^ a->A9), uint));
        } while (0);
        do {
          a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->C6) * 3U, uint)) ^ a->BF ^ (a->BB & ~a->B8) ^ h;
          a->B2 = (__builtin_astype(~(((a->B2 << 1) | (a->B2 >> 31)) ^ a->AA), uint));
        } while (0);
        do {
          a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->C5) * 3U, uint)) ^ a->B0 ^ (a->BC & ~a->B9) ^ i;
          a->B3 = (__builtin_astype(~(((a->B3 << 1) | (a->B3 >> 31)) ^ a->AB), uint));
        } while (0);
        do {
          a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->C4) * 3U, uint)) ^ a->B1 ^ (a->BD & ~a->BA) ^ j;
          a->B4 = (__builtin_astype(~(((a->B4 << 1) | (a->B4 >> 31)) ^ a->A0), uint));
        } while (0);
        do {
          a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->C3) * 3U, uint)) ^ a->B2 ^ (a->BE & ~a->BB) ^ k;
          a->B5 = (__builtin_astype(~(((a->B5 << 1) | (a->B5 >> 31)) ^ a->A1), uint));
        } while (0);
        do {
          a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->C2) * 3U, uint)) ^ a->B3 ^ (a->BF & ~a->BC) ^ l;
          a->B6 = (__builtin_astype(~(((a->B6 << 1) | (a->B6 >> 31)) ^ a->A2), uint));
        } while (0);
        do {
          a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->C1) * 3U, uint)) ^ a->B4 ^ (a->B0 & ~a->BD) ^ m;
          a->B7 = (__builtin_astype(~(((a->B7 << 1) | (a->B7 >> 31)) ^ a->A3), uint));
        } while (0);
        do {
          a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->C0) * 3U, uint)) ^ a->B5 ^ (a->B1 & ~a->BE) ^ n;
          a->B8 = (__builtin_astype(~(((a->B8 << 1) | (a->B8 >> 31)) ^ a->A4), uint));
        } while (0);
        do {
          a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->CF) * 3U, uint)) ^ a->B6 ^ (a->B2 & ~a->BF) ^ o;
          a->B9 = (__builtin_astype(~(((a->B9 << 1) | (a->B9 >> 31)) ^ a->A5), uint));
        } while (0);
        do {
          a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->CE) * 3U, uint)) ^ a->B7 ^ (a->B3 & ~a->B0) ^ p;
          a->BA = (__builtin_astype(~(((a->BA << 1) | (a->BA >> 31)) ^ a->A6), uint));
        } while (0);
        do {
          a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->CD) * 3U, uint)) ^ a->B8 ^ (a->B4 & ~a->B1) ^ q;
          a->BB = (__builtin_astype(~(((a->BB << 1) | (a->BB >> 31)) ^ a->A7), uint));
        } while (0);
        do {
          a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->CC) * 3U, uint)) ^ a->B9 ^ (a->B5 & ~a->B2) ^ r;
          a->BC = (__builtin_astype(~(((a->BC << 1) | (a->BC >> 31)) ^ a->A8), uint));
        } while (0);
        do {
          a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->CB) * 3U, uint)) ^ a->BA ^ (a->B6 & ~a->B3) ^ s;
          a->BD = (__builtin_astype(~(((a->BD << 1) | (a->BD >> 31)) ^ a->A9), uint));
        } while (0);
        do {
          a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->CA) * 3U, uint)) ^ a->BB ^ (a->B7 & ~a->B4) ^ t;
          a->BE = (__builtin_astype(~(((a->BE << 1) | (a->BE >> 31)) ^ a->AA), uint));
        } while (0);
        do {
          a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->C9) * 3U, uint)) ^ a->BC ^ (a->B8 & ~a->B5) ^ u;
          a->BF = (__builtin_astype(~(((a->BF << 1) | (a->BF >> 31)) ^ a->AB), uint));
        } while (0);
      } while (0);
      a->AB = (__builtin_astype(a->AB + a->C6, uint));
      a->AA = (__builtin_astype(a->AA + a->C5, uint));
      a->A9 = (__builtin_astype(a->A9 + a->C4, uint));
      a->A8 = (__builtin_astype(a->A8 + a->C3, uint));
      a->A7 = (__builtin_astype(a->A7 + a->C2, uint));
      a->A6 = (__builtin_astype(a->A6 + a->C1, uint));
      a->A5 = (__builtin_astype(a->A5 + a->C0, uint));
      a->A4 = (__builtin_astype(a->A4 + a->CF, uint));
      a->A3 = (__builtin_astype(a->A3 + a->CE, uint));
      a->A2 = (__builtin_astype(a->A2 + a->CD, uint));
      a->A1 = (__builtin_astype(a->A1 + a->CC, uint));
      a->A0 = (__builtin_astype(a->A0 + a->CB, uint));
      a->AB = (__builtin_astype(a->AB + a->CA, uint));
      a->AA = (__builtin_astype(a->AA + a->C9, uint));
      a->A9 = (__builtin_astype(a->A9 + a->C8, uint));
      a->A8 = (__builtin_astype(a->A8 + a->C7, uint));
      a->A7 = (__builtin_astype(a->A7 + a->C6, uint));
      a->A6 = (__builtin_astype(a->A6 + a->C5, uint));
      a->A5 = (__builtin_astype(a->A5 + a->C4, uint));
      a->A4 = (__builtin_astype(a->A4 + a->C3, uint));
      a->A3 = (__builtin_astype(a->A3 + a->C2, uint));
      a->A2 = (__builtin_astype(a->A2 + a->C1, uint));
      a->A1 = (__builtin_astype(a->A1 + a->C0, uint));
      a->A0 = (__builtin_astype(a->A0 + a->CF, uint));
      a->AB = (__builtin_astype(a->AB + a->CE, uint));
      a->AA = (__builtin_astype(a->AA + a->CD, uint));
      a->A9 = (__builtin_astype(a->A9 + a->CC, uint));
      a->A8 = (__builtin_astype(a->A8 + a->CB, uint));
      a->A7 = (__builtin_astype(a->A7 + a->CA, uint));
      a->A6 = (__builtin_astype(a->A6 + a->C9, uint));
      a->A5 = (__builtin_astype(a->A5 + a->C8, uint));
      a->A4 = (__builtin_astype(a->A4 + a->C7, uint));
      a->A3 = (__builtin_astype(a->A3 + a->C6, uint));
      a->A2 = (__builtin_astype(a->A2 + a->C5, uint));
      a->A1 = (__builtin_astype(a->A1 + a->C4, uint));
      a->A0 = (__builtin_astype(a->A0 + a->C3, uint));
    } while (0);
    do {
      a->C0 = (__builtin_astype(a->C0 - f, uint));
      a->C1 = (__builtin_astype(a->C1 - g, uint));
      a->C2 = (__builtin_astype(a->C2 - h, uint));
      a->C3 = (__builtin_astype(a->C3 - i, uint));
      a->C4 = (__builtin_astype(a->C4 - j, uint));
      a->C5 = (__builtin_astype(a->C5 - k, uint));
      a->C6 = (__builtin_astype(a->C6 - l, uint));
      a->C7 = (__builtin_astype(a->C7 - m, uint));
      a->C8 = (__builtin_astype(a->C8 - n, uint));
      a->C9 = (__builtin_astype(a->C9 - o, uint));
      a->CA = (__builtin_astype(a->CA - p, uint));
      a->CB = (__builtin_astype(a->CB - q, uint));
      a->CC = (__builtin_astype(a->CC - r, uint));
      a->CD = (__builtin_astype(a->CD - s, uint));
      a->CE = (__builtin_astype(a->CE - t, uint));
      a->CF = (__builtin_astype(a->CF - u, uint));
    } while (0);
    do {
      do {
        unsigned int z = (a->B0);
        (a->B0) = (a->C0);
        (a->C0) = z;
      } while (0);
      do {
        unsigned int z = (a->B1);
        (a->B1) = (a->C1);
        (a->C1) = z;
      } while (0);
      do {
        unsigned int z = (a->B2);
        (a->B2) = (a->C2);
        (a->C2) = z;
      } while (0);
      do {
        unsigned int z = (a->B3);
        (a->B3) = (a->C3);
        (a->C3) = z;
      } while (0);
      do {
        unsigned int z = (a->B4);
        (a->B4) = (a->C4);
        (a->C4) = z;
      } while (0);
      do {
        unsigned int z = (a->B5);
        (a->B5) = (a->C5);
        (a->C5) = z;
      } while (0);
      do {
        unsigned int z = (a->B6);
        (a->B6) = (a->C6);
        (a->C6) = z;
      } while (0);
      do {
        unsigned int z = (a->B7);
        (a->B7) = (a->C7);
        (a->C7) = z;
      } while (0);
      do {
        unsigned int z = (a->B8);
        (a->B8) = (a->C8);
        (a->C8) = z;
      } while (0);
      do {
        unsigned int z = (a->B9);
        (a->B9) = (a->C9);
        (a->C9) = z;
      } while (0);
      do {
        unsigned int z = (a->BA);
        (a->BA) = (a->CA);
        (a->CA) = z;
      } while (0);
      do {
        unsigned int z = (a->BB);
        (a->BB) = (a->CB);
        (a->CB) = z;
      } while (0);
      do {
        unsigned int z = (a->BC);
        (a->BC) = (a->CC);
        (a->CC) = z;
      } while (0);
      do {
        unsigned int z = (a->BD);
        (a->BD) = (a->CD);
        (a->CD) = z;
      } while (0);
      do {
        unsigned int z = (a->BE);
        (a->BE) = (a->CE);
        (a->CE) = z;
      } while (0);
      do {
        unsigned int z = (a->BF);
        (a->BF) = (a->CF);
        (a->CF) = z;
      } while (0);
    } while (0);
    do {
      if ((a->Wlow = (__builtin_astype(a->Wlow + 1, uint))) == 0)
        a->Whigh = (__builtin_astype(a->Whigh + 1, uint));
    } while (0);
  }

  if (w == 0) {
    f = 0x80;
    g = h = i = j = k = l = m = n = o = p = q = r = s = t = u = 0;

    do {
      a->B0 = (__builtin_astype(a->B0 + f, uint));
      a->B1 = (__builtin_astype(a->B1 + g, uint));
      a->B2 = (__builtin_astype(a->B2 + h, uint));
      a->B3 = (__builtin_astype(a->B3 + i, uint));
      a->B4 = (__builtin_astype(a->B4 + j, uint));
      a->B5 = (__builtin_astype(a->B5 + k, uint));
      a->B6 = (__builtin_astype(a->B6 + l, uint));
      a->B7 = (__builtin_astype(a->B7 + m, uint));
      a->B8 = (__builtin_astype(a->B8 + n, uint));
      a->B9 = (__builtin_astype(a->B9 + o, uint));
      a->BA = (__builtin_astype(a->BA + p, uint));
      a->BB = (__builtin_astype(a->BB + q, uint));
      a->BC = (__builtin_astype(a->BC + r, uint));
      a->BD = (__builtin_astype(a->BD + s, uint));
      a->BE = (__builtin_astype(a->BE + t, uint));
      a->BF = (__builtin_astype(a->BF + u, uint));
    } while (0);
    do {
      a->A0 ^= a->Wlow;
      a->A1 ^= a->Whigh;
    } while (0);
    do {
      a->B0 = (__builtin_astype(a->B0 << 17, uint)) | (a->B0 >> 15);
      a->B1 = (__builtin_astype(a->B1 << 17, uint)) | (a->B1 >> 15);
      a->B2 = (__builtin_astype(a->B2 << 17, uint)) | (a->B2 >> 15);
      a->B3 = (__builtin_astype(a->B3 << 17, uint)) | (a->B3 >> 15);
      a->B4 = (__builtin_astype(a->B4 << 17, uint)) | (a->B4 >> 15);
      a->B5 = (__builtin_astype(a->B5 << 17, uint)) | (a->B5 >> 15);
      a->B6 = (__builtin_astype(a->B6 << 17, uint)) | (a->B6 >> 15);
      a->B7 = (__builtin_astype(a->B7 << 17, uint)) | (a->B7 >> 15);
      a->B8 = (__builtin_astype(a->B8 << 17, uint)) | (a->B8 >> 15);
      a->B9 = (__builtin_astype(a->B9 << 17, uint)) | (a->B9 >> 15);
      a->BA = (__builtin_astype(a->BA << 17, uint)) | (a->BA >> 15);
      a->BB = (__builtin_astype(a->BB << 17, uint)) | (a->BB >> 15);
      a->BC = (__builtin_astype(a->BC << 17, uint)) | (a->BC >> 15);
      a->BD = (__builtin_astype(a->BD << 17, uint)) | (a->BD >> 15);
      a->BE = (__builtin_astype(a->BE << 17, uint)) | (a->BE >> 15);
      a->BF = (__builtin_astype(a->BF << 17, uint)) | (a->BF >> 15);
      do {
        do {
          a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->C8) * 3U, uint)) ^ a->BD ^ (a->B9 & ~a->B6) ^ f;
          a->B0 = (__builtin_astype(~(((a->B0 << 1) | (a->B0 >> 31)) ^ a->A0), uint));
        } while (0);
        do {
          a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->C7) * 3U, uint)) ^ a->BE ^ (a->BA & ~a->B7) ^ g;
          a->B1 = (__builtin_astype(~(((a->B1 << 1) | (a->B1 >> 31)) ^ a->A1), uint));
        } while (0);
        do {
          a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->C6) * 3U, uint)) ^ a->BF ^ (a->BB & ~a->B8) ^ h;
          a->B2 = (__builtin_astype(~(((a->B2 << 1) | (a->B2 >> 31)) ^ a->A2), uint));
        } while (0);
        do {
          a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->C5) * 3U, uint)) ^ a->B0 ^ (a->BC & ~a->B9) ^ i;
          a->B3 = (__builtin_astype(~(((a->B3 << 1) | (a->B3 >> 31)) ^ a->A3), uint));
        } while (0);
        do {
          a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->C4) * 3U, uint)) ^ a->B1 ^ (a->BD & ~a->BA) ^ j;
          a->B4 = (__builtin_astype(~(((a->B4 << 1) | (a->B4 >> 31)) ^ a->A4), uint));
        } while (0);
        do {
          a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->C3) * 3U, uint)) ^ a->B2 ^ (a->BE & ~a->BB) ^ k;
          a->B5 = (__builtin_astype(~(((a->B5 << 1) | (a->B5 >> 31)) ^ a->A5), uint));
        } while (0);
        do {
          a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->C2) * 3U, uint)) ^ a->B3 ^ (a->BF & ~a->BC) ^ l;
          a->B6 = (__builtin_astype(~(((a->B6 << 1) | (a->B6 >> 31)) ^ a->A6), uint));
        } while (0);
        do {
          a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->C1) * 3U, uint)) ^ a->B4 ^ (a->B0 & ~a->BD) ^ m;
          a->B7 = (__builtin_astype(~(((a->B7 << 1) | (a->B7 >> 31)) ^ a->A7), uint));
        } while (0);
        do {
          a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->C0) * 3U, uint)) ^ a->B5 ^ (a->B1 & ~a->BE) ^ n;
          a->B8 = (__builtin_astype(~(((a->B8 << 1) | (a->B8 >> 31)) ^ a->A8), uint));
        } while (0);
        do {
          a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->CF) * 3U, uint)) ^ a->B6 ^ (a->B2 & ~a->BF) ^ o;
          a->B9 = (__builtin_astype(~(((a->B9 << 1) | (a->B9 >> 31)) ^ a->A9), uint));
        } while (0);
        do {
          a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->CE) * 3U, uint)) ^ a->B7 ^ (a->B3 & ~a->B0) ^ p;
          a->BA = (__builtin_astype(~(((a->BA << 1) | (a->BA >> 31)) ^ a->AA), uint));
        } while (0);
        do {
          a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->CD) * 3U, uint)) ^ a->B8 ^ (a->B4 & ~a->B1) ^ q;
          a->BB = (__builtin_astype(~(((a->BB << 1) | (a->BB >> 31)) ^ a->AB), uint));
        } while (0);
        do {
          a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->CC) * 3U, uint)) ^ a->B9 ^ (a->B5 & ~a->B2) ^ r;
          a->BC = (__builtin_astype(~(((a->BC << 1) | (a->BC >> 31)) ^ a->A0), uint));
        } while (0);
        do {
          a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->CB) * 3U, uint)) ^ a->BA ^ (a->B6 & ~a->B3) ^ s;
          a->BD = (__builtin_astype(~(((a->BD << 1) | (a->BD >> 31)) ^ a->A1), uint));
        } while (0);
        do {
          a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->CA) * 3U, uint)) ^ a->BB ^ (a->B7 & ~a->B4) ^ t;
          a->BE = (__builtin_astype(~(((a->BE << 1) | (a->BE >> 31)) ^ a->A2), uint));
        } while (0);
        do {
          a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->C9) * 3U, uint)) ^ a->BC ^ (a->B8 & ~a->B5) ^ u;
          a->BF = (__builtin_astype(~(((a->BF << 1) | (a->BF >> 31)) ^ a->A3), uint));
        } while (0);
      } while (0);
      do {
        do {
          a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->C8) * 3U, uint)) ^ a->BD ^ (a->B9 & ~a->B6) ^ f;
          a->B0 = (__builtin_astype(~(((a->B0 << 1) | (a->B0 >> 31)) ^ a->A4), uint));
        } while (0);
        do {
          a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->C7) * 3U, uint)) ^ a->BE ^ (a->BA & ~a->B7) ^ g;
          a->B1 = (__builtin_astype(~(((a->B1 << 1) | (a->B1 >> 31)) ^ a->A5), uint));
        } while (0);
        do {
          a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->C6) * 3U, uint)) ^ a->BF ^ (a->BB & ~a->B8) ^ h;
          a->B2 = (__builtin_astype(~(((a->B2 << 1) | (a->B2 >> 31)) ^ a->A6), uint));
        } while (0);
        do {
          a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->C5) * 3U, uint)) ^ a->B0 ^ (a->BC & ~a->B9) ^ i;
          a->B3 = (__builtin_astype(~(((a->B3 << 1) | (a->B3 >> 31)) ^ a->A7), uint));
        } while (0);
        do {
          a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->C4) * 3U, uint)) ^ a->B1 ^ (a->BD & ~a->BA) ^ j;
          a->B4 = (__builtin_astype(~(((a->B4 << 1) | (a->B4 >> 31)) ^ a->A8), uint));
        } while (0);
        do {
          a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->C3) * 3U, uint)) ^ a->B2 ^ (a->BE & ~a->BB) ^ k;
          a->B5 = (__builtin_astype(~(((a->B5 << 1) | (a->B5 >> 31)) ^ a->A9), uint));
        } while (0);
        do {
          a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->C2) * 3U, uint)) ^ a->B3 ^ (a->BF & ~a->BC) ^ l;
          a->B6 = (__builtin_astype(~(((a->B6 << 1) | (a->B6 >> 31)) ^ a->AA), uint));
        } while (0);
        do {
          a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->C1) * 3U, uint)) ^ a->B4 ^ (a->B0 & ~a->BD) ^ m;
          a->B7 = (__builtin_astype(~(((a->B7 << 1) | (a->B7 >> 31)) ^ a->AB), uint));
        } while (0);
        do {
          a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->C0) * 3U, uint)) ^ a->B5 ^ (a->B1 & ~a->BE) ^ n;
          a->B8 = (__builtin_astype(~(((a->B8 << 1) | (a->B8 >> 31)) ^ a->A0), uint));
        } while (0);
        do {
          a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->CF) * 3U, uint)) ^ a->B6 ^ (a->B2 & ~a->BF) ^ o;
          a->B9 = (__builtin_astype(~(((a->B9 << 1) | (a->B9 >> 31)) ^ a->A1), uint));
        } while (0);
        do {
          a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->CE) * 3U, uint)) ^ a->B7 ^ (a->B3 & ~a->B0) ^ p;
          a->BA = (__builtin_astype(~(((a->BA << 1) | (a->BA >> 31)) ^ a->A2), uint));
        } while (0);
        do {
          a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->CD) * 3U, uint)) ^ a->B8 ^ (a->B4 & ~a->B1) ^ q;
          a->BB = (__builtin_astype(~(((a->BB << 1) | (a->BB >> 31)) ^ a->A3), uint));
        } while (0);
        do {
          a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->CC) * 3U, uint)) ^ a->B9 ^ (a->B5 & ~a->B2) ^ r;
          a->BC = (__builtin_astype(~(((a->BC << 1) | (a->BC >> 31)) ^ a->A4), uint));
        } while (0);
        do {
          a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->CB) * 3U, uint)) ^ a->BA ^ (a->B6 & ~a->B3) ^ s;
          a->BD = (__builtin_astype(~(((a->BD << 1) | (a->BD >> 31)) ^ a->A5), uint));
        } while (0);
        do {
          a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->CA) * 3U, uint)) ^ a->BB ^ (a->B7 & ~a->B4) ^ t;
          a->BE = (__builtin_astype(~(((a->BE << 1) | (a->BE >> 31)) ^ a->A6), uint));
        } while (0);
        do {
          a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->C9) * 3U, uint)) ^ a->BC ^ (a->B8 & ~a->B5) ^ u;
          a->BF = (__builtin_astype(~(((a->BF << 1) | (a->BF >> 31)) ^ a->A7), uint));
        } while (0);
      } while (0);
      do {
        do {
          a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->C8) * 3U, uint)) ^ a->BD ^ (a->B9 & ~a->B6) ^ f;
          a->B0 = (__builtin_astype(~(((a->B0 << 1) | (a->B0 >> 31)) ^ a->A8), uint));
        } while (0);
        do {
          a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->C7) * 3U, uint)) ^ a->BE ^ (a->BA & ~a->B7) ^ g;
          a->B1 = (__builtin_astype(~(((a->B1 << 1) | (a->B1 >> 31)) ^ a->A9), uint));
        } while (0);
        do {
          a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->C6) * 3U, uint)) ^ a->BF ^ (a->BB & ~a->B8) ^ h;
          a->B2 = (__builtin_astype(~(((a->B2 << 1) | (a->B2 >> 31)) ^ a->AA), uint));
        } while (0);
        do {
          a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->C5) * 3U, uint)) ^ a->B0 ^ (a->BC & ~a->B9) ^ i;
          a->B3 = (__builtin_astype(~(((a->B3 << 1) | (a->B3 >> 31)) ^ a->AB), uint));
        } while (0);
        do {
          a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->C4) * 3U, uint)) ^ a->B1 ^ (a->BD & ~a->BA) ^ j;
          a->B4 = (__builtin_astype(~(((a->B4 << 1) | (a->B4 >> 31)) ^ a->A0), uint));
        } while (0);
        do {
          a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->C3) * 3U, uint)) ^ a->B2 ^ (a->BE & ~a->BB) ^ k;
          a->B5 = (__builtin_astype(~(((a->B5 << 1) | (a->B5 >> 31)) ^ a->A1), uint));
        } while (0);
        do {
          a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->C2) * 3U, uint)) ^ a->B3 ^ (a->BF & ~a->BC) ^ l;
          a->B6 = (__builtin_astype(~(((a->B6 << 1) | (a->B6 >> 31)) ^ a->A2), uint));
        } while (0);
        do {
          a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->C1) * 3U, uint)) ^ a->B4 ^ (a->B0 & ~a->BD) ^ m;
          a->B7 = (__builtin_astype(~(((a->B7 << 1) | (a->B7 >> 31)) ^ a->A3), uint));
        } while (0);
        do {
          a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->C0) * 3U, uint)) ^ a->B5 ^ (a->B1 & ~a->BE) ^ n;
          a->B8 = (__builtin_astype(~(((a->B8 << 1) | (a->B8 >> 31)) ^ a->A4), uint));
        } while (0);
        do {
          a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->CF) * 3U, uint)) ^ a->B6 ^ (a->B2 & ~a->BF) ^ o;
          a->B9 = (__builtin_astype(~(((a->B9 << 1) | (a->B9 >> 31)) ^ a->A5), uint));
        } while (0);
        do {
          a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->CE) * 3U, uint)) ^ a->B7 ^ (a->B3 & ~a->B0) ^ p;
          a->BA = (__builtin_astype(~(((a->BA << 1) | (a->BA >> 31)) ^ a->A6), uint));
        } while (0);
        do {
          a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->CD) * 3U, uint)) ^ a->B8 ^ (a->B4 & ~a->B1) ^ q;
          a->BB = (__builtin_astype(~(((a->BB << 1) | (a->BB >> 31)) ^ a->A7), uint));
        } while (0);
        do {
          a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->CC) * 3U, uint)) ^ a->B9 ^ (a->B5 & ~a->B2) ^ r;
          a->BC = (__builtin_astype(~(((a->BC << 1) | (a->BC >> 31)) ^ a->A8), uint));
        } while (0);
        do {
          a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->CB) * 3U, uint)) ^ a->BA ^ (a->B6 & ~a->B3) ^ s;
          a->BD = (__builtin_astype(~(((a->BD << 1) | (a->BD >> 31)) ^ a->A9), uint));
        } while (0);
        do {
          a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->CA) * 3U, uint)) ^ a->BB ^ (a->B7 & ~a->B4) ^ t;
          a->BE = (__builtin_astype(~(((a->BE << 1) | (a->BE >> 31)) ^ a->AA), uint));
        } while (0);
        do {
          a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->C9) * 3U, uint)) ^ a->BC ^ (a->B8 & ~a->B5) ^ u;
          a->BF = (__builtin_astype(~(((a->BF << 1) | (a->BF >> 31)) ^ a->AB), uint));
        } while (0);
      } while (0);
      a->AB = (__builtin_astype(a->AB + a->C6, uint));
      a->AA = (__builtin_astype(a->AA + a->C5, uint));
      a->A9 = (__builtin_astype(a->A9 + a->C4, uint));
      a->A8 = (__builtin_astype(a->A8 + a->C3, uint));
      a->A7 = (__builtin_astype(a->A7 + a->C2, uint));
      a->A6 = (__builtin_astype(a->A6 + a->C1, uint));
      a->A5 = (__builtin_astype(a->A5 + a->C0, uint));
      a->A4 = (__builtin_astype(a->A4 + a->CF, uint));
      a->A3 = (__builtin_astype(a->A3 + a->CE, uint));
      a->A2 = (__builtin_astype(a->A2 + a->CD, uint));
      a->A1 = (__builtin_astype(a->A1 + a->CC, uint));
      a->A0 = (__builtin_astype(a->A0 + a->CB, uint));
      a->AB = (__builtin_astype(a->AB + a->CA, uint));
      a->AA = (__builtin_astype(a->AA + a->C9, uint));
      a->A9 = (__builtin_astype(a->A9 + a->C8, uint));
      a->A8 = (__builtin_astype(a->A8 + a->C7, uint));
      a->A7 = (__builtin_astype(a->A7 + a->C6, uint));
      a->A6 = (__builtin_astype(a->A6 + a->C5, uint));
      a->A5 = (__builtin_astype(a->A5 + a->C4, uint));
      a->A4 = (__builtin_astype(a->A4 + a->C3, uint));
      a->A3 = (__builtin_astype(a->A3 + a->C2, uint));
      a->A2 = (__builtin_astype(a->A2 + a->C1, uint));
      a->A1 = (__builtin_astype(a->A1 + a->C0, uint));
      a->A0 = (__builtin_astype(a->A0 + a->CF, uint));
      a->AB = (__builtin_astype(a->AB + a->CE, uint));
      a->AA = (__builtin_astype(a->AA + a->CD, uint));
      a->A9 = (__builtin_astype(a->A9 + a->CC, uint));
      a->A8 = (__builtin_astype(a->A8 + a->CB, uint));
      a->A7 = (__builtin_astype(a->A7 + a->CA, uint));
      a->A6 = (__builtin_astype(a->A6 + a->C9, uint));
      a->A5 = (__builtin_astype(a->A5 + a->C8, uint));
      a->A4 = (__builtin_astype(a->A4 + a->C7, uint));
      a->A3 = (__builtin_astype(a->A3 + a->C6, uint));
      a->A2 = (__builtin_astype(a->A2 + a->C5, uint));
      a->A1 = (__builtin_astype(a->A1 + a->C4, uint));
      a->A0 = (__builtin_astype(a->A0 + a->C3, uint));
    } while (0);

    for (unsigned int x = 0; x < 3; ++x) {
      do {
        do {
          unsigned int z = (a->B0);
          (a->B0) = (a->C0);
          (a->C0) = z;
        } while (0);
        do {
          unsigned int z = (a->B1);
          (a->B1) = (a->C1);
          (a->C1) = z;
        } while (0);
        do {
          unsigned int z = (a->B2);
          (a->B2) = (a->C2);
          (a->C2) = z;
        } while (0);
        do {
          unsigned int z = (a->B3);
          (a->B3) = (a->C3);
          (a->C3) = z;
        } while (0);
        do {
          unsigned int z = (a->B4);
          (a->B4) = (a->C4);
          (a->C4) = z;
        } while (0);
        do {
          unsigned int z = (a->B5);
          (a->B5) = (a->C5);
          (a->C5) = z;
        } while (0);
        do {
          unsigned int z = (a->B6);
          (a->B6) = (a->C6);
          (a->C6) = z;
        } while (0);
        do {
          unsigned int z = (a->B7);
          (a->B7) = (a->C7);
          (a->C7) = z;
        } while (0);
        do {
          unsigned int z = (a->B8);
          (a->B8) = (a->C8);
          (a->C8) = z;
        } while (0);
        do {
          unsigned int z = (a->B9);
          (a->B9) = (a->C9);
          (a->C9) = z;
        } while (0);
        do {
          unsigned int z = (a->BA);
          (a->BA) = (a->CA);
          (a->CA) = z;
        } while (0);
        do {
          unsigned int z = (a->BB);
          (a->BB) = (a->CB);
          (a->CB) = z;
        } while (0);
        do {
          unsigned int z = (a->BC);
          (a->BC) = (a->CC);
          (a->CC) = z;
        } while (0);
        do {
          unsigned int z = (a->BD);
          (a->BD) = (a->CD);
          (a->CD) = z;
        } while (0);
        do {
          unsigned int z = (a->BE);
          (a->BE) = (a->CE);
          (a->CE) = z;
        } while (0);
        do {
          unsigned int z = (a->BF);
          (a->BF) = (a->CF);
          (a->CF) = z;
        } while (0);
      } while (0);
      do {
        a->A0 ^= a->Wlow;
        a->A1 ^= a->Whigh;
      } while (0);
      do {
        a->B0 = (__builtin_astype(a->B0 << 17, uint)) | (a->B0 >> 15);
        a->B1 = (__builtin_astype(a->B1 << 17, uint)) | (a->B1 >> 15);
        a->B2 = (__builtin_astype(a->B2 << 17, uint)) | (a->B2 >> 15);
        a->B3 = (__builtin_astype(a->B3 << 17, uint)) | (a->B3 >> 15);
        a->B4 = (__builtin_astype(a->B4 << 17, uint)) | (a->B4 >> 15);
        a->B5 = (__builtin_astype(a->B5 << 17, uint)) | (a->B5 >> 15);
        a->B6 = (__builtin_astype(a->B6 << 17, uint)) | (a->B6 >> 15);
        a->B7 = (__builtin_astype(a->B7 << 17, uint)) | (a->B7 >> 15);
        a->B8 = (__builtin_astype(a->B8 << 17, uint)) | (a->B8 >> 15);
        a->B9 = (__builtin_astype(a->B9 << 17, uint)) | (a->B9 >> 15);
        a->BA = (__builtin_astype(a->BA << 17, uint)) | (a->BA >> 15);
        a->BB = (__builtin_astype(a->BB << 17, uint)) | (a->BB >> 15);
        a->BC = (__builtin_astype(a->BC << 17, uint)) | (a->BC >> 15);
        a->BD = (__builtin_astype(a->BD << 17, uint)) | (a->BD >> 15);
        a->BE = (__builtin_astype(a->BE << 17, uint)) | (a->BE >> 15);
        a->BF = (__builtin_astype(a->BF << 17, uint)) | (a->BF >> 15);
        do {
          do {
            a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->C8) * 3U, uint)) ^ a->BD ^ (a->B9 & ~a->B6) ^ f;
            a->B0 = (__builtin_astype(~(((a->B0 << 1) | (a->B0 >> 31)) ^ a->A0), uint));
          } while (0);
          do {
            a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->C7) * 3U, uint)) ^ a->BE ^ (a->BA & ~a->B7) ^ g;
            a->B1 = (__builtin_astype(~(((a->B1 << 1) | (a->B1 >> 31)) ^ a->A1), uint));
          } while (0);
          do {
            a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->C6) * 3U, uint)) ^ a->BF ^ (a->BB & ~a->B8) ^ h;
            a->B2 = (__builtin_astype(~(((a->B2 << 1) | (a->B2 >> 31)) ^ a->A2), uint));
          } while (0);
          do {
            a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->C5) * 3U, uint)) ^ a->B0 ^ (a->BC & ~a->B9) ^ i;
            a->B3 = (__builtin_astype(~(((a->B3 << 1) | (a->B3 >> 31)) ^ a->A3), uint));
          } while (0);
          do {
            a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->C4) * 3U, uint)) ^ a->B1 ^ (a->BD & ~a->BA) ^ j;
            a->B4 = (__builtin_astype(~(((a->B4 << 1) | (a->B4 >> 31)) ^ a->A4), uint));
          } while (0);
          do {
            a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->C3) * 3U, uint)) ^ a->B2 ^ (a->BE & ~a->BB) ^ k;
            a->B5 = (__builtin_astype(~(((a->B5 << 1) | (a->B5 >> 31)) ^ a->A5), uint));
          } while (0);
          do {
            a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->C2) * 3U, uint)) ^ a->B3 ^ (a->BF & ~a->BC) ^ l;
            a->B6 = (__builtin_astype(~(((a->B6 << 1) | (a->B6 >> 31)) ^ a->A6), uint));
          } while (0);
          do {
            a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->C1) * 3U, uint)) ^ a->B4 ^ (a->B0 & ~a->BD) ^ m;
            a->B7 = (__builtin_astype(~(((a->B7 << 1) | (a->B7 >> 31)) ^ a->A7), uint));
          } while (0);
          do {
            a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->C0) * 3U, uint)) ^ a->B5 ^ (a->B1 & ~a->BE) ^ n;
            a->B8 = (__builtin_astype(~(((a->B8 << 1) | (a->B8 >> 31)) ^ a->A8), uint));
          } while (0);
          do {
            a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->CF) * 3U, uint)) ^ a->B6 ^ (a->B2 & ~a->BF) ^ o;
            a->B9 = (__builtin_astype(~(((a->B9 << 1) | (a->B9 >> 31)) ^ a->A9), uint));
          } while (0);
          do {
            a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->CE) * 3U, uint)) ^ a->B7 ^ (a->B3 & ~a->B0) ^ p;
            a->BA = (__builtin_astype(~(((a->BA << 1) | (a->BA >> 31)) ^ a->AA), uint));
          } while (0);
          do {
            a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->CD) * 3U, uint)) ^ a->B8 ^ (a->B4 & ~a->B1) ^ q;
            a->BB = (__builtin_astype(~(((a->BB << 1) | (a->BB >> 31)) ^ a->AB), uint));
          } while (0);
          do {
            a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->CC) * 3U, uint)) ^ a->B9 ^ (a->B5 & ~a->B2) ^ r;
            a->BC = (__builtin_astype(~(((a->BC << 1) | (a->BC >> 31)) ^ a->A0), uint));
          } while (0);
          do {
            a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->CB) * 3U, uint)) ^ a->BA ^ (a->B6 & ~a->B3) ^ s;
            a->BD = (__builtin_astype(~(((a->BD << 1) | (a->BD >> 31)) ^ a->A1), uint));
          } while (0);
          do {
            a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->CA) * 3U, uint)) ^ a->BB ^ (a->B7 & ~a->B4) ^ t;
            a->BE = (__builtin_astype(~(((a->BE << 1) | (a->BE >> 31)) ^ a->A2), uint));
          } while (0);
          do {
            a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->C9) * 3U, uint)) ^ a->BC ^ (a->B8 & ~a->B5) ^ u;
            a->BF = (__builtin_astype(~(((a->BF << 1) | (a->BF >> 31)) ^ a->A3), uint));
          } while (0);
        } while (0);
        do {
          do {
            a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->C8) * 3U, uint)) ^ a->BD ^ (a->B9 & ~a->B6) ^ f;
            a->B0 = (__builtin_astype(~(((a->B0 << 1) | (a->B0 >> 31)) ^ a->A4), uint));
          } while (0);
          do {
            a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->C7) * 3U, uint)) ^ a->BE ^ (a->BA & ~a->B7) ^ g;
            a->B1 = (__builtin_astype(~(((a->B1 << 1) | (a->B1 >> 31)) ^ a->A5), uint));
          } while (0);
          do {
            a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->C6) * 3U, uint)) ^ a->BF ^ (a->BB & ~a->B8) ^ h;
            a->B2 = (__builtin_astype(~(((a->B2 << 1) | (a->B2 >> 31)) ^ a->A6), uint));
          } while (0);
          do {
            a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->C5) * 3U, uint)) ^ a->B0 ^ (a->BC & ~a->B9) ^ i;
            a->B3 = (__builtin_astype(~(((a->B3 << 1) | (a->B3 >> 31)) ^ a->A7), uint));
          } while (0);
          do {
            a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->C4) * 3U, uint)) ^ a->B1 ^ (a->BD & ~a->BA) ^ j;
            a->B4 = (__builtin_astype(~(((a->B4 << 1) | (a->B4 >> 31)) ^ a->A8), uint));
          } while (0);
          do {
            a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->C3) * 3U, uint)) ^ a->B2 ^ (a->BE & ~a->BB) ^ k;
            a->B5 = (__builtin_astype(~(((a->B5 << 1) | (a->B5 >> 31)) ^ a->A9), uint));
          } while (0);
          do {
            a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->C2) * 3U, uint)) ^ a->B3 ^ (a->BF & ~a->BC) ^ l;
            a->B6 = (__builtin_astype(~(((a->B6 << 1) | (a->B6 >> 31)) ^ a->AA), uint));
          } while (0);
          do {
            a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->C1) * 3U, uint)) ^ a->B4 ^ (a->B0 & ~a->BD) ^ m;
            a->B7 = (__builtin_astype(~(((a->B7 << 1) | (a->B7 >> 31)) ^ a->AB), uint));
          } while (0);
          do {
            a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->C0) * 3U, uint)) ^ a->B5 ^ (a->B1 & ~a->BE) ^ n;
            a->B8 = (__builtin_astype(~(((a->B8 << 1) | (a->B8 >> 31)) ^ a->A0), uint));
          } while (0);
          do {
            a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->CF) * 3U, uint)) ^ a->B6 ^ (a->B2 & ~a->BF) ^ o;
            a->B9 = (__builtin_astype(~(((a->B9 << 1) | (a->B9 >> 31)) ^ a->A1), uint));
          } while (0);
          do {
            a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->CE) * 3U, uint)) ^ a->B7 ^ (a->B3 & ~a->B0) ^ p;
            a->BA = (__builtin_astype(~(((a->BA << 1) | (a->BA >> 31)) ^ a->A2), uint));
          } while (0);
          do {
            a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->CD) * 3U, uint)) ^ a->B8 ^ (a->B4 & ~a->B1) ^ q;
            a->BB = (__builtin_astype(~(((a->BB << 1) | (a->BB >> 31)) ^ a->A3), uint));
          } while (0);
          do {
            a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->CC) * 3U, uint)) ^ a->B9 ^ (a->B5 & ~a->B2) ^ r;
            a->BC = (__builtin_astype(~(((a->BC << 1) | (a->BC >> 31)) ^ a->A4), uint));
          } while (0);
          do {
            a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->CB) * 3U, uint)) ^ a->BA ^ (a->B6 & ~a->B3) ^ s;
            a->BD = (__builtin_astype(~(((a->BD << 1) | (a->BD >> 31)) ^ a->A5), uint));
          } while (0);
          do {
            a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->CA) * 3U, uint)) ^ a->BB ^ (a->B7 & ~a->B4) ^ t;
            a->BE = (__builtin_astype(~(((a->BE << 1) | (a->BE >> 31)) ^ a->A6), uint));
          } while (0);
          do {
            a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->C9) * 3U, uint)) ^ a->BC ^ (a->B8 & ~a->B5) ^ u;
            a->BF = (__builtin_astype(~(((a->BF << 1) | (a->BF >> 31)) ^ a->A7), uint));
          } while (0);
        } while (0);
        do {
          do {
            a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->C8) * 3U, uint)) ^ a->BD ^ (a->B9 & ~a->B6) ^ f;
            a->B0 = (__builtin_astype(~(((a->B0 << 1) | (a->B0 >> 31)) ^ a->A8), uint));
          } while (0);
          do {
            a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->C7) * 3U, uint)) ^ a->BE ^ (a->BA & ~a->B7) ^ g;
            a->B1 = (__builtin_astype(~(((a->B1 << 1) | (a->B1 >> 31)) ^ a->A9), uint));
          } while (0);
          do {
            a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->C6) * 3U, uint)) ^ a->BF ^ (a->BB & ~a->B8) ^ h;
            a->B2 = (__builtin_astype(~(((a->B2 << 1) | (a->B2 >> 31)) ^ a->AA), uint));
          } while (0);
          do {
            a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->C5) * 3U, uint)) ^ a->B0 ^ (a->BC & ~a->B9) ^ i;
            a->B3 = (__builtin_astype(~(((a->B3 << 1) | (a->B3 >> 31)) ^ a->AB), uint));
          } while (0);
          do {
            a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->C4) * 3U, uint)) ^ a->B1 ^ (a->BD & ~a->BA) ^ j;
            a->B4 = (__builtin_astype(~(((a->B4 << 1) | (a->B4 >> 31)) ^ a->A0), uint));
          } while (0);
          do {
            a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->C3) * 3U, uint)) ^ a->B2 ^ (a->BE & ~a->BB) ^ k;
            a->B5 = (__builtin_astype(~(((a->B5 << 1) | (a->B5 >> 31)) ^ a->A1), uint));
          } while (0);
          do {
            a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->C2) * 3U, uint)) ^ a->B3 ^ (a->BF & ~a->BC) ^ l;
            a->B6 = (__builtin_astype(~(((a->B6 << 1) | (a->B6 >> 31)) ^ a->A2), uint));
          } while (0);
          do {
            a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->C1) * 3U, uint)) ^ a->B4 ^ (a->B0 & ~a->BD) ^ m;
            a->B7 = (__builtin_astype(~(((a->B7 << 1) | (a->B7 >> 31)) ^ a->A3), uint));
          } while (0);
          do {
            a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->C0) * 3U, uint)) ^ a->B5 ^ (a->B1 & ~a->BE) ^ n;
            a->B8 = (__builtin_astype(~(((a->B8 << 1) | (a->B8 >> 31)) ^ a->A4), uint));
          } while (0);
          do {
            a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->CF) * 3U, uint)) ^ a->B6 ^ (a->B2 & ~a->BF) ^ o;
            a->B9 = (__builtin_astype(~(((a->B9 << 1) | (a->B9 >> 31)) ^ a->A5), uint));
          } while (0);
          do {
            a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->CE) * 3U, uint)) ^ a->B7 ^ (a->B3 & ~a->B0) ^ p;
            a->BA = (__builtin_astype(~(((a->BA << 1) | (a->BA >> 31)) ^ a->A6), uint));
          } while (0);
          do {
            a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->CD) * 3U, uint)) ^ a->B8 ^ (a->B4 & ~a->B1) ^ q;
            a->BB = (__builtin_astype(~(((a->BB << 1) | (a->BB >> 31)) ^ a->A7), uint));
          } while (0);
          do {
            a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->CC) * 3U, uint)) ^ a->B9 ^ (a->B5 & ~a->B2) ^ r;
            a->BC = (__builtin_astype(~(((a->BC << 1) | (a->BC >> 31)) ^ a->A8), uint));
          } while (0);
          do {
            a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->CB) * 3U, uint)) ^ a->BA ^ (a->B6 & ~a->B3) ^ s;
            a->BD = (__builtin_astype(~(((a->BD << 1) | (a->BD >> 31)) ^ a->A9), uint));
          } while (0);
          do {
            a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->CA) * 3U, uint)) ^ a->BB ^ (a->B7 & ~a->B4) ^ t;
            a->BE = (__builtin_astype(~(((a->BE << 1) | (a->BE >> 31)) ^ a->AA), uint));
          } while (0);
          do {
            a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->C9) * 3U, uint)) ^ a->BC ^ (a->B8 & ~a->B5) ^ u;
            a->BF = (__builtin_astype(~(((a->BF << 1) | (a->BF >> 31)) ^ a->AB), uint));
          } while (0);
        } while (0);
        a->AB = (__builtin_astype(a->AB + a->C6, uint));
        a->AA = (__builtin_astype(a->AA + a->C5, uint));
        a->A9 = (__builtin_astype(a->A9 + a->C4, uint));
        a->A8 = (__builtin_astype(a->A8 + a->C3, uint));
        a->A7 = (__builtin_astype(a->A7 + a->C2, uint));
        a->A6 = (__builtin_astype(a->A6 + a->C1, uint));
        a->A5 = (__builtin_astype(a->A5 + a->C0, uint));
        a->A4 = (__builtin_astype(a->A4 + a->CF, uint));
        a->A3 = (__builtin_astype(a->A3 + a->CE, uint));
        a->A2 = (__builtin_astype(a->A2 + a->CD, uint));
        a->A1 = (__builtin_astype(a->A1 + a->CC, uint));
        a->A0 = (__builtin_astype(a->A0 + a->CB, uint));
        a->AB = (__builtin_astype(a->AB + a->CA, uint));
        a->AA = (__builtin_astype(a->AA + a->C9, uint));
        a->A9 = (__builtin_astype(a->A9 + a->C8, uint));
        a->A8 = (__builtin_astype(a->A8 + a->C7, uint));
        a->A7 = (__builtin_astype(a->A7 + a->C6, uint));
        a->A6 = (__builtin_astype(a->A6 + a->C5, uint));
        a->A5 = (__builtin_astype(a->A5 + a->C4, uint));
        a->A4 = (__builtin_astype(a->A4 + a->C3, uint));
        a->A3 = (__builtin_astype(a->A3 + a->C2, uint));
        a->A2 = (__builtin_astype(a->A2 + a->C1, uint));
        a->A1 = (__builtin_astype(a->A1 + a->C0, uint));
        a->A0 = (__builtin_astype(a->A0 + a->CF, uint));
        a->AB = (__builtin_astype(a->AB + a->CE, uint));
        a->AA = (__builtin_astype(a->AA + a->CD, uint));
        a->A9 = (__builtin_astype(a->A9 + a->CC, uint));
        a->A8 = (__builtin_astype(a->A8 + a->CB, uint));
        a->A7 = (__builtin_astype(a->A7 + a->CA, uint));
        a->A6 = (__builtin_astype(a->A6 + a->C9, uint));
        a->A5 = (__builtin_astype(a->A5 + a->C8, uint));
        a->A4 = (__builtin_astype(a->A4 + a->C7, uint));
        a->A3 = (__builtin_astype(a->A3 + a->C6, uint));
        a->A2 = (__builtin_astype(a->A2 + a->C5, uint));
        a->A1 = (__builtin_astype(a->A1 + a->C4, uint));
        a->A0 = (__builtin_astype(a->A0 + a->C3, uint));
      } while (0);
    }
  } else if (w == 16) {
    unsigned long y = (c >> 2) + (v << 4);
    f = e[y];
    g = e[y + 1];
    h = e[y + 2];
    i = e[y + 3];
    j = 0x80;
    k = l = m = n = o = p = q = r = s = t = u = 0;

    do {
      a->B0 = (__builtin_astype(a->B0 + f, uint));
      a->B1 = (__builtin_astype(a->B1 + g, uint));
      a->B2 = (__builtin_astype(a->B2 + h, uint));
      a->B3 = (__builtin_astype(a->B3 + i, uint));
      a->B4 = (__builtin_astype(a->B4 + j, uint));
      a->B5 = (__builtin_astype(a->B5 + k, uint));
      a->B6 = (__builtin_astype(a->B6 + l, uint));
      a->B7 = (__builtin_astype(a->B7 + m, uint));
      a->B8 = (__builtin_astype(a->B8 + n, uint));
      a->B9 = (__builtin_astype(a->B9 + o, uint));
      a->BA = (__builtin_astype(a->BA + p, uint));
      a->BB = (__builtin_astype(a->BB + q, uint));
      a->BC = (__builtin_astype(a->BC + r, uint));
      a->BD = (__builtin_astype(a->BD + s, uint));
      a->BE = (__builtin_astype(a->BE + t, uint));
      a->BF = (__builtin_astype(a->BF + u, uint));
    } while (0);
    do {
      a->A0 ^= a->Wlow;
      a->A1 ^= a->Whigh;
    } while (0);
    do {
      a->B0 = (__builtin_astype(a->B0 << 17, uint)) | (a->B0 >> 15);
      a->B1 = (__builtin_astype(a->B1 << 17, uint)) | (a->B1 >> 15);
      a->B2 = (__builtin_astype(a->B2 << 17, uint)) | (a->B2 >> 15);
      a->B3 = (__builtin_astype(a->B3 << 17, uint)) | (a->B3 >> 15);
      a->B4 = (__builtin_astype(a->B4 << 17, uint)) | (a->B4 >> 15);
      a->B5 = (__builtin_astype(a->B5 << 17, uint)) | (a->B5 >> 15);
      a->B6 = (__builtin_astype(a->B6 << 17, uint)) | (a->B6 >> 15);
      a->B7 = (__builtin_astype(a->B7 << 17, uint)) | (a->B7 >> 15);
      a->B8 = (__builtin_astype(a->B8 << 17, uint)) | (a->B8 >> 15);
      a->B9 = (__builtin_astype(a->B9 << 17, uint)) | (a->B9 >> 15);
      a->BA = (__builtin_astype(a->BA << 17, uint)) | (a->BA >> 15);
      a->BB = (__builtin_astype(a->BB << 17, uint)) | (a->BB >> 15);
      a->BC = (__builtin_astype(a->BC << 17, uint)) | (a->BC >> 15);
      a->BD = (__builtin_astype(a->BD << 17, uint)) | (a->BD >> 15);
      a->BE = (__builtin_astype(a->BE << 17, uint)) | (a->BE >> 15);
      a->BF = (__builtin_astype(a->BF << 17, uint)) | (a->BF >> 15);
      do {
        do {
          a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->C8) * 3U, uint)) ^ a->BD ^ (a->B9 & ~a->B6) ^ f;
          a->B0 = (__builtin_astype(~(((a->B0 << 1) | (a->B0 >> 31)) ^ a->A0), uint));
        } while (0);
        do {
          a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->C7) * 3U, uint)) ^ a->BE ^ (a->BA & ~a->B7) ^ g;
          a->B1 = (__builtin_astype(~(((a->B1 << 1) | (a->B1 >> 31)) ^ a->A1), uint));
        } while (0);
        do {
          a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->C6) * 3U, uint)) ^ a->BF ^ (a->BB & ~a->B8) ^ h;
          a->B2 = (__builtin_astype(~(((a->B2 << 1) | (a->B2 >> 31)) ^ a->A2), uint));
        } while (0);
        do {
          a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->C5) * 3U, uint)) ^ a->B0 ^ (a->BC & ~a->B9) ^ i;
          a->B3 = (__builtin_astype(~(((a->B3 << 1) | (a->B3 >> 31)) ^ a->A3), uint));
        } while (0);
        do {
          a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->C4) * 3U, uint)) ^ a->B1 ^ (a->BD & ~a->BA) ^ j;
          a->B4 = (__builtin_astype(~(((a->B4 << 1) | (a->B4 >> 31)) ^ a->A4), uint));
        } while (0);
        do {
          a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->C3) * 3U, uint)) ^ a->B2 ^ (a->BE & ~a->BB) ^ k;
          a->B5 = (__builtin_astype(~(((a->B5 << 1) | (a->B5 >> 31)) ^ a->A5), uint));
        } while (0);
        do {
          a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->C2) * 3U, uint)) ^ a->B3 ^ (a->BF & ~a->BC) ^ l;
          a->B6 = (__builtin_astype(~(((a->B6 << 1) | (a->B6 >> 31)) ^ a->A6), uint));
        } while (0);
        do {
          a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->C1) * 3U, uint)) ^ a->B4 ^ (a->B0 & ~a->BD) ^ m;
          a->B7 = (__builtin_astype(~(((a->B7 << 1) | (a->B7 >> 31)) ^ a->A7), uint));
        } while (0);
        do {
          a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->C0) * 3U, uint)) ^ a->B5 ^ (a->B1 & ~a->BE) ^ n;
          a->B8 = (__builtin_astype(~(((a->B8 << 1) | (a->B8 >> 31)) ^ a->A8), uint));
        } while (0);
        do {
          a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->CF) * 3U, uint)) ^ a->B6 ^ (a->B2 & ~a->BF) ^ o;
          a->B9 = (__builtin_astype(~(((a->B9 << 1) | (a->B9 >> 31)) ^ a->A9), uint));
        } while (0);
        do {
          a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->CE) * 3U, uint)) ^ a->B7 ^ (a->B3 & ~a->B0) ^ p;
          a->BA = (__builtin_astype(~(((a->BA << 1) | (a->BA >> 31)) ^ a->AA), uint));
        } while (0);
        do {
          a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->CD) * 3U, uint)) ^ a->B8 ^ (a->B4 & ~a->B1) ^ q;
          a->BB = (__builtin_astype(~(((a->BB << 1) | (a->BB >> 31)) ^ a->AB), uint));
        } while (0);
        do {
          a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->CC) * 3U, uint)) ^ a->B9 ^ (a->B5 & ~a->B2) ^ r;
          a->BC = (__builtin_astype(~(((a->BC << 1) | (a->BC >> 31)) ^ a->A0), uint));
        } while (0);
        do {
          a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->CB) * 3U, uint)) ^ a->BA ^ (a->B6 & ~a->B3) ^ s;
          a->BD = (__builtin_astype(~(((a->BD << 1) | (a->BD >> 31)) ^ a->A1), uint));
        } while (0);
        do {
          a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->CA) * 3U, uint)) ^ a->BB ^ (a->B7 & ~a->B4) ^ t;
          a->BE = (__builtin_astype(~(((a->BE << 1) | (a->BE >> 31)) ^ a->A2), uint));
        } while (0);
        do {
          a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->C9) * 3U, uint)) ^ a->BC ^ (a->B8 & ~a->B5) ^ u;
          a->BF = (__builtin_astype(~(((a->BF << 1) | (a->BF >> 31)) ^ a->A3), uint));
        } while (0);
      } while (0);
      do {
        do {
          a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->C8) * 3U, uint)) ^ a->BD ^ (a->B9 & ~a->B6) ^ f;
          a->B0 = (__builtin_astype(~(((a->B0 << 1) | (a->B0 >> 31)) ^ a->A4), uint));
        } while (0);
        do {
          a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->C7) * 3U, uint)) ^ a->BE ^ (a->BA & ~a->B7) ^ g;
          a->B1 = (__builtin_astype(~(((a->B1 << 1) | (a->B1 >> 31)) ^ a->A5), uint));
        } while (0);
        do {
          a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->C6) * 3U, uint)) ^ a->BF ^ (a->BB & ~a->B8) ^ h;
          a->B2 = (__builtin_astype(~(((a->B2 << 1) | (a->B2 >> 31)) ^ a->A6), uint));
        } while (0);
        do {
          a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->C5) * 3U, uint)) ^ a->B0 ^ (a->BC & ~a->B9) ^ i;
          a->B3 = (__builtin_astype(~(((a->B3 << 1) | (a->B3 >> 31)) ^ a->A7), uint));
        } while (0);
        do {
          a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->C4) * 3U, uint)) ^ a->B1 ^ (a->BD & ~a->BA) ^ j;
          a->B4 = (__builtin_astype(~(((a->B4 << 1) | (a->B4 >> 31)) ^ a->A8), uint));
        } while (0);
        do {
          a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->C3) * 3U, uint)) ^ a->B2 ^ (a->BE & ~a->BB) ^ k;
          a->B5 = (__builtin_astype(~(((a->B5 << 1) | (a->B5 >> 31)) ^ a->A9), uint));
        } while (0);
        do {
          a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->C2) * 3U, uint)) ^ a->B3 ^ (a->BF & ~a->BC) ^ l;
          a->B6 = (__builtin_astype(~(((a->B6 << 1) | (a->B6 >> 31)) ^ a->AA), uint));
        } while (0);
        do {
          a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->C1) * 3U, uint)) ^ a->B4 ^ (a->B0 & ~a->BD) ^ m;
          a->B7 = (__builtin_astype(~(((a->B7 << 1) | (a->B7 >> 31)) ^ a->AB), uint));
        } while (0);
        do {
          a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->C0) * 3U, uint)) ^ a->B5 ^ (a->B1 & ~a->BE) ^ n;
          a->B8 = (__builtin_astype(~(((a->B8 << 1) | (a->B8 >> 31)) ^ a->A0), uint));
        } while (0);
        do {
          a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->CF) * 3U, uint)) ^ a->B6 ^ (a->B2 & ~a->BF) ^ o;
          a->B9 = (__builtin_astype(~(((a->B9 << 1) | (a->B9 >> 31)) ^ a->A1), uint));
        } while (0);
        do {
          a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->CE) * 3U, uint)) ^ a->B7 ^ (a->B3 & ~a->B0) ^ p;
          a->BA = (__builtin_astype(~(((a->BA << 1) | (a->BA >> 31)) ^ a->A2), uint));
        } while (0);
        do {
          a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->CD) * 3U, uint)) ^ a->B8 ^ (a->B4 & ~a->B1) ^ q;
          a->BB = (__builtin_astype(~(((a->BB << 1) | (a->BB >> 31)) ^ a->A3), uint));
        } while (0);
        do {
          a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->CC) * 3U, uint)) ^ a->B9 ^ (a->B5 & ~a->B2) ^ r;
          a->BC = (__builtin_astype(~(((a->BC << 1) | (a->BC >> 31)) ^ a->A4), uint));
        } while (0);
        do {
          a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->CB) * 3U, uint)) ^ a->BA ^ (a->B6 & ~a->B3) ^ s;
          a->BD = (__builtin_astype(~(((a->BD << 1) | (a->BD >> 31)) ^ a->A5), uint));
        } while (0);
        do {
          a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->CA) * 3U, uint)) ^ a->BB ^ (a->B7 & ~a->B4) ^ t;
          a->BE = (__builtin_astype(~(((a->BE << 1) | (a->BE >> 31)) ^ a->A6), uint));
        } while (0);
        do {
          a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->C9) * 3U, uint)) ^ a->BC ^ (a->B8 & ~a->B5) ^ u;
          a->BF = (__builtin_astype(~(((a->BF << 1) | (a->BF >> 31)) ^ a->A7), uint));
        } while (0);
      } while (0);
      do {
        do {
          a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->C8) * 3U, uint)) ^ a->BD ^ (a->B9 & ~a->B6) ^ f;
          a->B0 = (__builtin_astype(~(((a->B0 << 1) | (a->B0 >> 31)) ^ a->A8), uint));
        } while (0);
        do {
          a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->C7) * 3U, uint)) ^ a->BE ^ (a->BA & ~a->B7) ^ g;
          a->B1 = (__builtin_astype(~(((a->B1 << 1) | (a->B1 >> 31)) ^ a->A9), uint));
        } while (0);
        do {
          a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->C6) * 3U, uint)) ^ a->BF ^ (a->BB & ~a->B8) ^ h;
          a->B2 = (__builtin_astype(~(((a->B2 << 1) | (a->B2 >> 31)) ^ a->AA), uint));
        } while (0);
        do {
          a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->C5) * 3U, uint)) ^ a->B0 ^ (a->BC & ~a->B9) ^ i;
          a->B3 = (__builtin_astype(~(((a->B3 << 1) | (a->B3 >> 31)) ^ a->AB), uint));
        } while (0);
        do {
          a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->C4) * 3U, uint)) ^ a->B1 ^ (a->BD & ~a->BA) ^ j;
          a->B4 = (__builtin_astype(~(((a->B4 << 1) | (a->B4 >> 31)) ^ a->A0), uint));
        } while (0);
        do {
          a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->C3) * 3U, uint)) ^ a->B2 ^ (a->BE & ~a->BB) ^ k;
          a->B5 = (__builtin_astype(~(((a->B5 << 1) | (a->B5 >> 31)) ^ a->A1), uint));
        } while (0);
        do {
          a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->C2) * 3U, uint)) ^ a->B3 ^ (a->BF & ~a->BC) ^ l;
          a->B6 = (__builtin_astype(~(((a->B6 << 1) | (a->B6 >> 31)) ^ a->A2), uint));
        } while (0);
        do {
          a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->C1) * 3U, uint)) ^ a->B4 ^ (a->B0 & ~a->BD) ^ m;
          a->B7 = (__builtin_astype(~(((a->B7 << 1) | (a->B7 >> 31)) ^ a->A3), uint));
        } while (0);
        do {
          a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->C0) * 3U, uint)) ^ a->B5 ^ (a->B1 & ~a->BE) ^ n;
          a->B8 = (__builtin_astype(~(((a->B8 << 1) | (a->B8 >> 31)) ^ a->A4), uint));
        } while (0);
        do {
          a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->CF) * 3U, uint)) ^ a->B6 ^ (a->B2 & ~a->BF) ^ o;
          a->B9 = (__builtin_astype(~(((a->B9 << 1) | (a->B9 >> 31)) ^ a->A5), uint));
        } while (0);
        do {
          a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->CE) * 3U, uint)) ^ a->B7 ^ (a->B3 & ~a->B0) ^ p;
          a->BA = (__builtin_astype(~(((a->BA << 1) | (a->BA >> 31)) ^ a->A6), uint));
        } while (0);
        do {
          a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->CD) * 3U, uint)) ^ a->B8 ^ (a->B4 & ~a->B1) ^ q;
          a->BB = (__builtin_astype(~(((a->BB << 1) | (a->BB >> 31)) ^ a->A7), uint));
        } while (0);
        do {
          a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->CC) * 3U, uint)) ^ a->B9 ^ (a->B5 & ~a->B2) ^ r;
          a->BC = (__builtin_astype(~(((a->BC << 1) | (a->BC >> 31)) ^ a->A8), uint));
        } while (0);
        do {
          a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->CB) * 3U, uint)) ^ a->BA ^ (a->B6 & ~a->B3) ^ s;
          a->BD = (__builtin_astype(~(((a->BD << 1) | (a->BD >> 31)) ^ a->A9), uint));
        } while (0);
        do {
          a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->CA) * 3U, uint)) ^ a->BB ^ (a->B7 & ~a->B4) ^ t;
          a->BE = (__builtin_astype(~(((a->BE << 1) | (a->BE >> 31)) ^ a->AA), uint));
        } while (0);
        do {
          a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->C9) * 3U, uint)) ^ a->BC ^ (a->B8 & ~a->B5) ^ u;
          a->BF = (__builtin_astype(~(((a->BF << 1) | (a->BF >> 31)) ^ a->AB), uint));
        } while (0);
      } while (0);
      a->AB = (__builtin_astype(a->AB + a->C6, uint));
      a->AA = (__builtin_astype(a->AA + a->C5, uint));
      a->A9 = (__builtin_astype(a->A9 + a->C4, uint));
      a->A8 = (__builtin_astype(a->A8 + a->C3, uint));
      a->A7 = (__builtin_astype(a->A7 + a->C2, uint));
      a->A6 = (__builtin_astype(a->A6 + a->C1, uint));
      a->A5 = (__builtin_astype(a->A5 + a->C0, uint));
      a->A4 = (__builtin_astype(a->A4 + a->CF, uint));
      a->A3 = (__builtin_astype(a->A3 + a->CE, uint));
      a->A2 = (__builtin_astype(a->A2 + a->CD, uint));
      a->A1 = (__builtin_astype(a->A1 + a->CC, uint));
      a->A0 = (__builtin_astype(a->A0 + a->CB, uint));
      a->AB = (__builtin_astype(a->AB + a->CA, uint));
      a->AA = (__builtin_astype(a->AA + a->C9, uint));
      a->A9 = (__builtin_astype(a->A9 + a->C8, uint));
      a->A8 = (__builtin_astype(a->A8 + a->C7, uint));
      a->A7 = (__builtin_astype(a->A7 + a->C6, uint));
      a->A6 = (__builtin_astype(a->A6 + a->C5, uint));
      a->A5 = (__builtin_astype(a->A5 + a->C4, uint));
      a->A4 = (__builtin_astype(a->A4 + a->C3, uint));
      a->A3 = (__builtin_astype(a->A3 + a->C2, uint));
      a->A2 = (__builtin_astype(a->A2 + a->C1, uint));
      a->A1 = (__builtin_astype(a->A1 + a->C0, uint));
      a->A0 = (__builtin_astype(a->A0 + a->CF, uint));
      a->AB = (__builtin_astype(a->AB + a->CE, uint));
      a->AA = (__builtin_astype(a->AA + a->CD, uint));
      a->A9 = (__builtin_astype(a->A9 + a->CC, uint));
      a->A8 = (__builtin_astype(a->A8 + a->CB, uint));
      a->A7 = (__builtin_astype(a->A7 + a->CA, uint));
      a->A6 = (__builtin_astype(a->A6 + a->C9, uint));
      a->A5 = (__builtin_astype(a->A5 + a->C8, uint));
      a->A4 = (__builtin_astype(a->A4 + a->C7, uint));
      a->A3 = (__builtin_astype(a->A3 + a->C6, uint));
      a->A2 = (__builtin_astype(a->A2 + a->C5, uint));
      a->A1 = (__builtin_astype(a->A1 + a->C4, uint));
      a->A0 = (__builtin_astype(a->A0 + a->C3, uint));
    } while (0);

    for (unsigned int x = 0; x < 3; ++x) {
      do {
        do {
          unsigned int z = (a->B0);
          (a->B0) = (a->C0);
          (a->C0) = z;
        } while (0);
        do {
          unsigned int z = (a->B1);
          (a->B1) = (a->C1);
          (a->C1) = z;
        } while (0);
        do {
          unsigned int z = (a->B2);
          (a->B2) = (a->C2);
          (a->C2) = z;
        } while (0);
        do {
          unsigned int z = (a->B3);
          (a->B3) = (a->C3);
          (a->C3) = z;
        } while (0);
        do {
          unsigned int z = (a->B4);
          (a->B4) = (a->C4);
          (a->C4) = z;
        } while (0);
        do {
          unsigned int z = (a->B5);
          (a->B5) = (a->C5);
          (a->C5) = z;
        } while (0);
        do {
          unsigned int z = (a->B6);
          (a->B6) = (a->C6);
          (a->C6) = z;
        } while (0);
        do {
          unsigned int z = (a->B7);
          (a->B7) = (a->C7);
          (a->C7) = z;
        } while (0);
        do {
          unsigned int z = (a->B8);
          (a->B8) = (a->C8);
          (a->C8) = z;
        } while (0);
        do {
          unsigned int z = (a->B9);
          (a->B9) = (a->C9);
          (a->C9) = z;
        } while (0);
        do {
          unsigned int z = (a->BA);
          (a->BA) = (a->CA);
          (a->CA) = z;
        } while (0);
        do {
          unsigned int z = (a->BB);
          (a->BB) = (a->CB);
          (a->CB) = z;
        } while (0);
        do {
          unsigned int z = (a->BC);
          (a->BC) = (a->CC);
          (a->CC) = z;
        } while (0);
        do {
          unsigned int z = (a->BD);
          (a->BD) = (a->CD);
          (a->CD) = z;
        } while (0);
        do {
          unsigned int z = (a->BE);
          (a->BE) = (a->CE);
          (a->CE) = z;
        } while (0);
        do {
          unsigned int z = (a->BF);
          (a->BF) = (a->CF);
          (a->CF) = z;
        } while (0);
      } while (0);
      do {
        a->A0 ^= a->Wlow;
        a->A1 ^= a->Whigh;
      } while (0);
      do {
        a->B0 = (__builtin_astype(a->B0 << 17, uint)) | (a->B0 >> 15);
        a->B1 = (__builtin_astype(a->B1 << 17, uint)) | (a->B1 >> 15);
        a->B2 = (__builtin_astype(a->B2 << 17, uint)) | (a->B2 >> 15);
        a->B3 = (__builtin_astype(a->B3 << 17, uint)) | (a->B3 >> 15);
        a->B4 = (__builtin_astype(a->B4 << 17, uint)) | (a->B4 >> 15);
        a->B5 = (__builtin_astype(a->B5 << 17, uint)) | (a->B5 >> 15);
        a->B6 = (__builtin_astype(a->B6 << 17, uint)) | (a->B6 >> 15);
        a->B7 = (__builtin_astype(a->B7 << 17, uint)) | (a->B7 >> 15);
        a->B8 = (__builtin_astype(a->B8 << 17, uint)) | (a->B8 >> 15);
        a->B9 = (__builtin_astype(a->B9 << 17, uint)) | (a->B9 >> 15);
        a->BA = (__builtin_astype(a->BA << 17, uint)) | (a->BA >> 15);
        a->BB = (__builtin_astype(a->BB << 17, uint)) | (a->BB >> 15);
        a->BC = (__builtin_astype(a->BC << 17, uint)) | (a->BC >> 15);
        a->BD = (__builtin_astype(a->BD << 17, uint)) | (a->BD >> 15);
        a->BE = (__builtin_astype(a->BE << 17, uint)) | (a->BE >> 15);
        a->BF = (__builtin_astype(a->BF << 17, uint)) | (a->BF >> 15);
        do {
          do {
            a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->C8) * 3U, uint)) ^ a->BD ^ (a->B9 & ~a->B6) ^ f;
            a->B0 = (__builtin_astype(~(((a->B0 << 1) | (a->B0 >> 31)) ^ a->A0), uint));
          } while (0);
          do {
            a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->C7) * 3U, uint)) ^ a->BE ^ (a->BA & ~a->B7) ^ g;
            a->B1 = (__builtin_astype(~(((a->B1 << 1) | (a->B1 >> 31)) ^ a->A1), uint));
          } while (0);
          do {
            a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->C6) * 3U, uint)) ^ a->BF ^ (a->BB & ~a->B8) ^ h;
            a->B2 = (__builtin_astype(~(((a->B2 << 1) | (a->B2 >> 31)) ^ a->A2), uint));
          } while (0);
          do {
            a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->C5) * 3U, uint)) ^ a->B0 ^ (a->BC & ~a->B9) ^ i;
            a->B3 = (__builtin_astype(~(((a->B3 << 1) | (a->B3 >> 31)) ^ a->A3), uint));
          } while (0);
          do {
            a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->C4) * 3U, uint)) ^ a->B1 ^ (a->BD & ~a->BA) ^ j;
            a->B4 = (__builtin_astype(~(((a->B4 << 1) | (a->B4 >> 31)) ^ a->A4), uint));
          } while (0);
          do {
            a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->C3) * 3U, uint)) ^ a->B2 ^ (a->BE & ~a->BB) ^ k;
            a->B5 = (__builtin_astype(~(((a->B5 << 1) | (a->B5 >> 31)) ^ a->A5), uint));
          } while (0);
          do {
            a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->C2) * 3U, uint)) ^ a->B3 ^ (a->BF & ~a->BC) ^ l;
            a->B6 = (__builtin_astype(~(((a->B6 << 1) | (a->B6 >> 31)) ^ a->A6), uint));
          } while (0);
          do {
            a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->C1) * 3U, uint)) ^ a->B4 ^ (a->B0 & ~a->BD) ^ m;
            a->B7 = (__builtin_astype(~(((a->B7 << 1) | (a->B7 >> 31)) ^ a->A7), uint));
          } while (0);
          do {
            a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->C0) * 3U, uint)) ^ a->B5 ^ (a->B1 & ~a->BE) ^ n;
            a->B8 = (__builtin_astype(~(((a->B8 << 1) | (a->B8 >> 31)) ^ a->A8), uint));
          } while (0);
          do {
            a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->CF) * 3U, uint)) ^ a->B6 ^ (a->B2 & ~a->BF) ^ o;
            a->B9 = (__builtin_astype(~(((a->B9 << 1) | (a->B9 >> 31)) ^ a->A9), uint));
          } while (0);
          do {
            a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->CE) * 3U, uint)) ^ a->B7 ^ (a->B3 & ~a->B0) ^ p;
            a->BA = (__builtin_astype(~(((a->BA << 1) | (a->BA >> 31)) ^ a->AA), uint));
          } while (0);
          do {
            a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->CD) * 3U, uint)) ^ a->B8 ^ (a->B4 & ~a->B1) ^ q;
            a->BB = (__builtin_astype(~(((a->BB << 1) | (a->BB >> 31)) ^ a->AB), uint));
          } while (0);
          do {
            a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->CC) * 3U, uint)) ^ a->B9 ^ (a->B5 & ~a->B2) ^ r;
            a->BC = (__builtin_astype(~(((a->BC << 1) | (a->BC >> 31)) ^ a->A0), uint));
          } while (0);
          do {
            a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->CB) * 3U, uint)) ^ a->BA ^ (a->B6 & ~a->B3) ^ s;
            a->BD = (__builtin_astype(~(((a->BD << 1) | (a->BD >> 31)) ^ a->A1), uint));
          } while (0);
          do {
            a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->CA) * 3U, uint)) ^ a->BB ^ (a->B7 & ~a->B4) ^ t;
            a->BE = (__builtin_astype(~(((a->BE << 1) | (a->BE >> 31)) ^ a->A2), uint));
          } while (0);
          do {
            a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->C9) * 3U, uint)) ^ a->BC ^ (a->B8 & ~a->B5) ^ u;
            a->BF = (__builtin_astype(~(((a->BF << 1) | (a->BF >> 31)) ^ a->A3), uint));
          } while (0);
        } while (0);
        do {
          do {
            a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->C8) * 3U, uint)) ^ a->BD ^ (a->B9 & ~a->B6) ^ f;
            a->B0 = (__builtin_astype(~(((a->B0 << 1) | (a->B0 >> 31)) ^ a->A4), uint));
          } while (0);
          do {
            a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->C7) * 3U, uint)) ^ a->BE ^ (a->BA & ~a->B7) ^ g;
            a->B1 = (__builtin_astype(~(((a->B1 << 1) | (a->B1 >> 31)) ^ a->A5), uint));
          } while (0);
          do {
            a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->C6) * 3U, uint)) ^ a->BF ^ (a->BB & ~a->B8) ^ h;
            a->B2 = (__builtin_astype(~(((a->B2 << 1) | (a->B2 >> 31)) ^ a->A6), uint));
          } while (0);
          do {
            a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->C5) * 3U, uint)) ^ a->B0 ^ (a->BC & ~a->B9) ^ i;
            a->B3 = (__builtin_astype(~(((a->B3 << 1) | (a->B3 >> 31)) ^ a->A7), uint));
          } while (0);
          do {
            a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->C4) * 3U, uint)) ^ a->B1 ^ (a->BD & ~a->BA) ^ j;
            a->B4 = (__builtin_astype(~(((a->B4 << 1) | (a->B4 >> 31)) ^ a->A8), uint));
          } while (0);
          do {
            a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->C3) * 3U, uint)) ^ a->B2 ^ (a->BE & ~a->BB) ^ k;
            a->B5 = (__builtin_astype(~(((a->B5 << 1) | (a->B5 >> 31)) ^ a->A9), uint));
          } while (0);
          do {
            a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->C2) * 3U, uint)) ^ a->B3 ^ (a->BF & ~a->BC) ^ l;
            a->B6 = (__builtin_astype(~(((a->B6 << 1) | (a->B6 >> 31)) ^ a->AA), uint));
          } while (0);
          do {
            a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->C1) * 3U, uint)) ^ a->B4 ^ (a->B0 & ~a->BD) ^ m;
            a->B7 = (__builtin_astype(~(((a->B7 << 1) | (a->B7 >> 31)) ^ a->AB), uint));
          } while (0);
          do {
            a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->C0) * 3U, uint)) ^ a->B5 ^ (a->B1 & ~a->BE) ^ n;
            a->B8 = (__builtin_astype(~(((a->B8 << 1) | (a->B8 >> 31)) ^ a->A0), uint));
          } while (0);
          do {
            a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->CF) * 3U, uint)) ^ a->B6 ^ (a->B2 & ~a->BF) ^ o;
            a->B9 = (__builtin_astype(~(((a->B9 << 1) | (a->B9 >> 31)) ^ a->A1), uint));
          } while (0);
          do {
            a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->CE) * 3U, uint)) ^ a->B7 ^ (a->B3 & ~a->B0) ^ p;
            a->BA = (__builtin_astype(~(((a->BA << 1) | (a->BA >> 31)) ^ a->A2), uint));
          } while (0);
          do {
            a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->CD) * 3U, uint)) ^ a->B8 ^ (a->B4 & ~a->B1) ^ q;
            a->BB = (__builtin_astype(~(((a->BB << 1) | (a->BB >> 31)) ^ a->A3), uint));
          } while (0);
          do {
            a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->CC) * 3U, uint)) ^ a->B9 ^ (a->B5 & ~a->B2) ^ r;
            a->BC = (__builtin_astype(~(((a->BC << 1) | (a->BC >> 31)) ^ a->A4), uint));
          } while (0);
          do {
            a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->CB) * 3U, uint)) ^ a->BA ^ (a->B6 & ~a->B3) ^ s;
            a->BD = (__builtin_astype(~(((a->BD << 1) | (a->BD >> 31)) ^ a->A5), uint));
          } while (0);
          do {
            a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->CA) * 3U, uint)) ^ a->BB ^ (a->B7 & ~a->B4) ^ t;
            a->BE = (__builtin_astype(~(((a->BE << 1) | (a->BE >> 31)) ^ a->A6), uint));
          } while (0);
          do {
            a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->C9) * 3U, uint)) ^ a->BC ^ (a->B8 & ~a->B5) ^ u;
            a->BF = (__builtin_astype(~(((a->BF << 1) | (a->BF >> 31)) ^ a->A7), uint));
          } while (0);
        } while (0);
        do {
          do {
            a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->C8) * 3U, uint)) ^ a->BD ^ (a->B9 & ~a->B6) ^ f;
            a->B0 = (__builtin_astype(~(((a->B0 << 1) | (a->B0 >> 31)) ^ a->A8), uint));
          } while (0);
          do {
            a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->C7) * 3U, uint)) ^ a->BE ^ (a->BA & ~a->B7) ^ g;
            a->B1 = (__builtin_astype(~(((a->B1 << 1) | (a->B1 >> 31)) ^ a->A9), uint));
          } while (0);
          do {
            a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->C6) * 3U, uint)) ^ a->BF ^ (a->BB & ~a->B8) ^ h;
            a->B2 = (__builtin_astype(~(((a->B2 << 1) | (a->B2 >> 31)) ^ a->AA), uint));
          } while (0);
          do {
            a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->C5) * 3U, uint)) ^ a->B0 ^ (a->BC & ~a->B9) ^ i;
            a->B3 = (__builtin_astype(~(((a->B3 << 1) | (a->B3 >> 31)) ^ a->AB), uint));
          } while (0);
          do {
            a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->C4) * 3U, uint)) ^ a->B1 ^ (a->BD & ~a->BA) ^ j;
            a->B4 = (__builtin_astype(~(((a->B4 << 1) | (a->B4 >> 31)) ^ a->A0), uint));
          } while (0);
          do {
            a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->C3) * 3U, uint)) ^ a->B2 ^ (a->BE & ~a->BB) ^ k;
            a->B5 = (__builtin_astype(~(((a->B5 << 1) | (a->B5 >> 31)) ^ a->A1), uint));
          } while (0);
          do {
            a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->C2) * 3U, uint)) ^ a->B3 ^ (a->BF & ~a->BC) ^ l;
            a->B6 = (__builtin_astype(~(((a->B6 << 1) | (a->B6 >> 31)) ^ a->A2), uint));
          } while (0);
          do {
            a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->C1) * 3U, uint)) ^ a->B4 ^ (a->B0 & ~a->BD) ^ m;
            a->B7 = (__builtin_astype(~(((a->B7 << 1) | (a->B7 >> 31)) ^ a->A3), uint));
          } while (0);
          do {
            a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->C0) * 3U, uint)) ^ a->B5 ^ (a->B1 & ~a->BE) ^ n;
            a->B8 = (__builtin_astype(~(((a->B8 << 1) | (a->B8 >> 31)) ^ a->A4), uint));
          } while (0);
          do {
            a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->CF) * 3U, uint)) ^ a->B6 ^ (a->B2 & ~a->BF) ^ o;
            a->B9 = (__builtin_astype(~(((a->B9 << 1) | (a->B9 >> 31)) ^ a->A5), uint));
          } while (0);
          do {
            a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->CE) * 3U, uint)) ^ a->B7 ^ (a->B3 & ~a->B0) ^ p;
            a->BA = (__builtin_astype(~(((a->BA << 1) | (a->BA >> 31)) ^ a->A6), uint));
          } while (0);
          do {
            a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->CD) * 3U, uint)) ^ a->B8 ^ (a->B4 & ~a->B1) ^ q;
            a->BB = (__builtin_astype(~(((a->BB << 1) | (a->BB >> 31)) ^ a->A7), uint));
          } while (0);
          do {
            a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->CC) * 3U, uint)) ^ a->B9 ^ (a->B5 & ~a->B2) ^ r;
            a->BC = (__builtin_astype(~(((a->BC << 1) | (a->BC >> 31)) ^ a->A8), uint));
          } while (0);
          do {
            a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->CB) * 3U, uint)) ^ a->BA ^ (a->B6 & ~a->B3) ^ s;
            a->BD = (__builtin_astype(~(((a->BD << 1) | (a->BD >> 31)) ^ a->A9), uint));
          } while (0);
          do {
            a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->CA) * 3U, uint)) ^ a->BB ^ (a->B7 & ~a->B4) ^ t;
            a->BE = (__builtin_astype(~(((a->BE << 1) | (a->BE >> 31)) ^ a->AA), uint));
          } while (0);
          do {
            a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->C9) * 3U, uint)) ^ a->BC ^ (a->B8 & ~a->B5) ^ u;
            a->BF = (__builtin_astype(~(((a->BF << 1) | (a->BF >> 31)) ^ a->AB), uint));
          } while (0);
        } while (0);
        a->AB = (__builtin_astype(a->AB + a->C6, uint));
        a->AA = (__builtin_astype(a->AA + a->C5, uint));
        a->A9 = (__builtin_astype(a->A9 + a->C4, uint));
        a->A8 = (__builtin_astype(a->A8 + a->C3, uint));
        a->A7 = (__builtin_astype(a->A7 + a->C2, uint));
        a->A6 = (__builtin_astype(a->A6 + a->C1, uint));
        a->A5 = (__builtin_astype(a->A5 + a->C0, uint));
        a->A4 = (__builtin_astype(a->A4 + a->CF, uint));
        a->A3 = (__builtin_astype(a->A3 + a->CE, uint));
        a->A2 = (__builtin_astype(a->A2 + a->CD, uint));
        a->A1 = (__builtin_astype(a->A1 + a->CC, uint));
        a->A0 = (__builtin_astype(a->A0 + a->CB, uint));
        a->AB = (__builtin_astype(a->AB + a->CA, uint));
        a->AA = (__builtin_astype(a->AA + a->C9, uint));
        a->A9 = (__builtin_astype(a->A9 + a->C8, uint));
        a->A8 = (__builtin_astype(a->A8 + a->C7, uint));
        a->A7 = (__builtin_astype(a->A7 + a->C6, uint));
        a->A6 = (__builtin_astype(a->A6 + a->C5, uint));
        a->A5 = (__builtin_astype(a->A5 + a->C4, uint));
        a->A4 = (__builtin_astype(a->A4 + a->C3, uint));
        a->A3 = (__builtin_astype(a->A3 + a->C2, uint));
        a->A2 = (__builtin_astype(a->A2 + a->C1, uint));
        a->A1 = (__builtin_astype(a->A1 + a->C0, uint));
        a->A0 = (__builtin_astype(a->A0 + a->CF, uint));
        a->AB = (__builtin_astype(a->AB + a->CE, uint));
        a->AA = (__builtin_astype(a->AA + a->CD, uint));
        a->A9 = (__builtin_astype(a->A9 + a->CC, uint));
        a->A8 = (__builtin_astype(a->A8 + a->CB, uint));
        a->A7 = (__builtin_astype(a->A7 + a->CA, uint));
        a->A6 = (__builtin_astype(a->A6 + a->C9, uint));
        a->A5 = (__builtin_astype(a->A5 + a->C8, uint));
        a->A4 = (__builtin_astype(a->A4 + a->C7, uint));
        a->A3 = (__builtin_astype(a->A3 + a->C6, uint));
        a->A2 = (__builtin_astype(a->A2 + a->C5, uint));
        a->A1 = (__builtin_astype(a->A1 + a->C4, uint));
        a->A0 = (__builtin_astype(a->A0 + a->C3, uint));
      } while (0);
    }
  } else {
    unsigned long y = (c >> 2) + (v << 4);
    f = e[y];
    g = e[y + 1];
    h = e[y + 2];
    i = e[y + 3];
    j = e[y + 4];
    k = e[y + 5];
    l = e[y + 6];
    m = e[y + 7];
    n = e[y + 8];
    o = e[y + 9];
    p = e[y + 10];
    q = e[y + 11];
    r = 0x80;
    s = t = u = 0;

    do {
      a->B0 = (__builtin_astype(a->B0 + f, uint));
      a->B1 = (__builtin_astype(a->B1 + g, uint));
      a->B2 = (__builtin_astype(a->B2 + h, uint));
      a->B3 = (__builtin_astype(a->B3 + i, uint));
      a->B4 = (__builtin_astype(a->B4 + j, uint));
      a->B5 = (__builtin_astype(a->B5 + k, uint));
      a->B6 = (__builtin_astype(a->B6 + l, uint));
      a->B7 = (__builtin_astype(a->B7 + m, uint));
      a->B8 = (__builtin_astype(a->B8 + n, uint));
      a->B9 = (__builtin_astype(a->B9 + o, uint));
      a->BA = (__builtin_astype(a->BA + p, uint));
      a->BB = (__builtin_astype(a->BB + q, uint));
      a->BC = (__builtin_astype(a->BC + r, uint));
      a->BD = (__builtin_astype(a->BD + s, uint));
      a->BE = (__builtin_astype(a->BE + t, uint));
      a->BF = (__builtin_astype(a->BF + u, uint));
    } while (0);
    do {
      a->A0 ^= a->Wlow;
      a->A1 ^= a->Whigh;
    } while (0);
    do {
      a->B0 = (__builtin_astype(a->B0 << 17, uint)) | (a->B0 >> 15);
      a->B1 = (__builtin_astype(a->B1 << 17, uint)) | (a->B1 >> 15);
      a->B2 = (__builtin_astype(a->B2 << 17, uint)) | (a->B2 >> 15);
      a->B3 = (__builtin_astype(a->B3 << 17, uint)) | (a->B3 >> 15);
      a->B4 = (__builtin_astype(a->B4 << 17, uint)) | (a->B4 >> 15);
      a->B5 = (__builtin_astype(a->B5 << 17, uint)) | (a->B5 >> 15);
      a->B6 = (__builtin_astype(a->B6 << 17, uint)) | (a->B6 >> 15);
      a->B7 = (__builtin_astype(a->B7 << 17, uint)) | (a->B7 >> 15);
      a->B8 = (__builtin_astype(a->B8 << 17, uint)) | (a->B8 >> 15);
      a->B9 = (__builtin_astype(a->B9 << 17, uint)) | (a->B9 >> 15);
      a->BA = (__builtin_astype(a->BA << 17, uint)) | (a->BA >> 15);
      a->BB = (__builtin_astype(a->BB << 17, uint)) | (a->BB >> 15);
      a->BC = (__builtin_astype(a->BC << 17, uint)) | (a->BC >> 15);
      a->BD = (__builtin_astype(a->BD << 17, uint)) | (a->BD >> 15);
      a->BE = (__builtin_astype(a->BE << 17, uint)) | (a->BE >> 15);
      a->BF = (__builtin_astype(a->BF << 17, uint)) | (a->BF >> 15);
      do {
        do {
          a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->C8) * 3U, uint)) ^ a->BD ^ (a->B9 & ~a->B6) ^ f;
          a->B0 = (__builtin_astype(~(((a->B0 << 1) | (a->B0 >> 31)) ^ a->A0), uint));
        } while (0);
        do {
          a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->C7) * 3U, uint)) ^ a->BE ^ (a->BA & ~a->B7) ^ g;
          a->B1 = (__builtin_astype(~(((a->B1 << 1) | (a->B1 >> 31)) ^ a->A1), uint));
        } while (0);
        do {
          a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->C6) * 3U, uint)) ^ a->BF ^ (a->BB & ~a->B8) ^ h;
          a->B2 = (__builtin_astype(~(((a->B2 << 1) | (a->B2 >> 31)) ^ a->A2), uint));
        } while (0);
        do {
          a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->C5) * 3U, uint)) ^ a->B0 ^ (a->BC & ~a->B9) ^ i;
          a->B3 = (__builtin_astype(~(((a->B3 << 1) | (a->B3 >> 31)) ^ a->A3), uint));
        } while (0);
        do {
          a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->C4) * 3U, uint)) ^ a->B1 ^ (a->BD & ~a->BA) ^ j;
          a->B4 = (__builtin_astype(~(((a->B4 << 1) | (a->B4 >> 31)) ^ a->A4), uint));
        } while (0);
        do {
          a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->C3) * 3U, uint)) ^ a->B2 ^ (a->BE & ~a->BB) ^ k;
          a->B5 = (__builtin_astype(~(((a->B5 << 1) | (a->B5 >> 31)) ^ a->A5), uint));
        } while (0);
        do {
          a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->C2) * 3U, uint)) ^ a->B3 ^ (a->BF & ~a->BC) ^ l;
          a->B6 = (__builtin_astype(~(((a->B6 << 1) | (a->B6 >> 31)) ^ a->A6), uint));
        } while (0);
        do {
          a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->C1) * 3U, uint)) ^ a->B4 ^ (a->B0 & ~a->BD) ^ m;
          a->B7 = (__builtin_astype(~(((a->B7 << 1) | (a->B7 >> 31)) ^ a->A7), uint));
        } while (0);
        do {
          a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->C0) * 3U, uint)) ^ a->B5 ^ (a->B1 & ~a->BE) ^ n;
          a->B8 = (__builtin_astype(~(((a->B8 << 1) | (a->B8 >> 31)) ^ a->A8), uint));
        } while (0);
        do {
          a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->CF) * 3U, uint)) ^ a->B6 ^ (a->B2 & ~a->BF) ^ o;
          a->B9 = (__builtin_astype(~(((a->B9 << 1) | (a->B9 >> 31)) ^ a->A9), uint));
        } while (0);
        do {
          a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->CE) * 3U, uint)) ^ a->B7 ^ (a->B3 & ~a->B0) ^ p;
          a->BA = (__builtin_astype(~(((a->BA << 1) | (a->BA >> 31)) ^ a->AA), uint));
        } while (0);
        do {
          a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->CD) * 3U, uint)) ^ a->B8 ^ (a->B4 & ~a->B1) ^ q;
          a->BB = (__builtin_astype(~(((a->BB << 1) | (a->BB >> 31)) ^ a->AB), uint));
        } while (0);
        do {
          a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->CC) * 3U, uint)) ^ a->B9 ^ (a->B5 & ~a->B2) ^ r;
          a->BC = (__builtin_astype(~(((a->BC << 1) | (a->BC >> 31)) ^ a->A0), uint));
        } while (0);
        do {
          a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->CB) * 3U, uint)) ^ a->BA ^ (a->B6 & ~a->B3) ^ s;
          a->BD = (__builtin_astype(~(((a->BD << 1) | (a->BD >> 31)) ^ a->A1), uint));
        } while (0);
        do {
          a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->CA) * 3U, uint)) ^ a->BB ^ (a->B7 & ~a->B4) ^ t;
          a->BE = (__builtin_astype(~(((a->BE << 1) | (a->BE >> 31)) ^ a->A2), uint));
        } while (0);
        do {
          a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->C9) * 3U, uint)) ^ a->BC ^ (a->B8 & ~a->B5) ^ u;
          a->BF = (__builtin_astype(~(((a->BF << 1) | (a->BF >> 31)) ^ a->A3), uint));
        } while (0);
      } while (0);
      do {
        do {
          a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->C8) * 3U, uint)) ^ a->BD ^ (a->B9 & ~a->B6) ^ f;
          a->B0 = (__builtin_astype(~(((a->B0 << 1) | (a->B0 >> 31)) ^ a->A4), uint));
        } while (0);
        do {
          a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->C7) * 3U, uint)) ^ a->BE ^ (a->BA & ~a->B7) ^ g;
          a->B1 = (__builtin_astype(~(((a->B1 << 1) | (a->B1 >> 31)) ^ a->A5), uint));
        } while (0);
        do {
          a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->C6) * 3U, uint)) ^ a->BF ^ (a->BB & ~a->B8) ^ h;
          a->B2 = (__builtin_astype(~(((a->B2 << 1) | (a->B2 >> 31)) ^ a->A6), uint));
        } while (0);
        do {
          a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->C5) * 3U, uint)) ^ a->B0 ^ (a->BC & ~a->B9) ^ i;
          a->B3 = (__builtin_astype(~(((a->B3 << 1) | (a->B3 >> 31)) ^ a->A7), uint));
        } while (0);
        do {
          a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->C4) * 3U, uint)) ^ a->B1 ^ (a->BD & ~a->BA) ^ j;
          a->B4 = (__builtin_astype(~(((a->B4 << 1) | (a->B4 >> 31)) ^ a->A8), uint));
        } while (0);
        do {
          a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->C3) * 3U, uint)) ^ a->B2 ^ (a->BE & ~a->BB) ^ k;
          a->B5 = (__builtin_astype(~(((a->B5 << 1) | (a->B5 >> 31)) ^ a->A9), uint));
        } while (0);
        do {
          a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->C2) * 3U, uint)) ^ a->B3 ^ (a->BF & ~a->BC) ^ l;
          a->B6 = (__builtin_astype(~(((a->B6 << 1) | (a->B6 >> 31)) ^ a->AA), uint));
        } while (0);
        do {
          a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->C1) * 3U, uint)) ^ a->B4 ^ (a->B0 & ~a->BD) ^ m;
          a->B7 = (__builtin_astype(~(((a->B7 << 1) | (a->B7 >> 31)) ^ a->AB), uint));
        } while (0);
        do {
          a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->C0) * 3U, uint)) ^ a->B5 ^ (a->B1 & ~a->BE) ^ n;
          a->B8 = (__builtin_astype(~(((a->B8 << 1) | (a->B8 >> 31)) ^ a->A0), uint));
        } while (0);
        do {
          a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->CF) * 3U, uint)) ^ a->B6 ^ (a->B2 & ~a->BF) ^ o;
          a->B9 = (__builtin_astype(~(((a->B9 << 1) | (a->B9 >> 31)) ^ a->A1), uint));
        } while (0);
        do {
          a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->CE) * 3U, uint)) ^ a->B7 ^ (a->B3 & ~a->B0) ^ p;
          a->BA = (__builtin_astype(~(((a->BA << 1) | (a->BA >> 31)) ^ a->A2), uint));
        } while (0);
        do {
          a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->CD) * 3U, uint)) ^ a->B8 ^ (a->B4 & ~a->B1) ^ q;
          a->BB = (__builtin_astype(~(((a->BB << 1) | (a->BB >> 31)) ^ a->A3), uint));
        } while (0);
        do {
          a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->CC) * 3U, uint)) ^ a->B9 ^ (a->B5 & ~a->B2) ^ r;
          a->BC = (__builtin_astype(~(((a->BC << 1) | (a->BC >> 31)) ^ a->A4), uint));
        } while (0);
        do {
          a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->CB) * 3U, uint)) ^ a->BA ^ (a->B6 & ~a->B3) ^ s;
          a->BD = (__builtin_astype(~(((a->BD << 1) | (a->BD >> 31)) ^ a->A5), uint));
        } while (0);
        do {
          a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->CA) * 3U, uint)) ^ a->BB ^ (a->B7 & ~a->B4) ^ t;
          a->BE = (__builtin_astype(~(((a->BE << 1) | (a->BE >> 31)) ^ a->A6), uint));
        } while (0);
        do {
          a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->C9) * 3U, uint)) ^ a->BC ^ (a->B8 & ~a->B5) ^ u;
          a->BF = (__builtin_astype(~(((a->BF << 1) | (a->BF >> 31)) ^ a->A7), uint));
        } while (0);
      } while (0);
      do {
        do {
          a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->C8) * 3U, uint)) ^ a->BD ^ (a->B9 & ~a->B6) ^ f;
          a->B0 = (__builtin_astype(~(((a->B0 << 1) | (a->B0 >> 31)) ^ a->A8), uint));
        } while (0);
        do {
          a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->C7) * 3U, uint)) ^ a->BE ^ (a->BA & ~a->B7) ^ g;
          a->B1 = (__builtin_astype(~(((a->B1 << 1) | (a->B1 >> 31)) ^ a->A9), uint));
        } while (0);
        do {
          a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->C6) * 3U, uint)) ^ a->BF ^ (a->BB & ~a->B8) ^ h;
          a->B2 = (__builtin_astype(~(((a->B2 << 1) | (a->B2 >> 31)) ^ a->AA), uint));
        } while (0);
        do {
          a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->C5) * 3U, uint)) ^ a->B0 ^ (a->BC & ~a->B9) ^ i;
          a->B3 = (__builtin_astype(~(((a->B3 << 1) | (a->B3 >> 31)) ^ a->AB), uint));
        } while (0);
        do {
          a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->C4) * 3U, uint)) ^ a->B1 ^ (a->BD & ~a->BA) ^ j;
          a->B4 = (__builtin_astype(~(((a->B4 << 1) | (a->B4 >> 31)) ^ a->A0), uint));
        } while (0);
        do {
          a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->C3) * 3U, uint)) ^ a->B2 ^ (a->BE & ~a->BB) ^ k;
          a->B5 = (__builtin_astype(~(((a->B5 << 1) | (a->B5 >> 31)) ^ a->A1), uint));
        } while (0);
        do {
          a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->C2) * 3U, uint)) ^ a->B3 ^ (a->BF & ~a->BC) ^ l;
          a->B6 = (__builtin_astype(~(((a->B6 << 1) | (a->B6 >> 31)) ^ a->A2), uint));
        } while (0);
        do {
          a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->C1) * 3U, uint)) ^ a->B4 ^ (a->B0 & ~a->BD) ^ m;
          a->B7 = (__builtin_astype(~(((a->B7 << 1) | (a->B7 >> 31)) ^ a->A3), uint));
        } while (0);
        do {
          a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->C0) * 3U, uint)) ^ a->B5 ^ (a->B1 & ~a->BE) ^ n;
          a->B8 = (__builtin_astype(~(((a->B8 << 1) | (a->B8 >> 31)) ^ a->A4), uint));
        } while (0);
        do {
          a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->CF) * 3U, uint)) ^ a->B6 ^ (a->B2 & ~a->BF) ^ o;
          a->B9 = (__builtin_astype(~(((a->B9 << 1) | (a->B9 >> 31)) ^ a->A5), uint));
        } while (0);
        do {
          a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->CE) * 3U, uint)) ^ a->B7 ^ (a->B3 & ~a->B0) ^ p;
          a->BA = (__builtin_astype(~(((a->BA << 1) | (a->BA >> 31)) ^ a->A6), uint));
        } while (0);
        do {
          a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->CD) * 3U, uint)) ^ a->B8 ^ (a->B4 & ~a->B1) ^ q;
          a->BB = (__builtin_astype(~(((a->BB << 1) | (a->BB >> 31)) ^ a->A7), uint));
        } while (0);
        do {
          a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->CC) * 3U, uint)) ^ a->B9 ^ (a->B5 & ~a->B2) ^ r;
          a->BC = (__builtin_astype(~(((a->BC << 1) | (a->BC >> 31)) ^ a->A8), uint));
        } while (0);
        do {
          a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->CB) * 3U, uint)) ^ a->BA ^ (a->B6 & ~a->B3) ^ s;
          a->BD = (__builtin_astype(~(((a->BD << 1) | (a->BD >> 31)) ^ a->A9), uint));
        } while (0);
        do {
          a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->CA) * 3U, uint)) ^ a->BB ^ (a->B7 & ~a->B4) ^ t;
          a->BE = (__builtin_astype(~(((a->BE << 1) | (a->BE >> 31)) ^ a->AA), uint));
        } while (0);
        do {
          a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->C9) * 3U, uint)) ^ a->BC ^ (a->B8 & ~a->B5) ^ u;
          a->BF = (__builtin_astype(~(((a->BF << 1) | (a->BF >> 31)) ^ a->AB), uint));
        } while (0);
      } while (0);
      a->AB = (__builtin_astype(a->AB + a->C6, uint));
      a->AA = (__builtin_astype(a->AA + a->C5, uint));
      a->A9 = (__builtin_astype(a->A9 + a->C4, uint));
      a->A8 = (__builtin_astype(a->A8 + a->C3, uint));
      a->A7 = (__builtin_astype(a->A7 + a->C2, uint));
      a->A6 = (__builtin_astype(a->A6 + a->C1, uint));
      a->A5 = (__builtin_astype(a->A5 + a->C0, uint));
      a->A4 = (__builtin_astype(a->A4 + a->CF, uint));
      a->A3 = (__builtin_astype(a->A3 + a->CE, uint));
      a->A2 = (__builtin_astype(a->A2 + a->CD, uint));
      a->A1 = (__builtin_astype(a->A1 + a->CC, uint));
      a->A0 = (__builtin_astype(a->A0 + a->CB, uint));
      a->AB = (__builtin_astype(a->AB + a->CA, uint));
      a->AA = (__builtin_astype(a->AA + a->C9, uint));
      a->A9 = (__builtin_astype(a->A9 + a->C8, uint));
      a->A8 = (__builtin_astype(a->A8 + a->C7, uint));
      a->A7 = (__builtin_astype(a->A7 + a->C6, uint));
      a->A6 = (__builtin_astype(a->A6 + a->C5, uint));
      a->A5 = (__builtin_astype(a->A5 + a->C4, uint));
      a->A4 = (__builtin_astype(a->A4 + a->C3, uint));
      a->A3 = (__builtin_astype(a->A3 + a->C2, uint));
      a->A2 = (__builtin_astype(a->A2 + a->C1, uint));
      a->A1 = (__builtin_astype(a->A1 + a->C0, uint));
      a->A0 = (__builtin_astype(a->A0 + a->CF, uint));
      a->AB = (__builtin_astype(a->AB + a->CE, uint));
      a->AA = (__builtin_astype(a->AA + a->CD, uint));
      a->A9 = (__builtin_astype(a->A9 + a->CC, uint));
      a->A8 = (__builtin_astype(a->A8 + a->CB, uint));
      a->A7 = (__builtin_astype(a->A7 + a->CA, uint));
      a->A6 = (__builtin_astype(a->A6 + a->C9, uint));
      a->A5 = (__builtin_astype(a->A5 + a->C8, uint));
      a->A4 = (__builtin_astype(a->A4 + a->C7, uint));
      a->A3 = (__builtin_astype(a->A3 + a->C6, uint));
      a->A2 = (__builtin_astype(a->A2 + a->C5, uint));
      a->A1 = (__builtin_astype(a->A1 + a->C4, uint));
      a->A0 = (__builtin_astype(a->A0 + a->C3, uint));
    } while (0);

    for (unsigned int x = 0; x < 3; ++x) {
      do {
        do {
          unsigned int z = (a->B0);
          (a->B0) = (a->C0);
          (a->C0) = z;
        } while (0);
        do {
          unsigned int z = (a->B1);
          (a->B1) = (a->C1);
          (a->C1) = z;
        } while (0);
        do {
          unsigned int z = (a->B2);
          (a->B2) = (a->C2);
          (a->C2) = z;
        } while (0);
        do {
          unsigned int z = (a->B3);
          (a->B3) = (a->C3);
          (a->C3) = z;
        } while (0);
        do {
          unsigned int z = (a->B4);
          (a->B4) = (a->C4);
          (a->C4) = z;
        } while (0);
        do {
          unsigned int z = (a->B5);
          (a->B5) = (a->C5);
          (a->C5) = z;
        } while (0);
        do {
          unsigned int z = (a->B6);
          (a->B6) = (a->C6);
          (a->C6) = z;
        } while (0);
        do {
          unsigned int z = (a->B7);
          (a->B7) = (a->C7);
          (a->C7) = z;
        } while (0);
        do {
          unsigned int z = (a->B8);
          (a->B8) = (a->C8);
          (a->C8) = z;
        } while (0);
        do {
          unsigned int z = (a->B9);
          (a->B9) = (a->C9);
          (a->C9) = z;
        } while (0);
        do {
          unsigned int z = (a->BA);
          (a->BA) = (a->CA);
          (a->CA) = z;
        } while (0);
        do {
          unsigned int z = (a->BB);
          (a->BB) = (a->CB);
          (a->CB) = z;
        } while (0);
        do {
          unsigned int z = (a->BC);
          (a->BC) = (a->CC);
          (a->CC) = z;
        } while (0);
        do {
          unsigned int z = (a->BD);
          (a->BD) = (a->CD);
          (a->CD) = z;
        } while (0);
        do {
          unsigned int z = (a->BE);
          (a->BE) = (a->CE);
          (a->CE) = z;
        } while (0);
        do {
          unsigned int z = (a->BF);
          (a->BF) = (a->CF);
          (a->CF) = z;
        } while (0);
      } while (0);
      do {
        a->A0 ^= a->Wlow;
        a->A1 ^= a->Whigh;
      } while (0);
      do {
        a->B0 = (__builtin_astype(a->B0 << 17, uint)) | (a->B0 >> 15);
        a->B1 = (__builtin_astype(a->B1 << 17, uint)) | (a->B1 >> 15);
        a->B2 = (__builtin_astype(a->B2 << 17, uint)) | (a->B2 >> 15);
        a->B3 = (__builtin_astype(a->B3 << 17, uint)) | (a->B3 >> 15);
        a->B4 = (__builtin_astype(a->B4 << 17, uint)) | (a->B4 >> 15);
        a->B5 = (__builtin_astype(a->B5 << 17, uint)) | (a->B5 >> 15);
        a->B6 = (__builtin_astype(a->B6 << 17, uint)) | (a->B6 >> 15);
        a->B7 = (__builtin_astype(a->B7 << 17, uint)) | (a->B7 >> 15);
        a->B8 = (__builtin_astype(a->B8 << 17, uint)) | (a->B8 >> 15);
        a->B9 = (__builtin_astype(a->B9 << 17, uint)) | (a->B9 >> 15);
        a->BA = (__builtin_astype(a->BA << 17, uint)) | (a->BA >> 15);
        a->BB = (__builtin_astype(a->BB << 17, uint)) | (a->BB >> 15);
        a->BC = (__builtin_astype(a->BC << 17, uint)) | (a->BC >> 15);
        a->BD = (__builtin_astype(a->BD << 17, uint)) | (a->BD >> 15);
        a->BE = (__builtin_astype(a->BE << 17, uint)) | (a->BE >> 15);
        a->BF = (__builtin_astype(a->BF << 17, uint)) | (a->BF >> 15);
        do {
          do {
            a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->C8) * 3U, uint)) ^ a->BD ^ (a->B9 & ~a->B6) ^ f;
            a->B0 = (__builtin_astype(~(((a->B0 << 1) | (a->B0 >> 31)) ^ a->A0), uint));
          } while (0);
          do {
            a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->C7) * 3U, uint)) ^ a->BE ^ (a->BA & ~a->B7) ^ g;
            a->B1 = (__builtin_astype(~(((a->B1 << 1) | (a->B1 >> 31)) ^ a->A1), uint));
          } while (0);
          do {
            a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->C6) * 3U, uint)) ^ a->BF ^ (a->BB & ~a->B8) ^ h;
            a->B2 = (__builtin_astype(~(((a->B2 << 1) | (a->B2 >> 31)) ^ a->A2), uint));
          } while (0);
          do {
            a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->C5) * 3U, uint)) ^ a->B0 ^ (a->BC & ~a->B9) ^ i;
            a->B3 = (__builtin_astype(~(((a->B3 << 1) | (a->B3 >> 31)) ^ a->A3), uint));
          } while (0);
          do {
            a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->C4) * 3U, uint)) ^ a->B1 ^ (a->BD & ~a->BA) ^ j;
            a->B4 = (__builtin_astype(~(((a->B4 << 1) | (a->B4 >> 31)) ^ a->A4), uint));
          } while (0);
          do {
            a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->C3) * 3U, uint)) ^ a->B2 ^ (a->BE & ~a->BB) ^ k;
            a->B5 = (__builtin_astype(~(((a->B5 << 1) | (a->B5 >> 31)) ^ a->A5), uint));
          } while (0);
          do {
            a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->C2) * 3U, uint)) ^ a->B3 ^ (a->BF & ~a->BC) ^ l;
            a->B6 = (__builtin_astype(~(((a->B6 << 1) | (a->B6 >> 31)) ^ a->A6), uint));
          } while (0);
          do {
            a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->C1) * 3U, uint)) ^ a->B4 ^ (a->B0 & ~a->BD) ^ m;
            a->B7 = (__builtin_astype(~(((a->B7 << 1) | (a->B7 >> 31)) ^ a->A7), uint));
          } while (0);
          do {
            a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->C0) * 3U, uint)) ^ a->B5 ^ (a->B1 & ~a->BE) ^ n;
            a->B8 = (__builtin_astype(~(((a->B8 << 1) | (a->B8 >> 31)) ^ a->A8), uint));
          } while (0);
          do {
            a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->CF) * 3U, uint)) ^ a->B6 ^ (a->B2 & ~a->BF) ^ o;
            a->B9 = (__builtin_astype(~(((a->B9 << 1) | (a->B9 >> 31)) ^ a->A9), uint));
          } while (0);
          do {
            a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->CE) * 3U, uint)) ^ a->B7 ^ (a->B3 & ~a->B0) ^ p;
            a->BA = (__builtin_astype(~(((a->BA << 1) | (a->BA >> 31)) ^ a->AA), uint));
          } while (0);
          do {
            a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->CD) * 3U, uint)) ^ a->B8 ^ (a->B4 & ~a->B1) ^ q;
            a->BB = (__builtin_astype(~(((a->BB << 1) | (a->BB >> 31)) ^ a->AB), uint));
          } while (0);
          do {
            a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->CC) * 3U, uint)) ^ a->B9 ^ (a->B5 & ~a->B2) ^ r;
            a->BC = (__builtin_astype(~(((a->BC << 1) | (a->BC >> 31)) ^ a->A0), uint));
          } while (0);
          do {
            a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->CB) * 3U, uint)) ^ a->BA ^ (a->B6 & ~a->B3) ^ s;
            a->BD = (__builtin_astype(~(((a->BD << 1) | (a->BD >> 31)) ^ a->A1), uint));
          } while (0);
          do {
            a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->CA) * 3U, uint)) ^ a->BB ^ (a->B7 & ~a->B4) ^ t;
            a->BE = (__builtin_astype(~(((a->BE << 1) | (a->BE >> 31)) ^ a->A2), uint));
          } while (0);
          do {
            a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->C9) * 3U, uint)) ^ a->BC ^ (a->B8 & ~a->B5) ^ u;
            a->BF = (__builtin_astype(~(((a->BF << 1) | (a->BF >> 31)) ^ a->A3), uint));
          } while (0);
        } while (0);
        do {
          do {
            a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->C8) * 3U, uint)) ^ a->BD ^ (a->B9 & ~a->B6) ^ f;
            a->B0 = (__builtin_astype(~(((a->B0 << 1) | (a->B0 >> 31)) ^ a->A4), uint));
          } while (0);
          do {
            a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->C7) * 3U, uint)) ^ a->BE ^ (a->BA & ~a->B7) ^ g;
            a->B1 = (__builtin_astype(~(((a->B1 << 1) | (a->B1 >> 31)) ^ a->A5), uint));
          } while (0);
          do {
            a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->C6) * 3U, uint)) ^ a->BF ^ (a->BB & ~a->B8) ^ h;
            a->B2 = (__builtin_astype(~(((a->B2 << 1) | (a->B2 >> 31)) ^ a->A6), uint));
          } while (0);
          do {
            a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->C5) * 3U, uint)) ^ a->B0 ^ (a->BC & ~a->B9) ^ i;
            a->B3 = (__builtin_astype(~(((a->B3 << 1) | (a->B3 >> 31)) ^ a->A7), uint));
          } while (0);
          do {
            a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->C4) * 3U, uint)) ^ a->B1 ^ (a->BD & ~a->BA) ^ j;
            a->B4 = (__builtin_astype(~(((a->B4 << 1) | (a->B4 >> 31)) ^ a->A8), uint));
          } while (0);
          do {
            a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->C3) * 3U, uint)) ^ a->B2 ^ (a->BE & ~a->BB) ^ k;
            a->B5 = (__builtin_astype(~(((a->B5 << 1) | (a->B5 >> 31)) ^ a->A9), uint));
          } while (0);
          do {
            a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->C2) * 3U, uint)) ^ a->B3 ^ (a->BF & ~a->BC) ^ l;
            a->B6 = (__builtin_astype(~(((a->B6 << 1) | (a->B6 >> 31)) ^ a->AA), uint));
          } while (0);
          do {
            a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->C1) * 3U, uint)) ^ a->B4 ^ (a->B0 & ~a->BD) ^ m;
            a->B7 = (__builtin_astype(~(((a->B7 << 1) | (a->B7 >> 31)) ^ a->AB), uint));
          } while (0);
          do {
            a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->C0) * 3U, uint)) ^ a->B5 ^ (a->B1 & ~a->BE) ^ n;
            a->B8 = (__builtin_astype(~(((a->B8 << 1) | (a->B8 >> 31)) ^ a->A0), uint));
          } while (0);
          do {
            a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->CF) * 3U, uint)) ^ a->B6 ^ (a->B2 & ~a->BF) ^ o;
            a->B9 = (__builtin_astype(~(((a->B9 << 1) | (a->B9 >> 31)) ^ a->A1), uint));
          } while (0);
          do {
            a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->CE) * 3U, uint)) ^ a->B7 ^ (a->B3 & ~a->B0) ^ p;
            a->BA = (__builtin_astype(~(((a->BA << 1) | (a->BA >> 31)) ^ a->A2), uint));
          } while (0);
          do {
            a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->CD) * 3U, uint)) ^ a->B8 ^ (a->B4 & ~a->B1) ^ q;
            a->BB = (__builtin_astype(~(((a->BB << 1) | (a->BB >> 31)) ^ a->A3), uint));
          } while (0);
          do {
            a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->CC) * 3U, uint)) ^ a->B9 ^ (a->B5 & ~a->B2) ^ r;
            a->BC = (__builtin_astype(~(((a->BC << 1) | (a->BC >> 31)) ^ a->A4), uint));
          } while (0);
          do {
            a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->CB) * 3U, uint)) ^ a->BA ^ (a->B6 & ~a->B3) ^ s;
            a->BD = (__builtin_astype(~(((a->BD << 1) | (a->BD >> 31)) ^ a->A5), uint));
          } while (0);
          do {
            a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->CA) * 3U, uint)) ^ a->BB ^ (a->B7 & ~a->B4) ^ t;
            a->BE = (__builtin_astype(~(((a->BE << 1) | (a->BE >> 31)) ^ a->A6), uint));
          } while (0);
          do {
            a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->C9) * 3U, uint)) ^ a->BC ^ (a->B8 & ~a->B5) ^ u;
            a->BF = (__builtin_astype(~(((a->BF << 1) | (a->BF >> 31)) ^ a->A7), uint));
          } while (0);
        } while (0);
        do {
          do {
            a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->C8) * 3U, uint)) ^ a->BD ^ (a->B9 & ~a->B6) ^ f;
            a->B0 = (__builtin_astype(~(((a->B0 << 1) | (a->B0 >> 31)) ^ a->A8), uint));
          } while (0);
          do {
            a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->C7) * 3U, uint)) ^ a->BE ^ (a->BA & ~a->B7) ^ g;
            a->B1 = (__builtin_astype(~(((a->B1 << 1) | (a->B1 >> 31)) ^ a->A9), uint));
          } while (0);
          do {
            a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->C6) * 3U, uint)) ^ a->BF ^ (a->BB & ~a->B8) ^ h;
            a->B2 = (__builtin_astype(~(((a->B2 << 1) | (a->B2 >> 31)) ^ a->AA), uint));
          } while (0);
          do {
            a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->C5) * 3U, uint)) ^ a->B0 ^ (a->BC & ~a->B9) ^ i;
            a->B3 = (__builtin_astype(~(((a->B3 << 1) | (a->B3 >> 31)) ^ a->AB), uint));
          } while (0);
          do {
            a->A0 = (__builtin_astype((a->A0 ^ (((a->AB << 15) | (a->AB >> 17)) * 5U) ^ a->C4) * 3U, uint)) ^ a->B1 ^ (a->BD & ~a->BA) ^ j;
            a->B4 = (__builtin_astype(~(((a->B4 << 1) | (a->B4 >> 31)) ^ a->A0), uint));
          } while (0);
          do {
            a->A1 = (__builtin_astype((a->A1 ^ (((a->A0 << 15) | (a->A0 >> 17)) * 5U) ^ a->C3) * 3U, uint)) ^ a->B2 ^ (a->BE & ~a->BB) ^ k;
            a->B5 = (__builtin_astype(~(((a->B5 << 1) | (a->B5 >> 31)) ^ a->A1), uint));
          } while (0);
          do {
            a->A2 = (__builtin_astype((a->A2 ^ (((a->A1 << 15) | (a->A1 >> 17)) * 5U) ^ a->C2) * 3U, uint)) ^ a->B3 ^ (a->BF & ~a->BC) ^ l;
            a->B6 = (__builtin_astype(~(((a->B6 << 1) | (a->B6 >> 31)) ^ a->A2), uint));
          } while (0);
          do {
            a->A3 = (__builtin_astype((a->A3 ^ (((a->A2 << 15) | (a->A2 >> 17)) * 5U) ^ a->C1) * 3U, uint)) ^ a->B4 ^ (a->B0 & ~a->BD) ^ m;
            a->B7 = (__builtin_astype(~(((a->B7 << 1) | (a->B7 >> 31)) ^ a->A3), uint));
          } while (0);
          do {
            a->A4 = (__builtin_astype((a->A4 ^ (((a->A3 << 15) | (a->A3 >> 17)) * 5U) ^ a->C0) * 3U, uint)) ^ a->B5 ^ (a->B1 & ~a->BE) ^ n;
            a->B8 = (__builtin_astype(~(((a->B8 << 1) | (a->B8 >> 31)) ^ a->A4), uint));
          } while (0);
          do {
            a->A5 = (__builtin_astype((a->A5 ^ (((a->A4 << 15) | (a->A4 >> 17)) * 5U) ^ a->CF) * 3U, uint)) ^ a->B6 ^ (a->B2 & ~a->BF) ^ o;
            a->B9 = (__builtin_astype(~(((a->B9 << 1) | (a->B9 >> 31)) ^ a->A5), uint));
          } while (0);
          do {
            a->A6 = (__builtin_astype((a->A6 ^ (((a->A5 << 15) | (a->A5 >> 17)) * 5U) ^ a->CE) * 3U, uint)) ^ a->B7 ^ (a->B3 & ~a->B0) ^ p;
            a->BA = (__builtin_astype(~(((a->BA << 1) | (a->BA >> 31)) ^ a->A6), uint));
          } while (0);
          do {
            a->A7 = (__builtin_astype((a->A7 ^ (((a->A6 << 15) | (a->A6 >> 17)) * 5U) ^ a->CD) * 3U, uint)) ^ a->B8 ^ (a->B4 & ~a->B1) ^ q;
            a->BB = (__builtin_astype(~(((a->BB << 1) | (a->BB >> 31)) ^ a->A7), uint));
          } while (0);
          do {
            a->A8 = (__builtin_astype((a->A8 ^ (((a->A7 << 15) | (a->A7 >> 17)) * 5U) ^ a->CC) * 3U, uint)) ^ a->B9 ^ (a->B5 & ~a->B2) ^ r;
            a->BC = (__builtin_astype(~(((a->BC << 1) | (a->BC >> 31)) ^ a->A8), uint));
          } while (0);
          do {
            a->A9 = (__builtin_astype((a->A9 ^ (((a->A8 << 15) | (a->A8 >> 17)) * 5U) ^ a->CB) * 3U, uint)) ^ a->BA ^ (a->B6 & ~a->B3) ^ s;
            a->BD = (__builtin_astype(~(((a->BD << 1) | (a->BD >> 31)) ^ a->A9), uint));
          } while (0);
          do {
            a->AA = (__builtin_astype((a->AA ^ (((a->A9 << 15) | (a->A9 >> 17)) * 5U) ^ a->CA) * 3U, uint)) ^ a->BB ^ (a->B7 & ~a->B4) ^ t;
            a->BE = (__builtin_astype(~(((a->BE << 1) | (a->BE >> 31)) ^ a->AA), uint));
          } while (0);
          do {
            a->AB = (__builtin_astype((a->AB ^ (((a->AA << 15) | (a->AA >> 17)) * 5U) ^ a->C9) * 3U, uint)) ^ a->BC ^ (a->B8 & ~a->B5) ^ u;
            a->BF = (__builtin_astype(~(((a->BF << 1) | (a->BF >> 31)) ^ a->AB), uint));
          } while (0);
        } while (0);
        a->AB = (__builtin_astype(a->AB + a->C6, uint));
        a->AA = (__builtin_astype(a->AA + a->C5, uint));
        a->A9 = (__builtin_astype(a->A9 + a->C4, uint));
        a->A8 = (__builtin_astype(a->A8 + a->C3, uint));
        a->A7 = (__builtin_astype(a->A7 + a->C2, uint));
        a->A6 = (__builtin_astype(a->A6 + a->C1, uint));
        a->A5 = (__builtin_astype(a->A5 + a->C0, uint));
        a->A4 = (__builtin_astype(a->A4 + a->CF, uint));
        a->A3 = (__builtin_astype(a->A3 + a->CE, uint));
        a->A2 = (__builtin_astype(a->A2 + a->CD, uint));
        a->A1 = (__builtin_astype(a->A1 + a->CC, uint));
        a->A0 = (__builtin_astype(a->A0 + a->CB, uint));
        a->AB = (__builtin_astype(a->AB + a->CA, uint));
        a->AA = (__builtin_astype(a->AA + a->C9, uint));
        a->A9 = (__builtin_astype(a->A9 + a->C8, uint));
        a->A8 = (__builtin_astype(a->A8 + a->C7, uint));
        a->A7 = (__builtin_astype(a->A7 + a->C6, uint));
        a->A6 = (__builtin_astype(a->A6 + a->C5, uint));
        a->A5 = (__builtin_astype(a->A5 + a->C4, uint));
        a->A4 = (__builtin_astype(a->A4 + a->C3, uint));
        a->A3 = (__builtin_astype(a->A3 + a->C2, uint));
        a->A2 = (__builtin_astype(a->A2 + a->C1, uint));
        a->A1 = (__builtin_astype(a->A1 + a->C0, uint));
        a->A0 = (__builtin_astype(a->A0 + a->CF, uint));
        a->AB = (__builtin_astype(a->AB + a->CE, uint));
        a->AA = (__builtin_astype(a->AA + a->CD, uint));
        a->A9 = (__builtin_astype(a->A9 + a->CC, uint));
        a->A8 = (__builtin_astype(a->A8 + a->CB, uint));
        a->A7 = (__builtin_astype(a->A7 + a->CA, uint));
        a->A6 = (__builtin_astype(a->A6 + a->C9, uint));
        a->A5 = (__builtin_astype(a->A5 + a->C8, uint));
        a->A4 = (__builtin_astype(a->A4 + a->C7, uint));
        a->A3 = (__builtin_astype(a->A3 + a->C6, uint));
        a->A2 = (__builtin_astype(a->A2 + a->C5, uint));
        a->A1 = (__builtin_astype(a->A1 + a->C4, uint));
        a->A0 = (__builtin_astype(a->A0 + a->C3, uint));
      } while (0);
    }
  }
}

void C(shabal_context_t* a, unsigned char* b, unsigned int c) {
  unsigned int* d = (unsigned int*)b;
  unsigned int e = c >> 2;
  d[e + 0] = a->B8;
  d[e + 1] = a->B9;
  d[e + 2] = a->BA;
  d[e + 3] = a->BB;
  d[e + 4] = a->BC;
  d[e + 5] = a->BD;
  d[e + 6] = a->BE;
  d[e + 7] = a->BF;
}
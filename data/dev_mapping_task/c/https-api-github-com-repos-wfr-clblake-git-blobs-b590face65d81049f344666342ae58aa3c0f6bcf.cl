typedef unsigned char uint8_t; typedef unsigned short uint16_t; typedef unsigned int uint32_t; typedef unsigned long uint64_t; typedef char int8_t; typedef short int16_t; typedef int int32_t; typedef long int64_t; typedef struct {
  uint32_t h[8];
  uint32_t t;
} state256;

constant uint8_t Ga[][16] = {{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, {14, 10, 4, 8, 9, 15, 13, 6, 1, 12, 0, 2, 11, 7, 5, 3}, {11, 8, 12, 0, 5, 2, 15, 13, 10, 14, 3, 6, 7, 1, 9, 4}, {7, 9, 3, 1, 13, 12, 11, 14, 2, 6, 5, 10, 4, 0, 15, 8}, {9, 0, 5, 7, 2, 4, 10, 15, 14, 1, 11, 12, 6, 8, 3, 13}, {2, 12, 6, 10, 0, 11, 8, 3, 4, 13, 7, 5, 15, 14, 1, 9}, {12, 5, 1, 15, 14, 13, 4, 10, 0, 7, 6, 3, 9, 2, 8, 11}, {13, 11, 7, 14, 12, 1, 3, 9, 5, 0, 15, 4, 8, 6, 2, 10},
                             {6, 15, 14, 9, 11, 3, 0, 8, 12, 2, 13, 7, 1, 4, 10, 5}, {10, 2, 8, 4, 7, 6, 1, 5, 15, 11, 9, 14, 3, 12, 13, 0}, {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}, {14, 10, 4, 8, 9, 15, 13, 6, 1, 12, 0, 2, 11, 7, 5, 3}, {11, 8, 12, 0, 5, 2, 15, 13, 10, 14, 3, 6, 7, 1, 9, 4}, {7, 9, 3, 1, 13, 12, 11, 14, 2, 6, 5, 10, 4, 0, 15, 8}, {9, 0, 5, 7, 2, 4, 10, 15, 14, 1, 11, 12, 6, 8, 3, 13}, {2, 12, 6, 10, 0, 11, 8, 3, 4, 13, 7, 5, 15, 14, 1, 9}};

constant uint32_t Gb[16] = {0x243f6a88, 0x85a308d3, 0x13198a2e, 0x03707344, 0xa4093822, 0x299f31d0, 0x082efa98, 0xec4e6c89, 0x452821e6, 0x38d01377, 0xbe5466cf, 0x34e90c6c, 0xc0ac29b7, 0xc97c50dd, 0x3f84d5b5, 0xb5470917};
void A(private state256* a, global const uint32_t* b) {
 private
  uint32_t c[16], d[16], e;
 private
  uint32_t f[16];

  if (b != 0) {
    for (e = 0; e < 16; ++e)
      f[e] = b[e];
    for (e = 0; e < 16; ++e)
      d[e] = (((uint32_t)(((uint8_t*)&f[e])[0]) << 24) | ((uint32_t)(((uint8_t*)&f[e])[1]) << 16) | ((uint32_t)(((uint8_t*)&f[e])[2]) << 8) | ((uint32_t)(((uint8_t*)&f[e])[3])));
  } else {
    d[0] = 0x80000000;
    d[1] = d[2] = d[3] = d[4] = d[5] = d[6] = d[7] = 0;
    d[8] = d[9] = d[10] = d[11] = d[12] = 0;
    d[13] = 1;
    d[14] = 0;
    d[15] = a->t;
  }

  for (e = 0; e < 8; ++e)
    c[e] = a->h[e];

  c[8] = Gb[0];
  c[9] = Gb[1];
  c[10] = Gb[2];
  c[11] = Gb[3];
  c[12] = Gb[4];
  c[13] = Gb[5];
  c[14] = Gb[6];
  c[15] = Gb[7];

  if (b != 0) {
    c[12] ^= a->t;
    c[13] ^= a->t;
  }

  for (int g = 0; g < 14; ++g) {
    do {
      c[0] += ((uint)((d[Ga[g][0]]) ^ (Gb[Ga[g][0 + 1]]))) + c[4];
      c[12] = (rotate((uint)((uint)((c[12]) ^ (c[0]))), (uint)32 - 16));
      c[8] += c[12];
      c[4] = (rotate((uint)((uint)((c[4]) ^ (c[8]))), (uint)32 - 12));
      c[0] += ((uint)((d[Ga[g][0 + 1]]) ^ (Gb[Ga[g][0]]))) + c[4];
      c[12] = (rotate((uint)((uint)((c[12]) ^ (c[0]))), (uint)32 - 8));
      c[8] += c[12];
      c[4] = (rotate((uint)((uint)((c[4]) ^ (c[8]))), (uint)32 - 7));
    } while (0);
    do {
      c[1] += ((uint)((d[Ga[g][2]]) ^ (Gb[Ga[g][2 + 1]]))) + c[5];
      c[13] = (rotate((uint)((uint)((c[13]) ^ (c[1]))), (uint)32 - 16));
      c[9] += c[13];
      c[5] = (rotate((uint)((uint)((c[5]) ^ (c[9]))), (uint)32 - 12));
      c[1] += ((uint)((d[Ga[g][2 + 1]]) ^ (Gb[Ga[g][2]]))) + c[5];
      c[13] = (rotate((uint)((uint)((c[13]) ^ (c[1]))), (uint)32 - 8));
      c[9] += c[13];
      c[5] = (rotate((uint)((uint)((c[5]) ^ (c[9]))), (uint)32 - 7));
    } while (0);
    do {
      c[2] += ((uint)((d[Ga[g][4]]) ^ (Gb[Ga[g][4 + 1]]))) + c[6];
      c[14] = (rotate((uint)((uint)((c[14]) ^ (c[2]))), (uint)32 - 16));
      c[10] += c[14];
      c[6] = (rotate((uint)((uint)((c[6]) ^ (c[10]))), (uint)32 - 12));
      c[2] += ((uint)((d[Ga[g][4 + 1]]) ^ (Gb[Ga[g][4]]))) + c[6];
      c[14] = (rotate((uint)((uint)((c[14]) ^ (c[2]))), (uint)32 - 8));
      c[10] += c[14];
      c[6] = (rotate((uint)((uint)((c[6]) ^ (c[10]))), (uint)32 - 7));
    } while (0);
    do {
      c[3] += ((uint)((d[Ga[g][6]]) ^ (Gb[Ga[g][6 + 1]]))) + c[7];
      c[15] = (rotate((uint)((uint)((c[15]) ^ (c[3]))), (uint)32 - 16));
      c[11] += c[15];
      c[7] = (rotate((uint)((uint)((c[7]) ^ (c[11]))), (uint)32 - 12));
      c[3] += ((uint)((d[Ga[g][6 + 1]]) ^ (Gb[Ga[g][6]]))) + c[7];
      c[15] = (rotate((uint)((uint)((c[15]) ^ (c[3]))), (uint)32 - 8));
      c[11] += c[15];
      c[7] = (rotate((uint)((uint)((c[7]) ^ (c[11]))), (uint)32 - 7));
    } while (0);

    do {
      c[0] += ((uint)((d[Ga[g][8]]) ^ (Gb[Ga[g][8 + 1]]))) + c[5];
      c[15] = (rotate((uint)((uint)((c[15]) ^ (c[0]))), (uint)32 - 16));
      c[10] += c[15];
      c[5] = (rotate((uint)((uint)((c[5]) ^ (c[10]))), (uint)32 - 12));
      c[0] += ((uint)((d[Ga[g][8 + 1]]) ^ (Gb[Ga[g][8]]))) + c[5];
      c[15] = (rotate((uint)((uint)((c[15]) ^ (c[0]))), (uint)32 - 8));
      c[10] += c[15];
      c[5] = (rotate((uint)((uint)((c[5]) ^ (c[10]))), (uint)32 - 7));
    } while (0);
    do {
      c[1] += ((uint)((d[Ga[g][10]]) ^ (Gb[Ga[g][10 + 1]]))) + c[6];
      c[12] = (rotate((uint)((uint)((c[12]) ^ (c[1]))), (uint)32 - 16));
      c[11] += c[12];
      c[6] = (rotate((uint)((uint)((c[6]) ^ (c[11]))), (uint)32 - 12));
      c[1] += ((uint)((d[Ga[g][10 + 1]]) ^ (Gb[Ga[g][10]]))) + c[6];
      c[12] = (rotate((uint)((uint)((c[12]) ^ (c[1]))), (uint)32 - 8));
      c[11] += c[12];
      c[6] = (rotate((uint)((uint)((c[6]) ^ (c[11]))), (uint)32 - 7));
    } while (0);
    do {
      c[2] += ((uint)((d[Ga[g][12]]) ^ (Gb[Ga[g][12 + 1]]))) + c[7];
      c[13] = (rotate((uint)((uint)((c[13]) ^ (c[2]))), (uint)32 - 16));
      c[8] += c[13];
      c[7] = (rotate((uint)((uint)((c[7]) ^ (c[8]))), (uint)32 - 12));
      c[2] += ((uint)((d[Ga[g][12 + 1]]) ^ (Gb[Ga[g][12]]))) + c[7];
      c[13] = (rotate((uint)((uint)((c[13]) ^ (c[2]))), (uint)32 - 8));
      c[8] += c[13];
      c[7] = (rotate((uint)((uint)((c[7]) ^ (c[8]))), (uint)32 - 7));
    } while (0);
    do {
      c[3] += ((uint)((d[Ga[g][14]]) ^ (Gb[Ga[g][14 + 1]]))) + c[4];
      c[14] = (rotate((uint)((uint)((c[14]) ^ (c[3]))), (uint)32 - 16));
      c[9] += c[14];
      c[4] = (rotate((uint)((uint)((c[4]) ^ (c[9]))), (uint)32 - 12));
      c[3] += ((uint)((d[Ga[g][14 + 1]]) ^ (Gb[Ga[g][14]]))) + c[4];
      c[14] = (rotate((uint)((uint)((c[14]) ^ (c[3]))), (uint)32 - 8));
      c[9] += c[14];
      c[4] = (rotate((uint)((uint)((c[4]) ^ (c[9]))), (uint)32 - 7));
    } while (0);
  }

  for (e = 0; e < 16; ++e)
    a->h[e % 8] ^= c[e];
}

void B(private state256* a) {
  a->h[0] = 0x6a09e667;
  a->h[1] = 0xbb67ae85;
  a->h[2] = 0x3c6ef372;
  a->h[3] = 0xa54ff53a;
  a->h[4] = 0x510e527f;
  a->h[5] = 0x9b05688c;
  a->h[6] = 0x1f83d9ab;
  a->h[7] = 0x5be0cd19;
  a->t = 0;
}

void C(private state256* a, global const uint32_t* b, uint32_t c) {
  while (c >= 64) {
    a->t += 512;
    A(a, b);
    b += 16;
    c -= 64;
  }
}

void D(private state256* a, global uint32_t* b) {
  A(a, 0);

 private
  uint8_t c[32];
  (c + 0)[0] = (uint8_t)((a->h[0]) >> 24);
  (c + 0)[1] = (uint8_t)((a->h[0]) >> 16);
  (c + 0)[2] = (uint8_t)((a->h[0]) >> 8);
  (c + 0)[3] = (uint8_t)((a->h[0]));
  ;
  (c + 4)[0] = (uint8_t)((a->h[1]) >> 24);
  (c + 4)[1] = (uint8_t)((a->h[1]) >> 16);
  (c + 4)[2] = (uint8_t)((a->h[1]) >> 8);
  (c + 4)[3] = (uint8_t)((a->h[1]));
  ;
  (c + 8)[0] = (uint8_t)((a->h[2]) >> 24);
  (c + 8)[1] = (uint8_t)((a->h[2]) >> 16);
  (c + 8)[2] = (uint8_t)((a->h[2]) >> 8);
  (c + 8)[3] = (uint8_t)((a->h[2]));
  ;
  (c + 12)[0] = (uint8_t)((a->h[3]) >> 24);
  (c + 12)[1] = (uint8_t)((a->h[3]) >> 16);
  (c + 12)[2] = (uint8_t)((a->h[3]) >> 8);
  (c + 12)[3] = (uint8_t)((a->h[3]));
  ;
  (c + 16)[0] = (uint8_t)((a->h[4]) >> 24);
  (c + 16)[1] = (uint8_t)((a->h[4]) >> 16);
  (c + 16)[2] = (uint8_t)((a->h[4]) >> 8);
  (c + 16)[3] = (uint8_t)((a->h[4]));
  ;
  (c + 20)[0] = (uint8_t)((a->h[5]) >> 24);
  (c + 20)[1] = (uint8_t)((a->h[5]) >> 16);
  (c + 20)[2] = (uint8_t)((a->h[5]) >> 8);
  (c + 20)[3] = (uint8_t)((a->h[5]));
  ;
  (c + 24)[0] = (uint8_t)((a->h[6]) >> 24);
  (c + 24)[1] = (uint8_t)((a->h[6]) >> 16);
  (c + 24)[2] = (uint8_t)((a->h[6]) >> 8);
  (c + 24)[3] = (uint8_t)((a->h[6]));
  ;
  (c + 28)[0] = (uint8_t)((a->h[7]) >> 24);
  (c + 28)[1] = (uint8_t)((a->h[7]) >> 16);
  (c + 28)[2] = (uint8_t)((a->h[7]) >> 8);
  (c + 28)[3] = (uint8_t)((a->h[7]));
  ;

  for (int d = 0; d < 8; d++) {
    b[d] = ((uint32_t*)c)[d];
  }
}

kernel void E(global uint8_t* a, global const uint8_t* b, const uint32_t c) {
  const int d = get_global_id(0);
  const int e = get_local_id(0);

  global uint8_t* f = &(b[d * c]);
  global uint8_t* g = &(a[d * 32]);
 private
  state256 h;

  B(&h);
  C(&h, f, c);
  D(&h, g);
}
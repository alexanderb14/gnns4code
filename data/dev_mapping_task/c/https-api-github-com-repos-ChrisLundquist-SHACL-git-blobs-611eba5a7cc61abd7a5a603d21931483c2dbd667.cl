typedef struct SHA1Context {
  unsigned Message_Digest[5];

  unsigned Length_Low;
  unsigned Length_High;

  unsigned char Message_Block[64];
  int Message_Block_Index;

  int Computed;
  int Corrupted;
} SHA1Context;

void A(SHA1Context*);
void B(SHA1Context*);
void C(SHA1Context*);
int D(SHA1Context* a);
void E(SHA1Context*, const unsigned char*, unsigned);

void C(SHA1Context* a) {
  a->Length_Low = 0;
  a->Length_High = 0;
  a->Message_Block_Index = 0;

  a->Message_Digest[0] = 0x67452301;
  a->Message_Digest[1] = 0xEFCDAB89;
  a->Message_Digest[2] = 0x98BADCFE;
  a->Message_Digest[3] = 0x10325476;
  a->Message_Digest[4] = 0xC3D2E1F0;

  a->Computed = 0;
  a->Corrupted = 0;
}

int D(SHA1Context* a) {
  if (a->Corrupted) {
    return 0;
  }

  if (!a->Computed) {
    B(a);
    a->Computed = 1;
  }

  return 1;
}

void E(SHA1Context* a, const unsigned char* b, unsigned c) {
  if (!c) {
    return;
  }

  if (a->Computed || a->Corrupted) {
    a->Corrupted = 1;
    return;
  }

  while (c-- && !a->Corrupted) {
    a->Message_Block[a->Message_Block_Index++] = (*b & 0xFF);

    a->Length_Low += 8;

    a->Length_Low &= 0xFFFFFFFF;
    if (a->Length_Low == 0) {
      a->Length_High++;

      a->Length_High &= 0xFFFFFFFF;
      if (a->Length_High == 0) {
        a->Corrupted = 1;
      }
    }

    if (a->Message_Block_Index == 64) {
      A(a);
    }

    b++;
  }
}

void A(SHA1Context* a) {
  const unsigned b[] = {0x5A827999, 0x6ED9EBA1, 0x8F1BBCDC, 0xCA62C1D6};
  int c;
  unsigned d;
  unsigned e[80];
  unsigned f, g, h, i, j;

  for (c = 0; c < 16; c++) {
    e[c] = ((unsigned)a->Message_Block[c * 4]) << 24;
    e[c] |= ((unsigned)a->Message_Block[c * 4 + 1]) << 16;
    e[c] |= ((unsigned)a->Message_Block[c * 4 + 2]) << 8;
    e[c] |= ((unsigned)a->Message_Block[c * 4 + 3]);
  }

  for (c = 16; c < 80; c++) {
    e[c] = ((((e[c - 3] ^ e[c - 8] ^ e[c - 14] ^ e[c - 16]) << (1)) & 0xFFFFFFFF) | ((e[c - 3] ^ e[c - 8] ^ e[c - 14] ^ e[c - 16]) >> (32 - (1))));
  }

  f = a->Message_Digest[0];
  g = a->Message_Digest[1];
  h = a->Message_Digest[2];
  i = a->Message_Digest[3];
  j = a->Message_Digest[4];

  for (c = 0; c < 20; c++) {
    d = ((((f) << (5)) & 0xFFFFFFFF) | ((f) >> (32 - (5)))) + ((g & h) | ((~g) & i)) + j + e[c] + b[0];
    d &= 0xFFFFFFFF;
    j = i;
    i = h;
    h = ((((g) << (30)) & 0xFFFFFFFF) | ((g) >> (32 - (30))));
    g = f;
    f = d;
  }

  for (c = 20; c < 40; c++) {
    d = ((((f) << (5)) & 0xFFFFFFFF) | ((f) >> (32 - (5)))) + (g ^ h ^ i) + j + e[c] + b[1];
    d &= 0xFFFFFFFF;
    j = i;
    i = h;
    h = ((((g) << (30)) & 0xFFFFFFFF) | ((g) >> (32 - (30))));
    g = f;
    f = d;
  }

  for (c = 40; c < 60; c++) {
    d = ((((f) << (5)) & 0xFFFFFFFF) | ((f) >> (32 - (5)))) + ((g & h) | (g & i) | (h & i)) + j + e[c] + b[2];
    d &= 0xFFFFFFFF;
    j = i;
    i = h;
    h = ((((g) << (30)) & 0xFFFFFFFF) | ((g) >> (32 - (30))));
    g = f;
    f = d;
  }

  for (c = 60; c < 80; c++) {
    d = ((((f) << (5)) & 0xFFFFFFFF) | ((f) >> (32 - (5)))) + (g ^ h ^ i) + j + e[c] + b[3];
    d &= 0xFFFFFFFF;
    j = i;
    i = h;
    h = ((((g) << (30)) & 0xFFFFFFFF) | ((g) >> (32 - (30))));
    g = f;
    f = d;
  }

  a->Message_Digest[0] = (a->Message_Digest[0] + f) & 0xFFFFFFFF;
  a->Message_Digest[1] = (a->Message_Digest[1] + g) & 0xFFFFFFFF;
  a->Message_Digest[2] = (a->Message_Digest[2] + h) & 0xFFFFFFFF;
  a->Message_Digest[3] = (a->Message_Digest[3] + i) & 0xFFFFFFFF;
  a->Message_Digest[4] = (a->Message_Digest[4] + j) & 0xFFFFFFFF;

  a->Message_Block_Index = 0;
}

void B(SHA1Context* a) {
  a->Message_Block[a->Message_Block_Index++] = 0x80;
  if (a->Message_Block_Index > 55) {
    while (a->Message_Block_Index < 64) {
      a->Message_Block[a->Message_Block_Index++] = 0;
    }

    A(a);
  }
  while (a->Message_Block_Index < 56) {
    a->Message_Block[a->Message_Block_Index++] = 0;
  }

  a->Message_Block[56] = (a->Length_High >> 24) & 0xFF;
  a->Message_Block[57] = (a->Length_High >> 16) & 0xFF;
  a->Message_Block[58] = (a->Length_High >> 8) & 0xFF;
  a->Message_Block[59] = (a->Length_High) & 0xFF;
  a->Message_Block[60] = (a->Length_Low >> 24) & 0xFF;
  a->Message_Block[61] = (a->Length_Low >> 16) & 0xFF;
  a->Message_Block[62] = (a->Length_Low >> 8) & 0xFF;
  a->Message_Block[63] = (a->Length_Low) & 0xFF;

  A(a);
}

int F(const unsigned int a[5], constant unsigned int b[5]) {
  return a[0] == b[0] && a[1] == b[1] && a[2] == b[2] && a[3] == b[3] && a[4] == b[4];
}

int G(const char* a, char* b) {
  int c = 0;
  while (b[c] = a[c++]) {
  }
  return c;
}

__kernel void H(constant unsigned const char* a, uint b, constant unsigned int c[5], global char* d) {
  uint e = get_global_id(0);

  unsigned char f[16];
  for (int g = 0; g < b; g++)
    f[g] = a[g];

  struct SHA1Context h;

  E(&h, &f, b);
  D(&h);

  for (int g = 0; g < 6; g++)
    d[g] = h.Message_Digest[g];
}
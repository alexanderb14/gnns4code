typedef struct {
  int length;
  unsigned char significantBits;
  unsigned char codingPasses;
  unsigned char width;
  unsigned char nominalWidth;
  unsigned char height;
  unsigned char nominalHeight;
  unsigned char stripeNo;
  unsigned char magbits;
  unsigned char subband;
  unsigned char compType;
  unsigned char dwtLevel;
  float stepSize;

  int magconOffset;

  int gpuCoefficientsOffset;
  int gpuCodestreamOffset;
  int gpuSTBufferOffset;
} CodeBlockAdditionalInfo;

typedef struct MQEncoder {
  short L;

  unsigned short A;
  unsigned int C;
  unsigned char CT;
  unsigned char T;

  __global unsigned char* outbuf;

  int CXMPS;
  unsigned char CX;

  unsigned int Ib0;
  unsigned int Ib1;
  unsigned int Ib2;
  unsigned int Ib3;
  unsigned int Ib4;
  unsigned int Ib5;
} MQEncoder;

typedef struct MQDecoder {
  MQEncoder encoder;
  unsigned char NT;
  int Lmax;
} MQDecoder;

__constant const unsigned short Ga[] = {0x5601, 0x3401, 0x1801, 0x0AC1, 0x0521, 0x0221, 0x5601, 0x5401, 0x4801, 0x3801, 0x3001, 0x2401, 0x1C01, 0x1601, 0x5601, 0x5401, 0x5101, 0x4801, 0x3801, 0x3401, 0x3001, 0x2801, 0x2401, 0x2201, 0x1C01, 0x1801, 0x1601, 0x1401, 0x1201, 0x1101, 0x0AC1, 0x09C1, 0x08A1, 0x0521, 0x0441, 0x02A1, 0x0221, 0x0141, 0x0111, 0x0085, 0x0049, 0x0025, 0x0015, 0x0009, 0x0005, 0x0001, 0x5601};

__constant const unsigned char Gb[] = {1, 2, 3, 4, 5, 38, 7, 8, 9, 10, 11, 12, 13, 29, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 45, 46};

__constant const unsigned char Gc[] = {1, 6, 9, 12, 29, 33, 6, 14, 14, 14, 17, 18, 20, 21, 14, 14, 15, 16, 17, 18, 19, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 46};

__constant const unsigned char Gd[] = {1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
unsigned char A(MQEncoder* a, int b) {
  unsigned char c = 0;

  c |= ((a->Ib0 >> b) & 1);
  c |= ((a->Ib1 >> b) & 1) << 1;
  c |= ((a->Ib2 >> b) & 1) << 2;
  c |= ((a->Ib3 >> b) & 1) << 3;
  c |= ((a->Ib4 >> b) & 1) << 4;
  c |= ((a->Ib5 >> b) & 1) << 5;

  return c;
}

void B(MQEncoder* a, int b, unsigned char c) {
  unsigned int d = ~(1 << b);

  a->Ib0 = (a->Ib0 & d) | (((c)&1) << b);
  a->Ib1 = (a->Ib1 & d) | (((c >> 1) & 1) << b);
  a->Ib2 = (a->Ib2 & d) | (((c >> 2) & 1) << b);
  a->Ib3 = (a->Ib3 & d) | (((c >> 3) & 1) << b);
  a->Ib4 = (a->Ib4 & d) | (((c >> 4) & 1) << b);
  a->Ib5 = (a->Ib5 & d) | (((c >> 5) & 1) << b);
}

void C(int a, int b) {
  a = (a ^ (1 << b));
}

short D(int a, int b) {
  return (a >> b) & 1;
}

void E(MQDecoder* a) {
  a->encoder.Ib0 = 0;
  a->encoder.Ib1 = 0;
  a->encoder.Ib2 = 0;
  a->encoder.Ib3 = 0;
  a->encoder.Ib4 = 0;
  a->encoder.Ib5 = 0;

  B(&a->encoder, 17, 46);
  B(&a->encoder, 18, 3);
  B(&a->encoder, 0, 4);

  a->encoder.CXMPS = 0;
}

void F(MQDecoder* a) {
  a->encoder.CT = 8;
  if (a->encoder.L == a->Lmax - 1 || (a->encoder.T == (unsigned char)0xFF && a->NT > (unsigned char)0x8F))
    a->encoder.C += 0xFF00;
  else {
    if (a->encoder.T == (unsigned char)0xFF)
      a->encoder.CT = 7;

    a->encoder.T = a->NT;
    a->NT = a->encoder.outbuf[a->encoder.L + 1];
    a->encoder.L++;
    a->encoder.C += a->encoder.T << (16 - a->encoder.CT);
  }
}

void G(MQDecoder* a) {
  do {
    if (a->encoder.CT == 0)
      F(a);

    a->encoder.A <<= 1;
    a->encoder.C <<= 1;
    a->encoder.CT -= 1;
  } while ((a->encoder.A & 0x8000) == 0);
}

int H(MQDecoder* a) {
  int b;
  unsigned int c = Ga[A(&a->encoder, a->encoder.CX)];

  if (a->encoder.A < c) {
    a->encoder.A = c;
    b = D(a->encoder.CXMPS, a->encoder.CX);
    B(&a->encoder, a->encoder.CX, Gb[A(&a->encoder, a->encoder.CX)]);
  } else {
    a->encoder.A = c;
    b = 1 - D(a->encoder.CXMPS, a->encoder.CX);

    if (Gd[A(&a->encoder, a->encoder.CX)])
      C(a->encoder.CXMPS, a->encoder.CX);

    B(&a->encoder, a->encoder.CX, Gc[A(&a->encoder, a->encoder.CX)]);
  }

  return b;
}

int I(MQDecoder* a) {
  int b;
  unsigned int c = Ga[A(&a->encoder, a->encoder.CX)];

  if (a->encoder.A < c) {
    b = 1 - D(a->encoder.CXMPS, a->encoder.CX);

    if (Gd[A(&a->encoder, a->encoder.CX)])
      C(a->encoder.CXMPS, a->encoder.CX);

    B(&a->encoder, a->encoder.CX, Gc[A(&a->encoder, a->encoder.CX)]);
  } else {
    b = D(a->encoder.CXMPS, a->encoder.CX);
    B(&a->encoder, a->encoder.CX, Gb[A(&a->encoder, a->encoder.CX)]);
  }

  return b;
}

void J(MQDecoder* a, __global unsigned char* b, int c) {
  a->encoder.outbuf = b;

  a->encoder.L = -1;
  a->Lmax = c;
  a->encoder.T = 0;
  a->NT = 0;

  F(a);
  F(a);

  a->encoder.C = ((unsigned char)a->encoder.T) << 16;

  F(a);

  a->encoder.C <<= 7;
  a->encoder.CT -= 7;
  a->encoder.A = 0x8000;
}

int K(MQDecoder* a, int b) {
  a->encoder.CX = b;

  unsigned int c = Ga[A(&a->encoder, a->encoder.CX)];
  int d;
  a->encoder.A -= c;

  if ((a->encoder.C >> 16) < c) {
    d = H(a);
    G(a);
  } else {
    a->encoder.C = (a->encoder.C & 0x0000FFFF) | (((a->encoder.C >> 16) - c) << 16);

    if ((a->encoder.A & 0x8000) == 0) {
      d = I(a);
      G(a);
    } else {
      d = D(a->encoder.CXMPS, a->encoder.CX);
    }
  }
  return d;
}

void L(unsigned int a, unsigned int b, unsigned int c) {
  a = (a & ~b) | (c & b);
}

void M(unsigned int a, unsigned int b) {
  L(a, 1 << b, 1 << b);
}

void N(unsigned int a, unsigned int b) {
  L(a, 1 << b, 0);
}

typedef struct {
  unsigned int tl;
  unsigned int t;
  unsigned int tr;

  unsigned int l;
  unsigned int c;
  unsigned int r;

  unsigned int bl;
  unsigned int b;
  unsigned int br;

  short pos;
} CtxWindow;

void O(float* a, int b) {
}

void P(CodeBlockAdditionalInfo a, CtxWindow* b, __global unsigned int* c) {
  b->tr = c[b->pos + 1 - a.width];
  b->r = c[b->pos + 1];
  b->br = c[b->pos + 1 + a.width];
}

void Q(CtxWindow* a, __global unsigned int* b) {
  b[a->pos - 1] = a->l;
}

void R(CtxWindow* a) {
  a->tl = a->t;
  a->t = a->tr;
  a->tr = 0;
  a->l = a->c;
  a->c = a->r;
  a->r = 0;
  a->bl = a->b;
  a->b = a->br;
  a->br = 0;
  a->pos += 1;
}

typedef int CtxReg;

CtxReg S(CtxWindow* a, unsigned char b) {
  CtxReg c = 0;

  c |= ((a->tl >> (b + 9)) & 1) << 0;
  c |= ((a->t >> (b + 9)) & 1) << 1;
  c |= ((a->tr >> (b + 9)) & 1) << 2;
  c |= ((a->l >> (b)) & 0x249) << 3;
  c |= ((a->c >> (b)) & 0x249) << 4;
  c |= ((a->r >> (b)) & 0x249) << 5;
  c |= ((a->bl >> (b)) & 1) << 15;
  c |= ((a->b >> (b)) & 1) << 16;
  c |= ((a->br >> (b)) & 1) << 17;

  return c;
}

__constant unsigned char Ge[3][512] = {{0, 1, 3, 3, 1, 2, 3, 3, 5, 6, 7, 7, 6, 6, 7, 7, 0, 1, 3, 3, 1, 2, 3, 3, 5, 6, 7, 7, 6, 6, 7, 7, 5, 6, 7, 7, 6, 6, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 5, 6, 7, 7, 6, 6, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 1, 2, 3, 3, 2, 2, 3, 3, 6, 6, 7, 7, 6, 6, 7, 7, 1, 2, 3, 3, 2, 2, 3, 3, 6, 6, 7, 7, 6, 6, 7, 7, 6, 6, 7, 7, 6, 6, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 6, 6, 7, 7, 6, 6, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8,
                                        3, 3, 4, 4, 3, 3, 4, 4, 7, 7, 7, 7, 7, 7, 7, 7, 3, 3, 4, 4, 3, 3, 4, 4, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 3, 3, 4, 4, 3, 3, 4, 4, 7, 7, 7, 7, 7, 7, 7, 7, 3, 3, 4, 4, 3, 3, 4, 4, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8,
                                        1, 2, 3, 3, 2, 2, 3, 3, 6, 6, 7, 7, 6, 6, 7, 7, 1, 2, 3, 3, 2, 2, 3, 3, 6, 6, 7, 7, 6, 6, 7, 7, 6, 6, 7, 7, 6, 6, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 6, 6, 7, 7, 6, 6, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 2, 2, 3, 3, 2, 2, 3, 3, 6, 6, 7, 7, 6, 6, 7, 7, 2, 2, 3, 3, 2, 2, 3, 3, 6, 6, 7, 7, 6, 6, 7, 7, 6, 6, 7, 7, 6, 6, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 6, 6, 7, 7, 6, 6, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8,
                                        3, 3, 4, 4, 3, 3, 4, 4, 7, 7, 7, 7, 7, 7, 7, 7, 3, 3, 4, 4, 3, 3, 4, 4, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 3, 3, 4, 4, 3, 3, 4, 4, 7, 7, 7, 7, 7, 7, 7, 7, 3, 3, 4, 4, 3, 3, 4, 4, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8},
                                       {0, 1, 5, 6, 1, 2, 6, 6, 3, 3, 7, 7, 3, 3, 7, 7, 0, 1, 5, 6, 1, 2, 6, 6, 3, 3, 7, 7, 3, 3, 7, 7, 3, 3, 7, 7, 3, 3, 7, 7, 4, 4, 7, 7, 4, 4, 7, 7, 3, 3, 7, 7, 3, 3, 7, 7, 4, 4, 7, 7, 4, 4, 7, 7, 1, 2, 6, 6, 2, 2, 6, 6, 3, 3, 7, 7, 3, 3, 7, 7, 1, 2, 6, 6, 2, 2, 6, 6, 3, 3, 7, 7, 3, 3, 7, 7, 3, 3, 7, 7, 3, 3, 7, 7, 4, 4, 7, 7, 4, 4, 7, 7, 3, 3, 7, 7, 3, 3, 7, 7, 4, 4, 7, 7, 4, 4, 7, 7,
                                        5, 6, 8, 8, 6, 6, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 5, 6, 8, 8, 6, 6, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 6, 6, 8, 8, 6, 6, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 6, 6, 8, 8, 6, 6, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8,
                                        1, 2, 6, 6, 2, 2, 6, 6, 3, 3, 7, 7, 3, 3, 7, 7, 1, 2, 6, 6, 2, 2, 6, 6, 3, 3, 7, 7, 3, 3, 7, 7, 3, 3, 7, 7, 3, 3, 7, 7, 4, 4, 7, 7, 4, 4, 7, 7, 3, 3, 7, 7, 3, 3, 7, 7, 4, 4, 7, 7, 4, 4, 7, 7, 2, 2, 6, 6, 2, 2, 6, 6, 3, 3, 7, 7, 3, 3, 7, 7, 2, 2, 6, 6, 2, 2, 6, 6, 3, 3, 7, 7, 3, 3, 7, 7, 3, 3, 7, 7, 3, 3, 7, 7, 4, 4, 7, 7, 4, 4, 7, 7, 3, 3, 7, 7, 3, 3, 7, 7, 4, 4, 7, 7, 4, 4, 7, 7,
                                        6, 6, 8, 8, 6, 6, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 6, 6, 8, 8, 6, 6, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 6, 6, 8, 8, 6, 6, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 6, 6, 8, 8, 6, 6, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8, 7, 7, 8, 8},
                                       {0, 3, 1, 4, 3, 6, 4, 7, 1, 4, 2, 5, 4, 7, 5, 7, 0, 3, 1, 4, 3, 6, 4, 7, 1, 4, 2, 5, 4, 7, 5, 7, 1, 4, 2, 5, 4, 7, 5, 7, 2, 5, 2, 5, 5, 7, 5, 7, 1, 4, 2, 5, 4, 7, 5, 7, 2, 5, 2, 5, 5, 7, 5, 7, 3, 6, 4, 7, 6, 8, 7, 8, 4, 7, 5, 7, 7, 8, 7, 8, 3, 6, 4, 7, 6, 8, 7, 8, 4, 7, 5, 7, 7, 8, 7, 8, 4, 7, 5, 7, 7, 8, 7, 8, 5, 7, 5, 7, 7, 8, 7, 8, 4, 7, 5, 7, 7, 8, 7, 8, 5, 7, 5, 7, 7, 8, 7, 8,
                                        1, 4, 2, 5, 4, 7, 5, 7, 2, 5, 2, 5, 5, 7, 5, 7, 1, 4, 2, 5, 4, 7, 5, 7, 2, 5, 2, 5, 5, 7, 5, 7, 2, 5, 2, 5, 5, 7, 5, 7, 2, 5, 2, 5, 5, 7, 5, 7, 2, 5, 2, 5, 5, 7, 5, 7, 2, 5, 2, 5, 5, 7, 5, 7, 4, 7, 5, 7, 7, 8, 7, 8, 5, 7, 5, 7, 7, 8, 7, 8, 4, 7, 5, 7, 7, 8, 7, 8, 5, 7, 5, 7, 7, 8, 7, 8, 5, 7, 5, 7, 7, 8, 7, 8, 5, 7, 5, 7, 7, 8, 7, 8, 5, 7, 5, 7, 7, 8, 7, 8, 5, 7, 5, 7, 7, 8, 7, 8,
                                        3, 6, 4, 7, 6, 8, 7, 8, 4, 7, 5, 7, 7, 8, 7, 8, 3, 6, 4, 7, 6, 8, 7, 8, 4, 7, 5, 7, 7, 8, 7, 8, 4, 7, 5, 7, 7, 8, 7, 8, 5, 7, 5, 7, 7, 8, 7, 8, 4, 7, 5, 7, 7, 8, 7, 8, 5, 7, 5, 7, 7, 8, 7, 8, 6, 8, 7, 8, 8, 8, 8, 8, 7, 8, 7, 8, 8, 8, 8, 8, 6, 8, 7, 8, 8, 8, 8, 8, 7, 8, 7, 8, 8, 8, 8, 8, 7, 8, 7, 8, 8, 8, 8, 8, 7, 8, 7, 8, 8, 8, 8, 8, 7, 8, 7, 8, 8, 8, 8, 8, 7, 8, 7, 8, 8, 8, 8, 8,
                                        4, 7, 5, 7, 7, 8, 7, 8, 5, 7, 5, 7, 7, 8, 7, 8, 4, 7, 5, 7, 7, 8, 7, 8, 5, 7, 5, 7, 7, 8, 7, 8, 5, 7, 5, 7, 7, 8, 7, 8, 5, 7, 5, 7, 7, 8, 7, 8, 5, 7, 5, 7, 7, 8, 7, 8, 5, 7, 5, 7, 7, 8, 7, 8, 7, 8, 7, 8, 8, 8, 8, 8, 7, 8, 7, 8, 8, 8, 8, 8, 7, 8, 7, 8, 8, 8, 8, 8, 7, 8, 7, 8, 8, 8, 8, 8, 7, 8, 7, 8, 8, 8, 8, 8, 7, 8, 7, 8, 8, 8, 8, 8, 7, 8, 7, 8, 8, 8, 8, 8, 7, 8, 7, 8, 8, 8, 8, 8}};

unsigned char T(CtxReg a, unsigned char b, unsigned char c) {
  return Ge[c][(a >> (3 * b)) & 0x1FF];
}
__constant unsigned char Gf[256] = {9,  9,  10, 26, 9,  9,  10, 26, 12, 12, 13, 11, 28, 28, 27, 29, 9,  9,  10, 26, 9,  9,  10, 26, 12, 12, 13, 11, 28, 28, 27, 29, 12, 12, 13, 11, 12, 12, 13, 11, 12, 12, 13, 11, 9,  9,  10, 26, 28, 28, 27, 29, 28, 28, 27, 29, 9,  9,  10, 26, 28, 28, 27, 29, 9,  9,  10, 26, 9,  9,  10, 26, 12, 12, 13, 11, 28, 28, 27, 29, 9,  9,  10, 26, 9,  9,
                                    10, 26, 12, 12, 13, 11, 28, 28, 27, 29, 12, 12, 13, 11, 12, 12, 13, 11, 12, 12, 13, 11, 9,  9,  10, 26, 28, 28, 27, 29, 28, 28, 27, 29, 9,  9,  10, 26, 28, 28, 27, 29, 10, 10, 10, 9,  10, 10, 10, 9,  13, 13, 13, 12, 27, 27, 27, 28, 10, 10, 10, 9,  10, 10, 10, 9,  13, 13, 13, 12, 27, 27, 27, 28, 13, 13, 13, 12, 13, 13, 13, 12, 13, 13, 13, 12,
                                    10, 10, 10, 9,  27, 27, 27, 28, 27, 27, 27, 28, 10, 10, 10, 9,  27, 27, 27, 28, 26, 26, 9,  26, 26, 26, 9,  26, 11, 11, 12, 11, 29, 29, 28, 29, 26, 26, 9,  26, 26, 26, 9,  26, 11, 11, 12, 11, 29, 29, 28, 29, 11, 11, 12, 11, 11, 11, 12, 11, 11, 11, 12, 11, 26, 26, 9,  26, 29, 29, 28, 29, 29, 29, 28, 29, 26, 26, 9,  26, 29, 29, 28, 29};

unsigned char U(CtxReg a, CtxReg b, unsigned char c) {
  return Gf[((a >> (c * 3)) & 0xAA) | (((b >> (c * 3)) & 0xAA) >> 1)];
}

unsigned char V(CtxReg a, unsigned int b, unsigned char c) {
  if ((b >> (12 + 3 * c)) & 1)
    return 16;
  else if (((a >> (3 * c)) & 0x1EF) == 0)
    return 14;
  else
    return 15;
}

__constant float Gg[2][4][4] = {{

                                    {0.1000f, 0.1000f, 0.0500f, 1.0000f}, {0.2000f, 0.2000f, 0.1000f, 1.0000f}, {0.4000f, 0.4000f, 0.2000f, 1.0000f}, {0.8000f, 0.8000f, 0.4000f, 1.0000f}},
                                {

                                    {0.0100f, 0.0100f, 0.0050f, 1.0000f}, {0.2000f, 0.2000f, 0.1000f, 1.0000f}, {0.4000f, 0.4000f, 0.2000f, 1.0000f}, {0.8000f, 0.8000f, 0.4000f, 1.0000f}}};

float W(CodeBlockAdditionalInfo a) {
  return Gg[a.compType][((a.dwtLevel) < (3) ? (a.dwtLevel) : (3))][a.subband] * a.stepSize * a.stepSize / ((float)(a.width * a.height));
}

char X(CtxWindow* a, MQDecoder* b) {
  char c = 0;

  if (K(b, 18) == 0) {
    c = -2;
  } else {
    c = K(b, 17) & 1;
    c <<= 1;
    c |= K(b, 17) & 1;

    a->c |= 1 << (3 * c);
  }

  return c;
}

void Y(CtxWindow* a, CtxReg b, MQDecoder* c, int d, int e) {
  a->c |= K(c, T(b, d, e)) << (3 * d);
}

void Z(CtxWindow* a, CtxReg b, MQDecoder* c, int d) {
  unsigned char e = U(b, S(a, 13), d);

  a->c |= (K(c, e & 0xF) ^ ((e >> 4) & 1) & 1) << (13 + 3 * d);
}

void AA(const CodeBlockAdditionalInfo a, CtxWindow* b, MQDecoder* c, float* d, unsigned char e) {
  char f;

  CtxReg g = S(b, 1);

  f = -1;
  if ((b->c & (0x249 << 14)) == 0 && g == 0) {
    f = X(b, c);
    if (f == -2)
      return;
  }

  for (int h = 0; h < 4; h++) {
    if (

        ((b->c >> (3 * h)) & 0x4006) == 0) {
      if (f >= 0)
        f--;
      else
        Y(b, g, c, h, a.subband);

      if ((b->c >> (3 * h)) & 1) {
        *d -= (float)((1 << e) * (1 << e));

        M(b->c, 1 + 3 * h);
        g = S(b, 1);

        Z(b, g, c, h);
      }
    }
  }
}

void AB(const CodeBlockAdditionalInfo a, CtxWindow* b, MQDecoder* c, float* d, unsigned char e) {
  CtxReg f = S(b, 1);

  for (int g = 0; g < 4; g++) {
    if (

        (((b->c >> (3 * g)) & 0x4002) == 0) && ((f >> (3 * g)) & 0x1EF) != 0) {
      Y(b, f, c, g, a.subband);

      if ((b->c >> (3 * g)) & 1) {
        *d -= (float)((1 << e) * (1 << e));

        M(b->c, 1 + (3 * g));
        f = S(b, 1);

        Z(b, f, c, g);
      }

      M(b->c, 2 + (3 * g));
    } else

      N(b->c, 2 + (3 * g));
  }
}

void AC(const CodeBlockAdditionalInfo a, CtxWindow* b, MQDecoder* c, float* d, unsigned char e) {
  for (int f = 0; f < 4; f++) {
    if (((b->c >> (3 * f)) & 0x4006) == 0x2) {
      *d -= (float)((1 << e) * (1 << e));

      b->c |= (K(c, V(S(b, 1), b->c, f)) << (3 * f));
      M(b->c, 3 * f + 12);
    }
  }
}

void AD(const CodeBlockAdditionalInfo a, __global unsigned int* b, __global int* c) {
  int d = sizeof(int) * a.nominalWidth * a.nominalHeight;
  for (int e = 0; e < a.width; e++)
    for (int f = 0; f < a.stripeNo; f++) {
      unsigned int g = 0;

      for (int h = 0; h < 4; h++)
        if (4 * f + h < a.height) {
          int i = (4 * f + h) * a.nominalWidth + e;
          if (i < d)
            c[i] = 0;
        }

        else
          g |= (1 << (14 + 3 * h));

      b[f * a.width + e] = g;
    }
}

void AE(const CodeBlockAdditionalInfo a, __global unsigned int* b, __global int* c) {
  unsigned char d = sizeof(int) * 8 - 1;

  for (int e = 0; e < a.width; e++)
    for (int f = 0; f < a.stripeNo; f++) {
      unsigned int g = b[f * a.width + e];

      for (int h = 0; h < 4; h++)
        if (((g >> (14 + 3 * h)) & 1) == 0)
          c[(4 * f + h) * a.nominalWidth + e] |= (((g >> (13 + 3 * h)) & 1) << d);

      b[f * a.width + e] = g;
    }
}

void AF(const CodeBlockAdditionalInfo a, __global unsigned int* b, int c, __global int* d) {
  for (int e = 0; e < a.width; e++)
    for (int f = 0; f < a.stripeNo; f++) {
      unsigned int g = b[f * a.width + e];

      g &= ~(0x249 | (0x249 << 2));

      for (int h = 0; h < 4; h++)
        if (((g >> (14 + 3 * h)) & 1) == 0)
          g |= ((d[(4 * f + h) * a.nominalWidth + e] >> c) & 1) << (3 * h);

      b[f * a.width + e] = g;
    }
}

void AG(const CodeBlockAdditionalInfo a, __global unsigned int* b, int c, __global int* d) {
  for (int e = 0; e < a.width; e++)
    for (int f = 0; f < a.stripeNo; f++) {
      unsigned int g = b[f * a.width + e];

      for (int h = 0; h < 4; h++)
        if (((g >> (14 + 3 * h)) & 1) == 0)
          d[(4 * f + h) * a.nominalWidth + e] |= (((g >> (3 * h)) & 1) << c);

      g &= ~(0x249 | (0x249 << 2));

      b[f * a.width + e] = g;
    }
}

void AH(CtxWindow* a) {
  a->bl = 0;
  a->b = 0;
  a->br = 0;

  a->l = 0;
  a->c = 0;
  a->r = 0;

  a->tl = 0;
  a->t = 0;
  a->tr = 0;
}

void AI(CodeBlockAdditionalInfo a, __global unsigned int* b, MQDecoder* c, float* d, unsigned char e) {
  CtxWindow f;
  f.pos = -1;

  for (int g = 0; g < a.stripeNo; g++) {
    AH(&f);
    P(a, &f, b);
    R(&f);
    P(a, &f, b);

    AA(a, &f, c, d, e);

    for (int h = 0; h < a.width - 2; h++) {
      R(&f);
      P(a, &f, b);
      AA(a, &f, c, d, e);
      Q(&f, b);
    }

    R(&f);
    AA(a, &f, c, d, e);
    Q(&f, b);
    R(&f);
    Q(&f, b);

    f.pos--;
  }
}

void AJ(CodeBlockAdditionalInfo a, __global unsigned int* b, MQDecoder* c, float* d, unsigned char e) {
  CtxWindow f;
  f.pos = -1;

  for (int g = 0; g < a.stripeNo; g++) {
    AH(&f);
    P(a, &f, b);
    R(&f);
    P(a, &f, b);

    AC(a, &f, c, d, e);

    for (int h = 0; h < a.width - 2; h++) {
      R(&f);
      P(a, &f, b);
      AC(a, &f, c, d, e);
      Q(&f, b);
    }

    R(&f);
    AC(a, &f, c, d, e);
    Q(&f, b);
    R(&f);
    Q(&f, b);

    f.pos--;
  }
}

void AK(CodeBlockAdditionalInfo a, __global unsigned int* b, MQDecoder* c, float* d, unsigned char e) {
  CtxWindow f;
  f.pos = -1;

  for (int g = 0; g < a.stripeNo; g++) {
    AH(&f);
    P(a, &f, b);
    R(&f);
    P(a, &f, b);

    AB(a, &f, c, d, e);

    for (int h = 0; h < a.width - 2; h++) {
      R(&f);
      P(a, &f, b);
      AB(a, &f, c, d, e);
      Q(&f, b);
    }

    R(&f);
    AB(a, &f, c, d, e);
    Q(&f, b);
    R(&f);
    Q(&f, b);

    f.pos--;
  }
}

__kernel void AL(__global unsigned int* a, __global unsigned char* b, int c, __global CodeBlockAdditionalInfo* d, int e, __global int* f) {
  size_t g = get_global_id(0);
  if (g >= e)
    return;

  CodeBlockAdditionalInfo h = d[g];
  __global unsigned char* i = b + g * c;
  __global unsigned int* j = a + h.magconOffset;
  __global int* k = f + h.gpuCoefficientsOffset;

  MQDecoder l;
  J(&l, i, h.length);
  float m = 0.0f;

  if (h.significantBits > 0) {
    E(&l);

    AD(h, j, k);

    AI(h, j, &l, &m, 0);

    AG(h, j, 30 - h.magbits + h.significantBits, k);

    for (unsigned char n = 1; n < h.significantBits; n++) {
      AK(h, j, &l, &m, 0);

      AJ(h, j, &l, &m, 0);

      AI(h, j, &l, &m, 0);

      AG(h, j, 30 - h.magbits - n + h.significantBits, k);
    }

    AE(h, j, k);
  }
}
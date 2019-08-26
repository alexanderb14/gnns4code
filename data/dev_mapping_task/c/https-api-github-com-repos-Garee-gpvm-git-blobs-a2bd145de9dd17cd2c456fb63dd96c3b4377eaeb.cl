typedef uint2 packet; typedef ulong bytecode; typedef struct subt_rec {
  uint service_id;
  bytecode args[16];
  uchar arg_status[16];
  uchar subt_status;
  uchar return_to;
  ushort return_as;
} subt_rec;

typedef struct subt {
  subt_rec recs[1024];
  ushort av_recs[1024 + 1];
} subt;
void A(packet a, __global packet* b, int c, __global bytecode* d, __global subt* e, __global uint* f);
uint B(uint a, uint b, uint c, uint d, __global packet* e, int f, __global bytecode* g, __global subt* h, __global uint* i);
uint C(__global subt* a, uint b, __global uint* c);
bool D(__global packet* a, int b);

void E(bytecode a, uint b, ushort c, __global subt* d);
bool F(ushort a, __global subt* b);
bool G(ushort a, __global subt* b);
bool H(ushort* a, __global subt* b);
bool I(__global subt* a);
bool J(__global subt* a);
void K(ushort a, __global subt* b);
ushort L(__global subt* a);
void M(__global subt* a, ushort b);

uint N(__global subt_rec* a);
bytecode O(__global subt_rec* a, uint b);
uint P(__global subt_rec* a, uint b);
uint Q(__global subt_rec* a);
uint R(__global subt_rec* a);
uint S(__global subt_rec* a);
uint T(__global subt_rec* a);
uint U(__global subt_rec* a);
uint V(__global subt_rec* a);
void W(__global subt_rec* a, uint b);
void X(__global subt_rec* a, uint b, bytecode c);
void Y(__global subt_rec* a, uint b, uint c);
void Z(__global subt_rec* a, uint b);
void AA(__global subt_rec* a, uint b);
void AB(__global subt_rec* a, uint b);
void AC(__global subt_rec* a, uint b);
void AD(__global subt_rec* a, uint b);
void AE(__global subt_rec* a, uint b);

bytecode AF(uint a, uint b, uint c, uint d, uint e);
bytecode AG(uint a, uint b);
bytecode AH(uint a);
uint AI(bytecode a);
bool AJ(bytecode a);
uint AK(bytecode a);
uint AL(bytecode a);
uint AM(bytecode a);
uint AN(bytecode a);
uint AO(bytecode a);
uint AP(bytecode a);
uint AQ(bytecode a);
uint AR(bytecode a);
void AS(bytecode* a, ulong b);
void AT(bytecode* a);
void AU(bytecode* a);
void AV(bytecode* a, ulong b);
void AW(bytecode* a, ulong b);
void AX(bytecode* a, ulong b);
void AY(bytecode* a, ulong b);
void AZ(bytecode* a, ulong b);
void BA(bytecode* a, ulong b);
void BB(bytecode* a, ulong b);
void BC(bytecode* a, ulong b);

void BD(__global packet* a, __global packet* b, int c);
uint BE(size_t a, size_t b, __global packet* c, int d);
uint BF(size_t a, size_t b, __global packet* c, int d);
void BG(uint a, size_t b, size_t c, __global packet* d, int e);
void BH(uint a, size_t b, size_t c, __global packet* d, int e);
void BI(uint a, size_t b, size_t c, __global packet* d, int e);
bool BJ(size_t a, size_t b, __global packet* c, int d);
bool BK(size_t a, size_t b, __global packet* c, int d);
bool BL(size_t a, size_t b, __global packet* c, int d);
bool BM(size_t a, size_t b, __global packet* c, int d);
uint BN(size_t a, size_t b, __global packet* c, int d);
bool BO(packet* a, size_t b, __global packet* c, int d);
bool BP(packet a, size_t b, __global packet* c, int d);

packet BQ(uint a, uint b, uint c, uint d, uint e);
uint BR(packet a);
uint BS(packet a);
uint BT(packet a);
uint BU(packet a);
uint BV(packet a);
void BW(packet* a, uint b);
void BX(packet* a, uint b);
void BY(packet* a, uint b);
void BZ(packet* a, uint b);
void CA(packet* a, uint b);
void CB(packet* a, uint b);
__global subt_rec* CC(ushort a, __global subt* b) {
  return &(b->recs[a]);
}

__global void* CD(uint a, __global subt_rec* b, __global uint* c) {
  bytecode d = O(b, a);
  uint e = AI(d);
  uint f = AR(d);

  if (e == 4) {
    return ((__global void*)d);
  } else if (e == 6) {
    return ((__global void*)f);
  }

  return c + f;
}

__kernel void CE(__global packet* a, __global packet* b, int c, __global int* d, __global bytecode* e, __global subt* f, __global uint* g) {
  if (*d == 1) {
    BD(b, a, c);

    barrier(2);

    if (D(a, c)) {
      *d = -1;
    }
  } else if (*d == 0) {
    for (int h = 0; h < c; h++) {
      packet i;
      while (BO(&i, h, a, c)) {
        A(i, b, c, e, f, g);
      }
    }
  }
}

bool D(__global packet* a, int b) {
  for (int c = 0; c < b; c++) {
    for (int d = 0; d < b; d++) {
      if (!BL(c, d, a, b)) {
        return false;
      }
    }
  }

  return true;
}

void A(packet a, __global packet* b, int c, __global bytecode* d, __global subt* e, __global uint* f) {
  uint g = BR(a);
  uint h = BS(a);
  uint i = BT(a);
  uint j = BU(a);
  uint k = BV(a);

  switch (g) {
    case 0:
      break;

    case 1: {
      uint l = B(h, i, j, k, b, c, d, e, f);

      if (F(l, e)) {
        uint m = C(e, l, f);

        packet a = BQ(2, get_global_id(0), i, j, m);

        BP(a, h, b, c);

        K(l, e);
      }
      break;
    }

    case 2:

      E(0x8000000000000000 + k, i, j, e);

      if (F(j, e)) {
        uint m = C(e, j, f);

        __global subt_rec* n = CC(j, e);
        uint o = S(n);
        uint p = U(n);
        uint q = V(n);

        if (o == (c + 1)) {
          break;
        }

        packet a = BQ(2, get_global_id(0), q, p, m);
        BP(a, o, b, c);

        K(j, e);
      }
      break;
  }
}

uint B(uint a, uint b, uint c, uint d, __global packet* e, int f, __global bytecode* g, __global subt* h, __global uint* i) {
  ushort j;
  while (!H(&j, h)) {
  }
  __global subt_rec* k = CC(j, h);

  bytecode l = g[d * 16];

  uint m = AK(l);
  uint n = AQ(l);
  W(k, m);
  Z(k, 0);
  AA(k, n);
  AB(k, a);
  AD(k, c);
  AE(k, b);

  Z(k, 1);

  for (int b = 0; b < n; b++) {
    Y(k, b, 0);

    l = g[(d * 16) + b + 1];

    switch (AI(l)) {
      case 4:
        if (AJ(l)) {
          E(l, b, j, h);
        } else {
          uint d = AP(l);
          packet o = BQ(1, get_global_id(0), b, j, d);

          uint p = AL(l) - 1;

          BP(o, p, e, f);

          Y(k, b, 1);
        }
        break;

      case 6:
        E(l, b, j, h);
        break;
    }
  }

  Z(k, 2);

  return j;
}

uint C(__global subt* a, uint b, __global uint* c) {
  __global subt_rec* d = CC(b, a);
  uint e = N(d);

  uint f = AM(e);
  uint g = AN(e);
  uint h = AO(e);
  uint i = (f << 16) + (g << 8) + h;

  switch (i) {
    case 66049: {
      __global int* j = CD(0, d, c);
      __global int* k = CD(1, d, c);
      __global uint* l = CD(2, d, c);
      __global int* m = CD(3, d, c);

      int n = *m;
      for (int o = 0; o < n; o++) {
        for (int p = 0; p < n; p++) {
          int q = 0;
          for (int r = 0; r < n; r++) {
            q += j[o * n + r] * k[r * n + p];
          }

          *(l + (o * n + p)) = q;
        }
      }

      return l - c;
    }

    case 66050: {
      __global int* j = CD(0, d, c);
      __global int* k = CD(1, d, c);
      __global uint* l = CD(2, d, c);
      __global int* m = CD(3, d, c);
      int n = *m;

      for (int s = 0; s < n; s++) {
        for (int t = 0; t < n; t++) {
          int q = j[s * n + t] + k[s * n + t];
          *(l + (s * n + t)) = q;
        }
      }

      return l - c;
    }

    case 66052: {
      __global uint* u = CD(0, d, c);
      __global int* m = CD(1, d, c);
      int n = *m;

      for (int o = 0; o < n; o++) {
        for (int v = 0; v < n; v++) {
          *(u + (o * n + v)) = (o == v) ? 1 : 0;
        }
      }

      return u - c;
    }

    case 65793: {
      uint w = (uint)CD(0, d, c);
      return c[1 + w];
    }

    case 65794: {
      uint w = (uint)CD(0, d, c);
      return w + 1;
    }
  }

  return 0;
}

void E(bytecode e, uint b, ushort c, __global subt* d) {
  __global subt_rec* f = CC(c, d);
  X(f, b, e);
  uint g = R(f) - 1;
  Y(f, b, 2);
  AA(f, g);
}

bool F(ushort a, __global subt* b) {
  __global subt_rec* c = CC(a, b);
  return R(c) == 0;
}

bool G(ushort a, __global subt* b) {
  if (J(b)) {
    return false;
  }

  ushort c = L(b);
  b->av_recs[c - 1] = a;
  M(b, c - 1);
  return true;
}

bool H(ushort* c, __global subt* b) {
  if (I(b)) {
    return false;
  }

  ushort d = L(b);
  *c = b->av_recs[d];
  M(b, d + 1);
  return true;
}

void K(ushort a, __global subt* b) {
  G(a, b);
}

bool I(__global subt* a) {
  return L(a) == 1024 + 1;
}

bool J(__global subt* a) {
  return L(a) == 1;
}

ushort L(__global subt* a) {
  return a->av_recs[0];
}

void M(__global subt* a, ushort b) {
  a->av_recs[0] = b;
}

uint N(__global subt_rec* a) {
  return a->service_id;
}

bytecode O(__global subt_rec* a, uint b) {
  return a->args[b];
}

uint P(__global subt_rec* a, uint b) {
  return a->arg_status[b];
}

uint Q(__global subt_rec* a) {
  return (a->subt_status & 0xF0) >> 4;
}

uint R(__global subt_rec* a) {
  return (a->subt_status & 0xF);
}

uint S(__global subt_rec* a) {
  return a->return_to;
}

uint T(__global subt_rec* a) {
  return a->return_as;
}

uint U(__global subt_rec* a) {
  return a->return_as & 0xFF00;
}

uint V(__global subt_rec* a) {
  return a->return_as & 0xFF;
}

void W(__global subt_rec* a, uint b) {
  a->service_id = b;
}

void X(__global subt_rec* a, uint b, bytecode c) {
  a->args[b] = c;
}

void Y(__global subt_rec* a, uint b, uint c) {
  a->arg_status[b] = c;
}

void Z(__global subt_rec* a, uint b) {
  a->subt_status = (a->subt_status & ~0xF0) | ((b << 4) & 0xF0);
}

void AA(__global subt_rec* a, uint b) {
  a->subt_status = (a->subt_status & ~0xF) | ((b << 0) & 0xF);
}

void AB(__global subt_rec* a, uint b) {
  a->return_to = b;
}

void AC(__global subt_rec* a, uint b) {
  a->return_as = b;
}

void AD(__global subt_rec* a, uint b) {
  a->return_as = (a->return_as & ~0xFF00) | ((b << 8) & 0xFF00);
}

void AE(__global subt_rec* a, uint b) {
  a->return_as = (a->return_as & ~0xFF) | ((b << 0) & 0xFF);
}

bytecode AF(uint a, uint b, uint c, uint d, uint e) {
  bytecode f = 0;
  AS(&f, 0);
  AU(&f);
  BB(&f, a);
  AW(&f, b);
  AX(&f, c);
  AY(&f, d);
  AZ(&f, e);
  return f;
}

bytecode AG(uint a, uint c) {
  bytecode d = 0;
  AS(&d, 4);
  AU(&d);
  BA(&d, a);
  BC(&d, c);
  return d;
}

bytecode AH(uint a) {
  bytecode b = 0;
  AS(&b, 6);
  AT(&b);
  BC(&b, a);
  return b;
}

uint AI(bytecode a) {
  return (a & 0xF000000000000000UL) >> 60;
}

bool AJ(bytecode a) {
  return (a & 0xc0000000000000UL) >> 54;
}

uint AK(bytecode a) {
  return (a & 0xFFFFFFFFUL) >> 0;
}

uint AL(bytecode a) {
  return (a & 0xFF000000UL) >> 24;
}

uint AM(bytecode a) {
  return (a & 0xFF0000UL) >> 16;
}

uint AN(bytecode a) {
  return (a & 0xFF00UL) >> 8;
}

uint AO(bytecode a) {
  return (a & 0xFFUL) >> 0;
}

uint AP(bytecode a) {
  return (a & 0xFFFF00000000UL) >> 32;
}

uint AQ(bytecode a) {
  return (a & 0xF00000000UL) >> 32;
}

uint AR(bytecode a) {
  return (a & 0xFFFFFFFFUL) >> 0;
}

void AS(bytecode* a, ulong b) {
  *a = ((*a) & ~0xF000000000000000UL) | ((b << 60) & 0xF000000000000000UL);
}

void AT(bytecode* a) {
  *a = ((*a) & ~0xc0000000000000UL) | ((1UL << 54) & 0xc0000000000000UL);
}

void AU(bytecode* a) {
  *a = ((*a) & ~0xc0000000000000UL) | ((0UL << 54) & 0xc0000000000000UL);
}

void AV(bytecode* a, ulong b) {
  *a = ((*a) & ~0xFFFFFFFFUL) | ((b << 0) & 0xFFFFFFFFUL);
}

void AW(bytecode* a, ulong b) {
  *a = ((*a) & ~0xFF000000UL) | ((b << 24) & 0xFF000000UL);
}

void AX(bytecode* a, ulong b) {
  *a = ((*a) & ~0xFF0000UL) | ((b << 16) & 0xFF0000UL);
}

void AY(bytecode* a, ulong b) {
  *a = ((*a) & ~0xFF00UL) | ((b << 8) & 0xFF00UL);
}

void AZ(bytecode* a, ulong b) {
  *a = ((*a) & ~0xFFUL) | ((b << 0) & 0xFFUL);
}

void BA(bytecode* a, ulong b) {
  *a = ((*a) & ~0xFFFF00000000UL) | ((b << 32) & 0xFFFF00000000UL);
}

void BB(bytecode* a, ulong b) {
  *a = ((*a) & ~0xF00000000UL) | ((b << 32) & 0xF00000000UL);
}

void BC(bytecode* a, ulong b) {
  *a = ((*a) & ~0xFFFFFFFFUL) | ((b << 0) & 0xFFFFFFFFUL);
}

void BD(__global packet* a, __global packet* b, int c) {
  packet d;
  for (int e = 0; e < c; e++) {
    while (BO(&d, e, a, c)) {
      BP(d, e, b, c);
    }
  }
}

uint BE(size_t a, size_t b, __global packet* c, int d) {
  ushort2 e = __builtin_astype(c[a * d + b].x, ushort2);
  return e.x;
}

uint BF(size_t a, size_t b, __global packet* c, int d) {
  ushort2 e = __builtin_astype(c[a * d + b].x, ushort2);
  return e.y;
}

void BG(uint a, size_t b, size_t c, __global packet* d, int e) {
  ushort2 f = __builtin_astype(d[b * e + c].x, ushort2);
  f.x = a;
  d[b * e + c].x = __builtin_astype(f, uint);
}

void BH(uint a, size_t b, size_t c, __global packet* d, int e) {
  ushort2 f = __builtin_astype(d[b * e + c].x, ushort2);
  f.y = a;
  d[b * e + c].x = __builtin_astype(f, uint);
}

void BI(uint a, size_t b, size_t c, __global packet* d, int e) {
  d[b * e + c].y = a;
}

bool BJ(size_t a, size_t b, __global packet* c, int d) {
  return c[a * d + b].y == 0;
}

bool BK(size_t a, size_t b, __global packet* c, int d) {
  return c[a * d + b].y == 1;
}

bool BL(size_t a, size_t b, __global packet* c, int d) {
  return (BE(a, b, c, d) == BF(a, b, c, d)) && BJ(a, b, c, d);
}

bool BM(size_t a, size_t b, __global packet* c, int d) {
  return (BE(a, b, c, d) == BF(a, b, c, d)) && BK(a, b, c, d);
}

uint BN(size_t a, size_t b, __global packet* c, int d) {
  if (BM(a, b, c, d))
    return 16;
  if (BL(a, b, c, d))
    return 0;
  uint e = BE(a, b, c, d);
  uint f = BF(a, b, c, d);
  return (f > e) ? (f - e) : 16 - e;
}

bool BO(packet* a, size_t b, __global packet* c, int d) {
  size_t e = get_global_id(0);
  if (BL(e, b, c, d)) {
    return false;
  }

  int f = BE(e, b, c, d);
  *a = c[(d * d) + (e * d * 16) + (b * 16) + f];
  BG((f + 1) % 16, e, b, c, d);
  BI(0, e, b, c, d);
  return true;
}

bool BP(packet a, size_t b, __global packet* c, int d) {
  size_t e = get_global_id(0);
  if (BM(b, e, c, d)) {
    return false;
  }

  int f = BF(b, e, c, d);
  c[(d * d) + (b * d * 16) + (e * 16) + f] = a;
  BH((f + 1) % 16, b, e, c, d);
  BI(1, b, e, c, d);
  return true;
}

packet BQ(uint a, uint b, uint c, uint d, uint e) {
  packet f;
  BW(&f, a);
  BX(&f, b);
  BY(&f, c);
  BZ(&f, d);
  CA(&f, 0);
  CB(&f, e);
  return f;
}

uint BR(packet a) {
  return (a.x & 0x3) >> 0;
}

uint BS(packet a) {
  return (a.x & 0x3FC) >> 2;
}

uint BT(packet a) {
  return (a.x & 0x3C00) >> 10;
}

uint BU(packet a) {
  return (a.x & 0xFFC000) >> 14;
}

uint BV(packet a) {
  return a.y;
}

void BW(packet* a, uint b) {
  (*a).x = ((*a).x & ~0x3) | ((b << 0) & 0x3);
}

void BX(packet* a, uint b) {
  (*a).x = ((*a).x & ~0x3FC) | ((b << 2) & 0x3FC);
}

void BY(packet* a, uint b) {
  (*a).x = ((*a).x & ~0x3C00) | ((b << 10) & 0x3C00);
}

void BZ(packet* a, uint b) {
  (*a).x = ((*a).x & ~0xFFC000) | ((b << 14) & 0xFFC000);
}

void CA(packet* a, uint b) {
  (*a).x = ((*a).x & ~0x1000000) | ((b << 24) & 0x1000000);
}

void CB(packet* a, uint b) {
  (*a).y = b;
}
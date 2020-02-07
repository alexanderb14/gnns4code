typedef unsigned char u8; typedef unsigned short u16; typedef unsigned int u32; typedef char i8; typedef short i16; typedef int i32; struct FLAT_HTREE {
  u32 weight;
  u16 lc;
  u16 rc;
  u32 code;
  u8 symbol;
  u8 bitlen;
};

void A(u32* a, const struct FLAT_HTREE* b) {
  a[0] = b->weight;
  a[1] = (u32)((u32)(b->lc << 16) | b->rc);
  a[2] = b->code;
  a[3] = (u32)((u32)(b->symbol << 16) | b->bitlen);
}

void B(const u32* a, struct FLAT_HTREE* b) {
  b->weight = a[0];
  b->lc = (u16)((a[1] >> 16) & 0xFFFF);
  b->rc = (u16)(a[1] & 0xFFFF);
  b->code = a[2];
  b->symbol = (u8)((u8)(a[3] >> 16) & 0xFF);
  b->bitlen = (u16)(a[3] & 0xFFFF);
}

int C(u32* a, u32 b, const u8* c) {
  if (b == 0)
    return -1;

  u32 d = -1;
  u32 e = 0xffffffff;
  for (u32 f = 0; f < b; f++) {
    if (c[f] > 0)
      continue;

    struct FLAT_HTREE g;
    B(&a[f * 4], &g);

    if (g.weight < e) {
      d = f;
      e = g.weight;
    }
  }

  return (int)d;
}

inline u8 D(__global u8* a, u32* b, u8 c) {
  u8 d = (*b) % 8;

  if (c == 1)
    (*a) |= (1 << d);

  (*b)++;

  return (d == 7);
}

u8 E(u8 a, u8 b) {
  return ((a & (1 << b)) & 0xFF) != 0;
}

inline u8 F(__global u8* a, u32* b, u32 c, u32 d) {
  u8 e = 0;

  if (d == 0)
    return 0;

  for (int f = (int)d - 1; f >= 0; f--) {
    u8 g = (c >> f) & 0x01;
    bool h = D(a, b, g);

    if (h) {
      e++;
      a++;
      *a = 0;
    }
  }

  return e;
}

int G(__global u8* a, u32* b, u32 c, u32* d) {
  if (c == 0)
    return 0;

  *d = 0;
  int e = 0;
  for (u32 f = 0; f < c; f++) {
    u32 g = (*b) % 8;
    (*b)++;

    u8 h = E(*a, g);
    *d = ((*d) << 1) + h;

    if (g == 7) {
      a++;
      e++;
    }
  }

  return e;
}

inline int H(__global u8* a, u32 b) {
  for (int c = 0; c < 4; c++) {
    *a = (u8)(b >> (c * 8)) & 0xffff;
    a++;
  }

  return 4;
}

inline int I(__global u8* a, u32* b) {
  *b = 0;
  for (int c = 0; c < 4; c++) {
    (*b) |= ((*a) << (c * 8));
    a++;
  }

  return 4;
}

__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void J(__global uchar* a, uint b, __global uchar* c, __global uint* d, uchar e) {
  const u16 f = (u16)-1;

  u32 g[256 * 2 * 4];
  u32 h = 0;

  u8 i[256 * 2];
  for (u32 j = 0; j < 256 * 2; j++) {
    i[j] = 0;
  }

  u32 k[256];
  u16 l[256];
  for (u32 j = 0; j < 256; j++) {
    k[j] = 0;
    l[j] = f;
  }

  for (u32 j = 0; j < b; j++) {
    u8 m = a[j];
    k[m]++;
  }

  u8 n = 0;
  for (u16 j = 0; j < 256; j++) {
    if (k[j] > 0) {
      n++;

      struct FLAT_HTREE o;
      o.lc = o.rc = f;
      o.code = o.bitlen = 0;
      o.symbol = (u16)j;
      o.weight = k[j];

      l[j] = h;

      A(&g[h * 4], &o);
      h++;
    }
  }

  u32 p = n;
  while (p > 1) {
    int q = C(&g[0], h, &i[0]);
    i[q] = 1;

    int r = C(&g[0], h, &i[0]);
    i[r] = 1;

    struct FLAT_HTREE s;
    B(&g[q * 4], &s);

    struct FLAT_HTREE t;
    B(&g[r * 4], &t);

    struct FLAT_HTREE o;
    o.lc = q;
    o.rc = r;
    o.code = 0;
    o.bitlen = 0;
    o.symbol = t.symbol;
    o.weight = s.weight + t.weight;

    A(&g[h * 4], &o);
    h++;

    p--;
  }

  u32 u = h - 1;

  u16 v[256];
  int w = 0;

  v[w] = u;

  while (w >= 0) {
    struct FLAT_HTREE o;
    struct FLAT_HTREE x;
    struct FLAT_HTREE y;

    u32 z = v[w--];
    B(&g[z * 4], &o);

    if (o.lc != f) {
      B(&g[o.lc * 4], &x);
      x.code = (o.code << 1);
      x.bitlen = o.bitlen + 1;
      A(&g[o.lc * 4], &x);

      v[++w] = o.lc;
    }

    if (o.rc != f) {
      B(&g[o.rc * 4], &y);
      y.code = (o.code << 1) + 1;
      y.bitlen = o.bitlen + 1;
      A(&g[o.rc * 4], &y);

      v[++w] = o.rc;
    }
  }
  u32 aa = 0;
  for (u32 j = 0; j < n; j++) {
    struct FLAT_HTREE o;
    B(&g[j * 4], &o);
    aa += o.bitlen;
  }

  u32 ab = (aa + 7) / 8;

  u32 ac = 0;
  for (u32 j = 0; j < b; j++) {
    u16 ad = l[a[j]];
    struct FLAT_HTREE o;

    B(&g[ad * 4], &o);

    ac += o.bitlen;
  }

  u32 ae = (ac + 7) / 8;

  u32 af = 10 + 2 * n + ab + ae + 2;

  if (e == 1) {
    *d = af;
    return;
  } else if (*d < af) {
    *d = 0;
    return;
  }

  u32 ag = 0;
  H(&c[ag], b);
  ag += 4;

  c[ag] = n;
  ag++;

  for (int j = 0; j < n; j++) {
    struct FLAT_HTREE o;
    B(&g[j * 4], &o);

    c[ag] = o.symbol;
    ag++;
    c[ag] = o.bitlen;
    ag++;
  }

  u32 ah = 0;
  u32 ai = 0;
  for (int j = 0; j < n; j++) {
    struct FLAT_HTREE o;
    B(&g[j * 4], &o);

    int aj = F(&c[ag], &ah, o.code, o.bitlen);
    ag += aj;
    ai += aj;
  }

  if (ah % 8 != 0) {
    ag++;
  }

  u8 ak = ac % 8;

  H(&c[ag], ae);
  ag += 4;

  c[ag] = ak;
  ag++;

  ah = 0;
  ai = 0;
  for (u32 j = 0; j < b; j++) {
    u16 ad = l[a[j]];
    struct FLAT_HTREE o;

    B(&g[ad * 4], &o);

    int aj = F(&c[ag], &ah, o.code, o.bitlen);
    ag += aj;
    ai += aj;
  }
}

__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void K(__global uchar* a, uint b, __global uchar* c, __global uint* d, uchar e) {
  const u16 f = (u16)-1;
  u32 g[256 * 2 * 4];
  u32 h = 0;

  u8 i[256];
  u8 j[256];
  u32 k[256];
  __global u8* l = &a[0];
  u32 m = 0;
  I(l, &m);
  l += 4;

  if (e) {
    *d = m;
    return;
  } else if (*d < m) {
    *d = 0;
    return;
  }

  u8 n = *l;
  l++;

  u32 o = 0;
  for (u32 p = 0; p < n; p++) {
    i[p] = *l;
    l++;

    j[p] = *l;
    l++;

    o += j[p];
  }

  u32 q = 0;
  for (u32 p = 0; p < n; p++) {
    int r = G(l, &q, j[p], &k[p]);
    l += r;

    if (q >= o)
      break;
  }

  if (q % 8 != 0)
    l++;

  u32 s = h;

  {
    struct FLAT_HTREE t;
    t.lc = t.rc = f;
    t.code = 0;
    t.weight = 0;
    t.symbol = 0;
    t.bitlen = 0;

    A(&g[h * 4], &t);
    h++;
  }

  for (u32 p = 0; p < n; p++) {
    u8 u = j[p];
    u32 v = k[p];

    u32 w = s;

    u8 x = 0;
    u8 y = 0;
    for (u32 z = 0; z < u; z++) {
      struct FLAT_HTREE aa;

      B(&g[w * 4], &aa);

      u8 ab = (v >> (u - z - 1)) & 0x1;
      y = (y << 1) + ab;
      x++;

      bool ac = (z == (u32)(u - 1));
      bool ad = false;
      bool ae = false;

      if ((ab == 0) && (aa.lc == f)) {
        ad = true;
        ae = true;
      } else if ((ab == 1) && (aa.rc == f)) {
        ad = true;
      }

      if (ad) {
        struct FLAT_HTREE af;
        af.lc = af.rc = f;
        af.weight = 0;
        af.code = y;
        af.bitlen = x;

        if (ac)
          af.symbol = i[p];

        A(&g[h * 4], &af);

        if (ae)
          aa.lc = h;
        else
          aa.rc = h;

        A(&g[w * 4], &aa);

        h++;
      }

      if (ac)
        break;

      if (ab)
        w = aa.rc;
      else
        w = aa.lc;
    }
  }

  u32 ag = 0;
  I(l, &ag);
  l += 4;

  u8 ah = *l;
  l++;

  u32 ai = (ag - 1) * 8 + ah;

  q = 0;

  u32 w = s;
  u32 aj = 0;

  struct FLAT_HTREE aa;

  B(&g[w * 4], &aa);

  while (q < ai) {
    u32 ak = 0;
    int r = G(l, &q, 1, &ak);
    l += r;

    if (ak && (aa.rc != f))
      w = aa.rc;
    else if (aa.lc != f)
      w = aa.lc;

    B(&g[w * 4], &aa);

    bool al = (aa.rc == f) && (aa.lc == f);
    if (al) {
      c[aj++] = aa.symbol;
      w = s;
      B(&g[w * 4], &aa);

      if (aj >= m)
        return;
    }
  }
}
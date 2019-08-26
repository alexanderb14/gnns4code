typedef struct {
  unsigned int length;
  unsigned int buffer[32 / 4];
} inbuf;

typedef struct { unsigned int buffer[32 / 4]; } outbuf;

unsigned int A(unsigned int a) {
  return (rotate(((a)&0x00FF00FF), 24U) | rotate(((a)&0xFF00FF00), 8U));
}
void B(const unsigned int* a, unsigned int* b) {
  unsigned int c = b[0];
  unsigned int d = b[1];
  unsigned int e = b[2];
  unsigned int f = b[3];
  unsigned int g = b[4];

  unsigned int h = a[0];
  unsigned int i = a[1];
  unsigned int j = a[2];
  unsigned int k = a[3];
  unsigned int l = a[4];
  unsigned int m = a[5];
  unsigned int n = a[6];
  unsigned int o = a[7];
  unsigned int p = a[8];
  unsigned int q = a[9];
  unsigned int r = a[10];
  unsigned int s = a[11];
  unsigned int t = a[12];
  unsigned int u = a[13];
  unsigned int v = a[14];
  unsigned int w = a[15];

  {
    g += 0x5a827999u;
    g += h;
    g += (bitselect(f, e, d));
    g += rotate((c), (5u));
    d = rotate((d), (30u));
  };
  {
    f += 0x5a827999u;
    f += i;
    f += (bitselect(e, d, c));
    f += rotate((g), (5u));
    c = rotate((c), (30u));
  };
  {
    e += 0x5a827999u;
    e += j;
    e += (bitselect(d, c, g));
    e += rotate((f), (5u));
    g = rotate((g), (30u));
  };
  {
    d += 0x5a827999u;
    d += k;
    d += (bitselect(c, g, f));
    d += rotate((e), (5u));
    f = rotate((f), (30u));
  };
  {
    c += 0x5a827999u;
    c += l;
    c += (bitselect(g, f, e));
    c += rotate((d), (5u));
    e = rotate((e), (30u));
  };
  {
    g += 0x5a827999u;
    g += m;
    g += (bitselect(f, e, d));
    g += rotate((c), (5u));
    d = rotate((d), (30u));
  };
  {
    f += 0x5a827999u;
    f += n;
    f += (bitselect(e, d, c));
    f += rotate((g), (5u));
    c = rotate((c), (30u));
  };
  {
    e += 0x5a827999u;
    e += o;
    e += (bitselect(d, c, g));
    e += rotate((f), (5u));
    g = rotate((g), (30u));
  };
  {
    d += 0x5a827999u;
    d += p;
    d += (bitselect(c, g, f));
    d += rotate((e), (5u));
    f = rotate((f), (30u));
  };
  {
    c += 0x5a827999u;
    c += q;
    c += (bitselect(g, f, e));
    c += rotate((d), (5u));
    e = rotate((e), (30u));
  };
  {
    g += 0x5a827999u;
    g += r;
    g += (bitselect(f, e, d));
    g += rotate((c), (5u));
    d = rotate((d), (30u));
  };
  {
    f += 0x5a827999u;
    f += s;
    f += (bitselect(e, d, c));
    f += rotate((g), (5u));
    c = rotate((c), (30u));
  };
  {
    e += 0x5a827999u;
    e += t;
    e += (bitselect(d, c, g));
    e += rotate((f), (5u));
    g = rotate((g), (30u));
  };
  {
    d += 0x5a827999u;
    d += u;
    d += (bitselect(c, g, f));
    d += rotate((e), (5u));
    f = rotate((f), (30u));
  };
  {
    c += 0x5a827999u;
    c += v;
    c += (bitselect(g, f, e));
    c += rotate((d), (5u));
    e = rotate((e), (30u));
  };
  {
    g += 0x5a827999u;
    g += w;
    g += (bitselect(f, e, d));
    g += rotate((c), (5u));
    d = rotate((d), (30u));
  };
  h = rotate(((u ^ p ^ j ^ h)), (1u));
  {
    f += 0x5a827999u;
    f += h;
    f += (bitselect(e, d, c));
    f += rotate((g), (5u));
    c = rotate((c), (30u));
  };
  i = rotate(((v ^ q ^ k ^ i)), (1u));
  {
    e += 0x5a827999u;
    e += i;
    e += (bitselect(d, c, g));
    e += rotate((f), (5u));
    g = rotate((g), (30u));
  };
  j = rotate(((w ^ r ^ l ^ j)), (1u));
  {
    d += 0x5a827999u;
    d += j;
    d += (bitselect(c, g, f));
    d += rotate((e), (5u));
    f = rotate((f), (30u));
  };
  k = rotate(((h ^ s ^ m ^ k)), (1u));
  {
    c += 0x5a827999u;
    c += k;
    c += (bitselect(g, f, e));
    c += rotate((d), (5u));
    e = rotate((e), (30u));
  };

  l = rotate(((i ^ t ^ n ^ l)), (1u));
  {
    g += 0x6ed9eba1u;
    g += l;
    g += ((d) ^ (e) ^ (f));
    g += rotate((c), (5u));
    d = rotate((d), (30u));
  };
  m = rotate(((j ^ u ^ o ^ m)), (1u));
  {
    f += 0x6ed9eba1u;
    f += m;
    f += ((c) ^ (d) ^ (e));
    f += rotate((g), (5u));
    c = rotate((c), (30u));
  };
  n = rotate(((k ^ v ^ p ^ n)), (1u));
  {
    e += 0x6ed9eba1u;
    e += n;
    e += ((g) ^ (c) ^ (d));
    e += rotate((f), (5u));
    g = rotate((g), (30u));
  };
  o = rotate(((l ^ w ^ q ^ o)), (1u));
  {
    d += 0x6ed9eba1u;
    d += o;
    d += ((f) ^ (g) ^ (c));
    d += rotate((e), (5u));
    f = rotate((f), (30u));
  };
  p = rotate(((m ^ h ^ r ^ p)), (1u));
  {
    c += 0x6ed9eba1u;
    c += p;
    c += ((e) ^ (f) ^ (g));
    c += rotate((d), (5u));
    e = rotate((e), (30u));
  };
  q = rotate(((n ^ i ^ s ^ q)), (1u));
  {
    g += 0x6ed9eba1u;
    g += q;
    g += ((d) ^ (e) ^ (f));
    g += rotate((c), (5u));
    d = rotate((d), (30u));
  };
  r = rotate(((o ^ j ^ t ^ r)), (1u));
  {
    f += 0x6ed9eba1u;
    f += r;
    f += ((c) ^ (d) ^ (e));
    f += rotate((g), (5u));
    c = rotate((c), (30u));
  };
  s = rotate(((p ^ k ^ u ^ s)), (1u));
  {
    e += 0x6ed9eba1u;
    e += s;
    e += ((g) ^ (c) ^ (d));
    e += rotate((f), (5u));
    g = rotate((g), (30u));
  };
  t = rotate(((q ^ l ^ v ^ t)), (1u));
  {
    d += 0x6ed9eba1u;
    d += t;
    d += ((f) ^ (g) ^ (c));
    d += rotate((e), (5u));
    f = rotate((f), (30u));
  };
  u = rotate(((r ^ m ^ w ^ u)), (1u));
  {
    c += 0x6ed9eba1u;
    c += u;
    c += ((e) ^ (f) ^ (g));
    c += rotate((d), (5u));
    e = rotate((e), (30u));
  };
  v = rotate(((s ^ n ^ h ^ v)), (1u));
  {
    g += 0x6ed9eba1u;
    g += v;
    g += ((d) ^ (e) ^ (f));
    g += rotate((c), (5u));
    d = rotate((d), (30u));
  };
  w = rotate(((t ^ o ^ i ^ w)), (1u));
  {
    f += 0x6ed9eba1u;
    f += w;
    f += ((c) ^ (d) ^ (e));
    f += rotate((g), (5u));
    c = rotate((c), (30u));
  };
  h = rotate(((u ^ p ^ j ^ h)), (1u));
  {
    e += 0x6ed9eba1u;
    e += h;
    e += ((g) ^ (c) ^ (d));
    e += rotate((f), (5u));
    g = rotate((g), (30u));
  };
  i = rotate(((v ^ q ^ k ^ i)), (1u));
  {
    d += 0x6ed9eba1u;
    d += i;
    d += ((f) ^ (g) ^ (c));
    d += rotate((e), (5u));
    f = rotate((f), (30u));
  };
  j = rotate(((w ^ r ^ l ^ j)), (1u));
  {
    c += 0x6ed9eba1u;
    c += j;
    c += ((e) ^ (f) ^ (g));
    c += rotate((d), (5u));
    e = rotate((e), (30u));
  };
  k = rotate(((h ^ s ^ m ^ k)), (1u));
  {
    g += 0x6ed9eba1u;
    g += k;
    g += ((d) ^ (e) ^ (f));
    g += rotate((c), (5u));
    d = rotate((d), (30u));
  };
  l = rotate(((i ^ t ^ n ^ l)), (1u));
  {
    f += 0x6ed9eba1u;
    f += l;
    f += ((c) ^ (d) ^ (e));
    f += rotate((g), (5u));
    c = rotate((c), (30u));
  };
  m = rotate(((j ^ u ^ o ^ m)), (1u));
  {
    e += 0x6ed9eba1u;
    e += m;
    e += ((g) ^ (c) ^ (d));
    e += rotate((f), (5u));
    g = rotate((g), (30u));
  };
  n = rotate(((k ^ v ^ p ^ n)), (1u));
  {
    d += 0x6ed9eba1u;
    d += n;
    d += ((f) ^ (g) ^ (c));
    d += rotate((e), (5u));
    f = rotate((f), (30u));
  };
  o = rotate(((l ^ w ^ q ^ o)), (1u));
  {
    c += 0x6ed9eba1u;
    c += o;
    c += ((e) ^ (f) ^ (g));
    c += rotate((d), (5u));
    e = rotate((e), (30u));
  };

  p = rotate(((m ^ h ^ r ^ p)), (1u));
  {
    g += 0x8f1bbcdcu;
    g += p;
    g += (bitselect(d, e, (d ^ f)));
    g += rotate((c), (5u));
    d = rotate((d), (30u));
  };
  q = rotate(((n ^ i ^ s ^ q)), (1u));
  {
    f += 0x8f1bbcdcu;
    f += q;
    f += (bitselect(c, d, (c ^ e)));
    f += rotate((g), (5u));
    c = rotate((c), (30u));
  };
  r = rotate(((o ^ j ^ t ^ r)), (1u));
  {
    e += 0x8f1bbcdcu;
    e += r;
    e += (bitselect(g, c, (g ^ d)));
    e += rotate((f), (5u));
    g = rotate((g), (30u));
  };
  s = rotate(((p ^ k ^ u ^ s)), (1u));
  {
    d += 0x8f1bbcdcu;
    d += s;
    d += (bitselect(f, g, (f ^ c)));
    d += rotate((e), (5u));
    f = rotate((f), (30u));
  };
  t = rotate(((q ^ l ^ v ^ t)), (1u));
  {
    c += 0x8f1bbcdcu;
    c += t;
    c += (bitselect(e, f, (e ^ g)));
    c += rotate((d), (5u));
    e = rotate((e), (30u));
  };
  u = rotate(((r ^ m ^ w ^ u)), (1u));
  {
    g += 0x8f1bbcdcu;
    g += u;
    g += (bitselect(d, e, (d ^ f)));
    g += rotate((c), (5u));
    d = rotate((d), (30u));
  };
  v = rotate(((s ^ n ^ h ^ v)), (1u));
  {
    f += 0x8f1bbcdcu;
    f += v;
    f += (bitselect(c, d, (c ^ e)));
    f += rotate((g), (5u));
    c = rotate((c), (30u));
  };
  w = rotate(((t ^ o ^ i ^ w)), (1u));
  {
    e += 0x8f1bbcdcu;
    e += w;
    e += (bitselect(g, c, (g ^ d)));
    e += rotate((f), (5u));
    g = rotate((g), (30u));
  };
  h = rotate(((u ^ p ^ j ^ h)), (1u));
  {
    d += 0x8f1bbcdcu;
    d += h;
    d += (bitselect(f, g, (f ^ c)));
    d += rotate((e), (5u));
    f = rotate((f), (30u));
  };
  i = rotate(((v ^ q ^ k ^ i)), (1u));
  {
    c += 0x8f1bbcdcu;
    c += i;
    c += (bitselect(e, f, (e ^ g)));
    c += rotate((d), (5u));
    e = rotate((e), (30u));
  };
  j = rotate(((w ^ r ^ l ^ j)), (1u));
  {
    g += 0x8f1bbcdcu;
    g += j;
    g += (bitselect(d, e, (d ^ f)));
    g += rotate((c), (5u));
    d = rotate((d), (30u));
  };
  k = rotate(((h ^ s ^ m ^ k)), (1u));
  {
    f += 0x8f1bbcdcu;
    f += k;
    f += (bitselect(c, d, (c ^ e)));
    f += rotate((g), (5u));
    c = rotate((c), (30u));
  };
  l = rotate(((i ^ t ^ n ^ l)), (1u));
  {
    e += 0x8f1bbcdcu;
    e += l;
    e += (bitselect(g, c, (g ^ d)));
    e += rotate((f), (5u));
    g = rotate((g), (30u));
  };
  m = rotate(((j ^ u ^ o ^ m)), (1u));
  {
    d += 0x8f1bbcdcu;
    d += m;
    d += (bitselect(f, g, (f ^ c)));
    d += rotate((e), (5u));
    f = rotate((f), (30u));
  };
  n = rotate(((k ^ v ^ p ^ n)), (1u));
  {
    c += 0x8f1bbcdcu;
    c += n;
    c += (bitselect(e, f, (e ^ g)));
    c += rotate((d), (5u));
    e = rotate((e), (30u));
  };
  o = rotate(((l ^ w ^ q ^ o)), (1u));
  {
    g += 0x8f1bbcdcu;
    g += o;
    g += (bitselect(d, e, (d ^ f)));
    g += rotate((c), (5u));
    d = rotate((d), (30u));
  };
  p = rotate(((m ^ h ^ r ^ p)), (1u));
  {
    f += 0x8f1bbcdcu;
    f += p;
    f += (bitselect(c, d, (c ^ e)));
    f += rotate((g), (5u));
    c = rotate((c), (30u));
  };
  q = rotate(((n ^ i ^ s ^ q)), (1u));
  {
    e += 0x8f1bbcdcu;
    e += q;
    e += (bitselect(g, c, (g ^ d)));
    e += rotate((f), (5u));
    g = rotate((g), (30u));
  };
  r = rotate(((o ^ j ^ t ^ r)), (1u));
  {
    d += 0x8f1bbcdcu;
    d += r;
    d += (bitselect(f, g, (f ^ c)));
    d += rotate((e), (5u));
    f = rotate((f), (30u));
  };
  s = rotate(((p ^ k ^ u ^ s)), (1u));
  {
    c += 0x8f1bbcdcu;
    c += s;
    c += (bitselect(e, f, (e ^ g)));
    c += rotate((d), (5u));
    e = rotate((e), (30u));
  };

  t = rotate(((q ^ l ^ v ^ t)), (1u));
  {
    g += 0xca62c1d6u;
    g += t;
    g += ((d) ^ (e) ^ (f));
    g += rotate((c), (5u));
    d = rotate((d), (30u));
  };
  u = rotate(((r ^ m ^ w ^ u)), (1u));
  {
    f += 0xca62c1d6u;
    f += u;
    f += ((c) ^ (d) ^ (e));
    f += rotate((g), (5u));
    c = rotate((c), (30u));
  };
  v = rotate(((s ^ n ^ h ^ v)), (1u));
  {
    e += 0xca62c1d6u;
    e += v;
    e += ((g) ^ (c) ^ (d));
    e += rotate((f), (5u));
    g = rotate((g), (30u));
  };
  w = rotate(((t ^ o ^ i ^ w)), (1u));
  {
    d += 0xca62c1d6u;
    d += w;
    d += ((f) ^ (g) ^ (c));
    d += rotate((e), (5u));
    f = rotate((f), (30u));
  };
  h = rotate(((u ^ p ^ j ^ h)), (1u));
  {
    c += 0xca62c1d6u;
    c += h;
    c += ((e) ^ (f) ^ (g));
    c += rotate((d), (5u));
    e = rotate((e), (30u));
  };
  i = rotate(((v ^ q ^ k ^ i)), (1u));
  {
    g += 0xca62c1d6u;
    g += i;
    g += ((d) ^ (e) ^ (f));
    g += rotate((c), (5u));
    d = rotate((d), (30u));
  };
  j = rotate(((w ^ r ^ l ^ j)), (1u));
  {
    f += 0xca62c1d6u;
    f += j;
    f += ((c) ^ (d) ^ (e));
    f += rotate((g), (5u));
    c = rotate((c), (30u));
  };
  k = rotate(((h ^ s ^ m ^ k)), (1u));
  {
    e += 0xca62c1d6u;
    e += k;
    e += ((g) ^ (c) ^ (d));
    e += rotate((f), (5u));
    g = rotate((g), (30u));
  };
  l = rotate(((i ^ t ^ n ^ l)), (1u));
  {
    d += 0xca62c1d6u;
    d += l;
    d += ((f) ^ (g) ^ (c));
    d += rotate((e), (5u));
    f = rotate((f), (30u));
  };
  m = rotate(((j ^ u ^ o ^ m)), (1u));
  {
    c += 0xca62c1d6u;
    c += m;
    c += ((e) ^ (f) ^ (g));
    c += rotate((d), (5u));
    e = rotate((e), (30u));
  };
  n = rotate(((k ^ v ^ p ^ n)), (1u));
  {
    g += 0xca62c1d6u;
    g += n;
    g += ((d) ^ (e) ^ (f));
    g += rotate((c), (5u));
    d = rotate((d), (30u));
  };
  o = rotate(((l ^ w ^ q ^ o)), (1u));
  {
    f += 0xca62c1d6u;
    f += o;
    f += ((c) ^ (d) ^ (e));
    f += rotate((g), (5u));
    c = rotate((c), (30u));
  };
  p = rotate(((m ^ h ^ r ^ p)), (1u));
  {
    e += 0xca62c1d6u;
    e += p;
    e += ((g) ^ (c) ^ (d));
    e += rotate((f), (5u));
    g = rotate((g), (30u));
  };
  q = rotate(((n ^ i ^ s ^ q)), (1u));
  {
    d += 0xca62c1d6u;
    d += q;
    d += ((f) ^ (g) ^ (c));
    d += rotate((e), (5u));
    f = rotate((f), (30u));
  };
  r = rotate(((o ^ j ^ t ^ r)), (1u));
  {
    c += 0xca62c1d6u;
    c += r;
    c += ((e) ^ (f) ^ (g));
    c += rotate((d), (5u));
    e = rotate((e), (30u));
  };
  s = rotate(((p ^ k ^ u ^ s)), (1u));
  {
    g += 0xca62c1d6u;
    g += s;
    g += ((d) ^ (e) ^ (f));
    g += rotate((c), (5u));
    d = rotate((d), (30u));
  };
  t = rotate(((q ^ l ^ v ^ t)), (1u));
  {
    f += 0xca62c1d6u;
    f += t;
    f += ((c) ^ (d) ^ (e));
    f += rotate((g), (5u));
    c = rotate((c), (30u));
  };
  u = rotate(((r ^ m ^ w ^ u)), (1u));
  {
    e += 0xca62c1d6u;
    e += u;
    e += ((g) ^ (c) ^ (d));
    e += rotate((f), (5u));
    g = rotate((g), (30u));
  };
  v = rotate(((s ^ n ^ h ^ v)), (1u));
  {
    d += 0xca62c1d6u;
    d += v;
    d += ((f) ^ (g) ^ (c));
    d += rotate((e), (5u));
    f = rotate((f), (30u));
  };
  w = rotate(((t ^ o ^ i ^ w)), (1u));
  {
    c += 0xca62c1d6u;
    c += w;
    c += ((e) ^ (f) ^ (g));
    c += rotate((d), (5u));
    e = rotate((e), (30u));
  };

  b[0] += c;
  b[1] += d;
  b[2] += e;
  b[3] += f;
  b[4] += g;
}

void C(__global const unsigned int* a, int b, unsigned int* c) {
  int d = b / 4;
  if (b - (b / 4 * 4))
    d++;

  unsigned int* e = c;

  unsigned int f[0x10] = {0};
  int g = d;
  int h = 0;
  unsigned int i[5] = {0};
  i[0] = 0x67452301;
  i[1] = 0xefcdab89;
  i[2] = 0x98badcfe;
  i[3] = 0x10325476;
  i[4] = 0xc3d2e1f0;

  while (g > 0) {
    f[0x0] = 0x0;
    f[0x1] = 0x0;
    f[0x2] = 0x0;
    f[0x3] = 0x0;
    f[0x4] = 0x0;
    f[0x5] = 0x0;
    f[0x6] = 0x0;
    f[0x7] = 0x0;
    f[0x8] = 0x0;
    f[0x9] = 0x0;
    f[0xA] = 0x0;
    f[0xB] = 0x0;
    f[0xC] = 0x0;
    f[0xD] = 0x0;
    f[0xE] = 0x0;
    f[0xF] = 0x0;

    for (int j = 0; g != 0 && j < 16; j++) {
      f[j] ^= A(a[j + (h * 16)]);
      g--;
    }

    if (g == 0 && b - (b / 64 * 64) != 0) {
      unsigned int k = 0x80 << (((b + 4) - ((b + 4) / 4 * 4)) * 8);
      int l = b - (b / 64 * 64);
      f[l / 4] |= A(k);
      if ((b & 0x3B) != 0x3B) {
        f[0x0F] = b * 8;
      }
    }

    B(f, i);
    h++;
  }

  if (d - (d / 16 * 16) == 0) {
    f[0x0] = 0x0;
    f[0x1] = 0x0;
    f[0x2] = 0x0;
    f[0x3] = 0x0;
    f[0x4] = 0x0;
    f[0x5] = 0x0;
    f[0x6] = 0x0;
    f[0x7] = 0x0;
    f[0x8] = 0x0;
    f[0x9] = 0x0;
    f[0xA] = 0x0;
    f[0xB] = 0x0;
    f[0xC] = 0x0;
    f[0xD] = 0x0;
    f[0xE] = 0x0;
    f[0xF] = 0x0;
    if ((b & 0x3B) != 0x3B) {
      unsigned int k = 0x80 << (((b + 4) - ((b + 4) / 4 * 4)) * 8);
      f[0] |= A(k);
    }

    f[0x0F] = b * 8;

    B(f, i);
  }

  e[0] = A(i[0]);
  e[1] = A(i[1]);
  e[2] = A(i[2]);
  e[3] = A(i[3]);
  e[4] = A(i[4]);
  return;
}

__kernel void D(__global const inbuf* a, __global outbuf* b) {
  unsigned int c = get_global_id(0);
  unsigned int d[32 / 4] = {0};
  C(a[c].buffer, a[c].length, d);
  b[c].buffer[0] = d[0];
  b[c].buffer[1] = d[1];
  b[c].buffer[2] = d[2];
  b[c].buffer[3] = d[3];
  b[c].buffer[4] = d[4];
  b[c].buffer[5] = d[5];
  b[c].buffer[6] = d[6];
  b[c].buffer[7] = d[7];
}
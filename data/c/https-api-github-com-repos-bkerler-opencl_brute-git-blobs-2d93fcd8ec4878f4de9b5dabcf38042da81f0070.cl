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

void C(__global const unsigned int* a, int b, const unsigned int* c, int d, int e, unsigned int* f, unsigned int g) {
  int h = b / 4;
  if (b - (b / 4 * 4))
    h++;

  int i = d / 4;
  if (d - (d / 4 * 4))
    i++;

  unsigned int* j = f;

  unsigned int k[16];
  k[0x0] = 0x36363636;
  k[0x1] = 0x36363636;
  k[0x2] = 0x36363636;
  k[0x3] = 0x36363636;
  k[0x4] = 0x36363636;
  k[0x5] = 0x36363636;
  k[0x6] = 0x36363636;
  k[0x7] = 0x36363636;
  k[0x8] = 0x36363636;
  k[0x9] = 0x36363636;
  k[0xA] = 0x36363636;
  k[0xB] = 0x36363636;
  k[0xC] = 0x36363636;
  k[0xD] = 0x36363636;
  k[0xE] = 0x36363636;
  k[0xF] = 0x36363636;

  unsigned int l[16];
  l[0x0] = 0x5C5C5C5C;
  l[0x1] = 0x5C5C5C5C;
  l[0x2] = 0x5C5C5C5C;
  l[0x3] = 0x5C5C5C5C;
  l[0x4] = 0x5C5C5C5C;
  l[0x5] = 0x5C5C5C5C;
  l[0x6] = 0x5C5C5C5C;
  l[0x7] = 0x5C5C5C5C;
  l[0x8] = 0x5C5C5C5C;
  l[0x9] = 0x5C5C5C5C;
  l[0xA] = 0x5C5C5C5C;
  l[0xB] = 0x5C5C5C5C;
  l[0xC] = 0x5C5C5C5C;
  l[0xD] = 0x5C5C5C5C;
  l[0xE] = 0x5C5C5C5C;
  l[0xF] = 0x5C5C5C5C;

  for (int m = 0; m < h && m < 16; m++) {
    k[m] ^= A(a[m]);
    l[m] ^= A(a[m]);
  }

  unsigned int n[5] = {0};
  n[0] = 0x67452301;
  n[1] = 0xefcdab89;
  n[2] = 0x98badcfe;
  n[3] = 0x10325476;
  n[4] = 0xc3d2e1f0;

  unsigned int o[0x10] = {0};
  o[0] = k[0];
  o[1] = k[1];
  o[2] = k[2];
  o[3] = k[3];
  o[4] = k[4];
  o[5] = k[5];
  o[6] = k[6];
  o[7] = k[7];
  o[8] = k[8];
  o[9] = k[9];
  o[10] = k[10];
  o[11] = k[11];
  o[12] = k[12];
  o[13] = k[13];
  o[14] = k[14];
  o[15] = k[15];
  B(o, n);

  unsigned int p[5] = {0};
  p[0] = 0x67452301;
  p[1] = 0xefcdab89;
  p[2] = 0x98badcfe;
  p[3] = 0x10325476;
  p[4] = 0xc3d2e1f0;

  o[0] = l[0];
  o[1] = l[1];
  o[2] = l[2];
  o[3] = l[3];
  o[4] = l[4];
  o[5] = l[5];
  o[6] = l[6];
  o[7] = l[7];
  o[8] = l[8];
  o[9] = l[9];
  o[10] = l[10];
  o[11] = l[11];
  o[12] = l[12];
  o[13] = l[13];
  o[14] = l[14];
  o[15] = l[15];
  B(o, p);

  unsigned int q = 1;
  unsigned int r[5] = {0};

  unsigned int s = g;
  unsigned int t = 0;
  while (s > 0) {
    if (s > 20)
      t = 20;
    else
      t = s;

    r[0] = n[0];
    r[1] = n[1];
    r[2] = n[2];
    r[3] = n[3];
    r[4] = n[4];

    o[0] = 0;
    o[1] = 0;
    o[2] = 0;
    o[3] = 0;
    o[4] = 0;
    o[5] = 0;
    o[6] = 0;
    o[7] = 0;
    o[8] = 0;
    o[9] = 0;
    o[10] = 0;
    o[11] = 0;
    o[12] = 0;
    o[13] = 0;
    o[14] = 0;
    for (int m = 0; m < i; m++) {
      o[m] = A(c[m]);
    }
    o[i] = q;

    unsigned int u = 0x80 << (((d + 4) - ((d + 4) / 4 * 4)) * 8);
    o[(((d + 4) - ((d + 4) / (16 * 4) * (16 * 4))) / 4)] |= A(u);

    o[0x0F] = (0x40 + (d + 4)) * 8;

    B(o, r);

    o[0] = r[0];
    o[1] = r[1];
    o[2] = r[2];
    o[3] = r[3];
    o[4] = r[4];
    o[5] = 0x80000000;
    o[6] = 0x0;
    o[7] = 0x0;
    o[8] = 0x0;
    o[9] = 0;
    o[10] = 0;
    o[11] = 0;
    o[12] = 0;
    o[13] = 0;
    o[14] = 0;
    o[15] = 0x54 * 8;

    r[0] = p[0];
    r[1] = p[1];
    r[2] = p[2];
    r[3] = p[3];
    r[4] = p[4];

    B(o, r);

    j[0] = o[0] = r[0];
    j[1] = o[1] = r[1];
    j[2] = o[2] = r[2];
    j[3] = o[3] = r[3];
    j[4] = o[4] = r[4];

    for (int v = 1; v < e; v++) {
      o[5] = 0x80000000;
      o[6] = 0;
      o[7] = 0;
      o[8] = 0;
      o[9] = 0;
      o[10] = 0;
      o[11] = 0;
      o[12] = 0;
      o[13] = 0;
      o[14] = 0;
      o[15] = 0x54 * 8;
      r[0] = n[0];
      r[1] = n[1];
      r[2] = n[2];
      r[3] = n[3];
      r[4] = n[4];
      B(o, r);

      unsigned int w[0x10] = {0};
      w[0] = r[0];
      w[1] = r[1];
      w[2] = r[2];
      w[3] = r[3];
      w[4] = r[4];
      w[5] = 0x80000000;
      w[6] = 0;
      w[7] = 0;
      w[8] = 0;
      w[9] = 0;
      w[10] = 0;
      w[11] = 0;
      w[12] = 0;
      w[13] = 0;
      w[14] = 0;
      w[15] = 0x54 * 8;

      r[0] = p[0];
      r[1] = p[1];
      r[2] = p[2];
      r[3] = p[3];
      r[4] = p[4];

      B(w, r);

      o[0] = r[0];
      o[1] = r[1];
      o[2] = r[2];
      o[3] = r[3];
      o[4] = r[4];

      j[0] ^= r[0];
      j[1] ^= r[1];
      j[2] ^= r[2];
      j[3] ^= r[3];
      j[4] ^= r[4];
    }

    j[0] = A(j[0]);
    j[1] = A(j[1]);
    j[2] = A(j[2]);
    j[3] = A(j[3]);
    j[4] = A(j[4]);

    s -= t;
    q++;
    j += t / 4;
  }
  return;
}

__kernel void D(__global const inbuf* a, __global outbuf* b, __global const inbuf* c, const int d) {
  unsigned int e = get_global_id(0);
  unsigned int f[32 / 4] = {0};
  unsigned int g[32 / 4] = {0};
  g[0] = c[0].buffer[0];
  g[1] = c[0].buffer[1];
  g[2] = c[0].buffer[2];
  g[3] = c[0].buffer[3];
  g[4] = c[0].buffer[4];
  g[5] = c[0].buffer[5];
  g[6] = c[0].buffer[6];
  g[7] = c[0].buffer[7];
  int h = c[0].length;
  C(a[e].buffer, a[e].length, g, h, d, f, 32);
  b[e].buffer[0] = f[0];
  b[e].buffer[1] = f[1];
  b[e].buffer[2] = f[2];
  b[e].buffer[3] = f[3];
  b[e].buffer[4] = f[4];
  b[e].buffer[5] = f[5];
  b[e].buffer[6] = f[6];
  b[e].buffer[7] = f[7];
}
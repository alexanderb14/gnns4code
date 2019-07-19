typedef struct {
  unsigned int length;
  unsigned int buffer[32 / 4];
} inbuf;

typedef struct { unsigned int buffer[32 / 4]; } outbuf;

unsigned int A(unsigned int a) {
  return (rotate(((a)&0x00FF00FF), 24U) | rotate(((a)&0xFF00FF00), 8U));
}
__constant uint Ga[64] = {
    0x428a2f98u, 0x71374491u, 0xb5c0fbcfu, 0xe9b5dba5u, 0x3956c25bu, 0x59f111f1u, 0x923f82a4u, 0xab1c5ed5u, 0xd807aa98u, 0x12835b01u, 0x243185beu, 0x550c7dc3u, 0x72be5d74u, 0x80deb1feu, 0x9bdc06a7u, 0xc19bf174u, 0xe49b69c1u, 0xefbe4786u, 0x0fc19dc6u, 0x240ca1ccu, 0x2de92c6fu, 0x4a7484aau, 0x5cb0a9dcu, 0x76f988dau, 0x983e5152u, 0xa831c66du, 0xb00327c8u, 0xbf597fc7u, 0xc6e00bf3u, 0xd5a79147u, 0x06ca6351u, 0x14292967u,
    0x27b70a85u, 0x2e1b2138u, 0x4d2c6dfcu, 0x53380d13u, 0x650a7354u, 0x766a0abbu, 0x81c2c92eu, 0x92722c85u, 0xa2bfe8a1u, 0xa81a664bu, 0xc24b8b70u, 0xc76c51a3u, 0xd192e819u, 0xd6990624u, 0xf40e3585u, 0x106aa070u, 0x19a4c116u, 0x1e376c08u, 0x2748774cu, 0x34b0bcb5u, 0x391c0cb3u, 0x4ed8aa4au, 0x5b9cca4fu, 0x682e6ff3u, 0x748f82eeu, 0x78a5636fu, 0x84c87814u, 0x8cc70208u, 0x90befffau, 0xa4506cebu, 0xbef9a3f7u, 0xc67178f2u,
};
void B(const unsigned int* a, unsigned int* b) {
  unsigned int c = b[0];
  unsigned int d = b[1];
  unsigned int e = b[2];
  unsigned int f = b[3];
  unsigned int g = b[4];
  unsigned int h = b[5];
  unsigned int i = b[6];
  unsigned int j = b[7];

  unsigned int k = a[0];
  unsigned int l = a[1];
  unsigned int m = a[2];
  unsigned int n = a[3];
  unsigned int o = a[4];
  unsigned int p = a[5];
  unsigned int q = a[6];
  unsigned int r = a[7];
  unsigned int s = a[8];
  unsigned int t = a[9];
  unsigned int u = a[10];
  unsigned int v = a[11];
  unsigned int w = a[12];
  unsigned int x = a[13];
  unsigned int y = a[14];
  unsigned int z = a[15];
  {
    {
      j += Ga[0 + 0];
      j += k;
      j += (rotate(((g)), (26u)) ^ rotate(((g)), (21u)) ^ rotate(((g)), (7u)));
      j += (bitselect(i, h, g));
      f += j;
      j += (rotate(((c)), (30u)) ^ rotate(((c)), (19u)) ^ rotate(((c)), (10u)));
      j += (bitselect(c, d, (c ^ e)));
    };
    {
      i += Ga[0 + 1];
      i += l;
      i += (rotate(((f)), (26u)) ^ rotate(((f)), (21u)) ^ rotate(((f)), (7u)));
      i += (bitselect(h, g, f));
      e += i;
      i += (rotate(((j)), (30u)) ^ rotate(((j)), (19u)) ^ rotate(((j)), (10u)));
      i += (bitselect(j, c, (j ^ d)));
    };
    {
      h += Ga[0 + 2];
      h += m;
      h += (rotate(((e)), (26u)) ^ rotate(((e)), (21u)) ^ rotate(((e)), (7u)));
      h += (bitselect(g, f, e));
      d += h;
      h += (rotate(((i)), (30u)) ^ rotate(((i)), (19u)) ^ rotate(((i)), (10u)));
      h += (bitselect(i, j, (i ^ c)));
    };
    {
      g += Ga[0 + 3];
      g += n;
      g += (rotate(((d)), (26u)) ^ rotate(((d)), (21u)) ^ rotate(((d)), (7u)));
      g += (bitselect(f, e, d));
      c += g;
      g += (rotate(((h)), (30u)) ^ rotate(((h)), (19u)) ^ rotate(((h)), (10u)));
      g += (bitselect(h, i, (h ^ j)));
    };
    {
      f += Ga[0 + 4];
      f += o;
      f += (rotate(((c)), (26u)) ^ rotate(((c)), (21u)) ^ rotate(((c)), (7u)));
      f += (bitselect(e, d, c));
      j += f;
      f += (rotate(((g)), (30u)) ^ rotate(((g)), (19u)) ^ rotate(((g)), (10u)));
      f += (bitselect(g, h, (g ^ i)));
    };
    {
      e += Ga[0 + 5];
      e += p;
      e += (rotate(((j)), (26u)) ^ rotate(((j)), (21u)) ^ rotate(((j)), (7u)));
      e += (bitselect(d, c, j));
      i += e;
      e += (rotate(((f)), (30u)) ^ rotate(((f)), (19u)) ^ rotate(((f)), (10u)));
      e += (bitselect(f, g, (f ^ h)));
    };
    {
      d += Ga[0 + 6];
      d += q;
      d += (rotate(((i)), (26u)) ^ rotate(((i)), (21u)) ^ rotate(((i)), (7u)));
      d += (bitselect(c, j, i));
      h += d;
      d += (rotate(((e)), (30u)) ^ rotate(((e)), (19u)) ^ rotate(((e)), (10u)));
      d += (bitselect(e, f, (e ^ g)));
    };
    {
      c += Ga[0 + 7];
      c += r;
      c += (rotate(((h)), (26u)) ^ rotate(((h)), (21u)) ^ rotate(((h)), (7u)));
      c += (bitselect(j, i, h));
      g += c;
      c += (rotate(((d)), (30u)) ^ rotate(((d)), (19u)) ^ rotate(((d)), (10u)));
      c += (bitselect(d, e, (d ^ f)));
    };
    {
      j += Ga[0 + 8];
      j += s;
      j += (rotate(((g)), (26u)) ^ rotate(((g)), (21u)) ^ rotate(((g)), (7u)));
      j += (bitselect(i, h, g));
      f += j;
      j += (rotate(((c)), (30u)) ^ rotate(((c)), (19u)) ^ rotate(((c)), (10u)));
      j += (bitselect(c, d, (c ^ e)));
    };
    {
      i += Ga[0 + 9];
      i += t;
      i += (rotate(((f)), (26u)) ^ rotate(((f)), (21u)) ^ rotate(((f)), (7u)));
      i += (bitselect(h, g, f));
      e += i;
      i += (rotate(((j)), (30u)) ^ rotate(((j)), (19u)) ^ rotate(((j)), (10u)));
      i += (bitselect(j, c, (j ^ d)));
    };
    {
      h += Ga[0 + 10];
      h += u;
      h += (rotate(((e)), (26u)) ^ rotate(((e)), (21u)) ^ rotate(((e)), (7u)));
      h += (bitselect(g, f, e));
      d += h;
      h += (rotate(((i)), (30u)) ^ rotate(((i)), (19u)) ^ rotate(((i)), (10u)));
      h += (bitselect(i, j, (i ^ c)));
    };
    {
      g += Ga[0 + 11];
      g += v;
      g += (rotate(((d)), (26u)) ^ rotate(((d)), (21u)) ^ rotate(((d)), (7u)));
      g += (bitselect(f, e, d));
      c += g;
      g += (rotate(((h)), (30u)) ^ rotate(((h)), (19u)) ^ rotate(((h)), (10u)));
      g += (bitselect(h, i, (h ^ j)));
    };
    {
      f += Ga[0 + 12];
      f += w;
      f += (rotate(((c)), (26u)) ^ rotate(((c)), (21u)) ^ rotate(((c)), (7u)));
      f += (bitselect(e, d, c));
      j += f;
      f += (rotate(((g)), (30u)) ^ rotate(((g)), (19u)) ^ rotate(((g)), (10u)));
      f += (bitselect(g, h, (g ^ i)));
    };
    {
      e += Ga[0 + 13];
      e += x;
      e += (rotate(((j)), (26u)) ^ rotate(((j)), (21u)) ^ rotate(((j)), (7u)));
      e += (bitselect(d, c, j));
      i += e;
      e += (rotate(((f)), (30u)) ^ rotate(((f)), (19u)) ^ rotate(((f)), (10u)));
      e += (bitselect(f, g, (f ^ h)));
    };
    {
      d += Ga[0 + 14];
      d += y;
      d += (rotate(((i)), (26u)) ^ rotate(((i)), (21u)) ^ rotate(((i)), (7u)));
      d += (bitselect(c, j, i));
      h += d;
      d += (rotate(((e)), (30u)) ^ rotate(((e)), (19u)) ^ rotate(((e)), (10u)));
      d += (bitselect(e, f, (e ^ g)));
    };
    {
      c += Ga[0 + 15];
      c += z;
      c += (rotate(((h)), (26u)) ^ rotate(((h)), (21u)) ^ rotate(((h)), (7u)));
      c += (bitselect(j, i, h));
      g += c;
      c += (rotate(((d)), (30u)) ^ rotate(((d)), (19u)) ^ rotate(((d)), (10u)));
      c += (bitselect(d, e, (d ^ f)));
    };
  };

  {
    k = ((rotate(((y)), (15u)) ^ rotate(((y)), (13u)) ^ (((y)) >> (10u))) + t + (rotate(((l)), (25u)) ^ rotate(((l)), (14u)) ^ (((l)) >> (3u))) + k);
    l = ((rotate(((z)), (15u)) ^ rotate(((z)), (13u)) ^ (((z)) >> (10u))) + u + (rotate(((m)), (25u)) ^ rotate(((m)), (14u)) ^ (((m)) >> (3u))) + l);
    m = ((rotate(((k)), (15u)) ^ rotate(((k)), (13u)) ^ (((k)) >> (10u))) + v + (rotate(((n)), (25u)) ^ rotate(((n)), (14u)) ^ (((n)) >> (3u))) + m);
    n = ((rotate(((l)), (15u)) ^ rotate(((l)), (13u)) ^ (((l)) >> (10u))) + w + (rotate(((o)), (25u)) ^ rotate(((o)), (14u)) ^ (((o)) >> (3u))) + n);
    o = ((rotate(((m)), (15u)) ^ rotate(((m)), (13u)) ^ (((m)) >> (10u))) + x + (rotate(((p)), (25u)) ^ rotate(((p)), (14u)) ^ (((p)) >> (3u))) + o);
    p = ((rotate(((n)), (15u)) ^ rotate(((n)), (13u)) ^ (((n)) >> (10u))) + y + (rotate(((q)), (25u)) ^ rotate(((q)), (14u)) ^ (((q)) >> (3u))) + p);
    q = ((rotate(((o)), (15u)) ^ rotate(((o)), (13u)) ^ (((o)) >> (10u))) + z + (rotate(((r)), (25u)) ^ rotate(((r)), (14u)) ^ (((r)) >> (3u))) + q);
    r = ((rotate(((p)), (15u)) ^ rotate(((p)), (13u)) ^ (((p)) >> (10u))) + k + (rotate(((s)), (25u)) ^ rotate(((s)), (14u)) ^ (((s)) >> (3u))) + r);
    s = ((rotate(((q)), (15u)) ^ rotate(((q)), (13u)) ^ (((q)) >> (10u))) + l + (rotate(((t)), (25u)) ^ rotate(((t)), (14u)) ^ (((t)) >> (3u))) + s);
    t = ((rotate(((r)), (15u)) ^ rotate(((r)), (13u)) ^ (((r)) >> (10u))) + m + (rotate(((u)), (25u)) ^ rotate(((u)), (14u)) ^ (((u)) >> (3u))) + t);
    u = ((rotate(((s)), (15u)) ^ rotate(((s)), (13u)) ^ (((s)) >> (10u))) + n + (rotate(((v)), (25u)) ^ rotate(((v)), (14u)) ^ (((v)) >> (3u))) + u);
    v = ((rotate(((t)), (15u)) ^ rotate(((t)), (13u)) ^ (((t)) >> (10u))) + o + (rotate(((w)), (25u)) ^ rotate(((w)), (14u)) ^ (((w)) >> (3u))) + v);
    w = ((rotate(((u)), (15u)) ^ rotate(((u)), (13u)) ^ (((u)) >> (10u))) + p + (rotate(((x)), (25u)) ^ rotate(((x)), (14u)) ^ (((x)) >> (3u))) + w);
    x = ((rotate(((v)), (15u)) ^ rotate(((v)), (13u)) ^ (((v)) >> (10u))) + q + (rotate(((y)), (25u)) ^ rotate(((y)), (14u)) ^ (((y)) >> (3u))) + x);
    y = ((rotate(((w)), (15u)) ^ rotate(((w)), (13u)) ^ (((w)) >> (10u))) + r + (rotate(((z)), (25u)) ^ rotate(((z)), (14u)) ^ (((z)) >> (3u))) + y);
    z = ((rotate(((x)), (15u)) ^ rotate(((x)), (13u)) ^ (((x)) >> (10u))) + s + (rotate(((k)), (25u)) ^ rotate(((k)), (14u)) ^ (((k)) >> (3u))) + z);
  };
  {
    {
      j += Ga[16 + 0];
      j += k;
      j += (rotate(((g)), (26u)) ^ rotate(((g)), (21u)) ^ rotate(((g)), (7u)));
      j += (bitselect(i, h, g));
      f += j;
      j += (rotate(((c)), (30u)) ^ rotate(((c)), (19u)) ^ rotate(((c)), (10u)));
      j += (bitselect(c, d, (c ^ e)));
    };
    {
      i += Ga[16 + 1];
      i += l;
      i += (rotate(((f)), (26u)) ^ rotate(((f)), (21u)) ^ rotate(((f)), (7u)));
      i += (bitselect(h, g, f));
      e += i;
      i += (rotate(((j)), (30u)) ^ rotate(((j)), (19u)) ^ rotate(((j)), (10u)));
      i += (bitselect(j, c, (j ^ d)));
    };
    {
      h += Ga[16 + 2];
      h += m;
      h += (rotate(((e)), (26u)) ^ rotate(((e)), (21u)) ^ rotate(((e)), (7u)));
      h += (bitselect(g, f, e));
      d += h;
      h += (rotate(((i)), (30u)) ^ rotate(((i)), (19u)) ^ rotate(((i)), (10u)));
      h += (bitselect(i, j, (i ^ c)));
    };
    {
      g += Ga[16 + 3];
      g += n;
      g += (rotate(((d)), (26u)) ^ rotate(((d)), (21u)) ^ rotate(((d)), (7u)));
      g += (bitselect(f, e, d));
      c += g;
      g += (rotate(((h)), (30u)) ^ rotate(((h)), (19u)) ^ rotate(((h)), (10u)));
      g += (bitselect(h, i, (h ^ j)));
    };
    {
      f += Ga[16 + 4];
      f += o;
      f += (rotate(((c)), (26u)) ^ rotate(((c)), (21u)) ^ rotate(((c)), (7u)));
      f += (bitselect(e, d, c));
      j += f;
      f += (rotate(((g)), (30u)) ^ rotate(((g)), (19u)) ^ rotate(((g)), (10u)));
      f += (bitselect(g, h, (g ^ i)));
    };
    {
      e += Ga[16 + 5];
      e += p;
      e += (rotate(((j)), (26u)) ^ rotate(((j)), (21u)) ^ rotate(((j)), (7u)));
      e += (bitselect(d, c, j));
      i += e;
      e += (rotate(((f)), (30u)) ^ rotate(((f)), (19u)) ^ rotate(((f)), (10u)));
      e += (bitselect(f, g, (f ^ h)));
    };
    {
      d += Ga[16 + 6];
      d += q;
      d += (rotate(((i)), (26u)) ^ rotate(((i)), (21u)) ^ rotate(((i)), (7u)));
      d += (bitselect(c, j, i));
      h += d;
      d += (rotate(((e)), (30u)) ^ rotate(((e)), (19u)) ^ rotate(((e)), (10u)));
      d += (bitselect(e, f, (e ^ g)));
    };
    {
      c += Ga[16 + 7];
      c += r;
      c += (rotate(((h)), (26u)) ^ rotate(((h)), (21u)) ^ rotate(((h)), (7u)));
      c += (bitselect(j, i, h));
      g += c;
      c += (rotate(((d)), (30u)) ^ rotate(((d)), (19u)) ^ rotate(((d)), (10u)));
      c += (bitselect(d, e, (d ^ f)));
    };
    {
      j += Ga[16 + 8];
      j += s;
      j += (rotate(((g)), (26u)) ^ rotate(((g)), (21u)) ^ rotate(((g)), (7u)));
      j += (bitselect(i, h, g));
      f += j;
      j += (rotate(((c)), (30u)) ^ rotate(((c)), (19u)) ^ rotate(((c)), (10u)));
      j += (bitselect(c, d, (c ^ e)));
    };
    {
      i += Ga[16 + 9];
      i += t;
      i += (rotate(((f)), (26u)) ^ rotate(((f)), (21u)) ^ rotate(((f)), (7u)));
      i += (bitselect(h, g, f));
      e += i;
      i += (rotate(((j)), (30u)) ^ rotate(((j)), (19u)) ^ rotate(((j)), (10u)));
      i += (bitselect(j, c, (j ^ d)));
    };
    {
      h += Ga[16 + 10];
      h += u;
      h += (rotate(((e)), (26u)) ^ rotate(((e)), (21u)) ^ rotate(((e)), (7u)));
      h += (bitselect(g, f, e));
      d += h;
      h += (rotate(((i)), (30u)) ^ rotate(((i)), (19u)) ^ rotate(((i)), (10u)));
      h += (bitselect(i, j, (i ^ c)));
    };
    {
      g += Ga[16 + 11];
      g += v;
      g += (rotate(((d)), (26u)) ^ rotate(((d)), (21u)) ^ rotate(((d)), (7u)));
      g += (bitselect(f, e, d));
      c += g;
      g += (rotate(((h)), (30u)) ^ rotate(((h)), (19u)) ^ rotate(((h)), (10u)));
      g += (bitselect(h, i, (h ^ j)));
    };
    {
      f += Ga[16 + 12];
      f += w;
      f += (rotate(((c)), (26u)) ^ rotate(((c)), (21u)) ^ rotate(((c)), (7u)));
      f += (bitselect(e, d, c));
      j += f;
      f += (rotate(((g)), (30u)) ^ rotate(((g)), (19u)) ^ rotate(((g)), (10u)));
      f += (bitselect(g, h, (g ^ i)));
    };
    {
      e += Ga[16 + 13];
      e += x;
      e += (rotate(((j)), (26u)) ^ rotate(((j)), (21u)) ^ rotate(((j)), (7u)));
      e += (bitselect(d, c, j));
      i += e;
      e += (rotate(((f)), (30u)) ^ rotate(((f)), (19u)) ^ rotate(((f)), (10u)));
      e += (bitselect(f, g, (f ^ h)));
    };
    {
      d += Ga[16 + 14];
      d += y;
      d += (rotate(((i)), (26u)) ^ rotate(((i)), (21u)) ^ rotate(((i)), (7u)));
      d += (bitselect(c, j, i));
      h += d;
      d += (rotate(((e)), (30u)) ^ rotate(((e)), (19u)) ^ rotate(((e)), (10u)));
      d += (bitselect(e, f, (e ^ g)));
    };
    {
      c += Ga[16 + 15];
      c += z;
      c += (rotate(((h)), (26u)) ^ rotate(((h)), (21u)) ^ rotate(((h)), (7u)));
      c += (bitselect(j, i, h));
      g += c;
      c += (rotate(((d)), (30u)) ^ rotate(((d)), (19u)) ^ rotate(((d)), (10u)));
      c += (bitselect(d, e, (d ^ f)));
    };
  };

  {
    k = ((rotate(((y)), (15u)) ^ rotate(((y)), (13u)) ^ (((y)) >> (10u))) + t + (rotate(((l)), (25u)) ^ rotate(((l)), (14u)) ^ (((l)) >> (3u))) + k);
    l = ((rotate(((z)), (15u)) ^ rotate(((z)), (13u)) ^ (((z)) >> (10u))) + u + (rotate(((m)), (25u)) ^ rotate(((m)), (14u)) ^ (((m)) >> (3u))) + l);
    m = ((rotate(((k)), (15u)) ^ rotate(((k)), (13u)) ^ (((k)) >> (10u))) + v + (rotate(((n)), (25u)) ^ rotate(((n)), (14u)) ^ (((n)) >> (3u))) + m);
    n = ((rotate(((l)), (15u)) ^ rotate(((l)), (13u)) ^ (((l)) >> (10u))) + w + (rotate(((o)), (25u)) ^ rotate(((o)), (14u)) ^ (((o)) >> (3u))) + n);
    o = ((rotate(((m)), (15u)) ^ rotate(((m)), (13u)) ^ (((m)) >> (10u))) + x + (rotate(((p)), (25u)) ^ rotate(((p)), (14u)) ^ (((p)) >> (3u))) + o);
    p = ((rotate(((n)), (15u)) ^ rotate(((n)), (13u)) ^ (((n)) >> (10u))) + y + (rotate(((q)), (25u)) ^ rotate(((q)), (14u)) ^ (((q)) >> (3u))) + p);
    q = ((rotate(((o)), (15u)) ^ rotate(((o)), (13u)) ^ (((o)) >> (10u))) + z + (rotate(((r)), (25u)) ^ rotate(((r)), (14u)) ^ (((r)) >> (3u))) + q);
    r = ((rotate(((p)), (15u)) ^ rotate(((p)), (13u)) ^ (((p)) >> (10u))) + k + (rotate(((s)), (25u)) ^ rotate(((s)), (14u)) ^ (((s)) >> (3u))) + r);
    s = ((rotate(((q)), (15u)) ^ rotate(((q)), (13u)) ^ (((q)) >> (10u))) + l + (rotate(((t)), (25u)) ^ rotate(((t)), (14u)) ^ (((t)) >> (3u))) + s);
    t = ((rotate(((r)), (15u)) ^ rotate(((r)), (13u)) ^ (((r)) >> (10u))) + m + (rotate(((u)), (25u)) ^ rotate(((u)), (14u)) ^ (((u)) >> (3u))) + t);
    u = ((rotate(((s)), (15u)) ^ rotate(((s)), (13u)) ^ (((s)) >> (10u))) + n + (rotate(((v)), (25u)) ^ rotate(((v)), (14u)) ^ (((v)) >> (3u))) + u);
    v = ((rotate(((t)), (15u)) ^ rotate(((t)), (13u)) ^ (((t)) >> (10u))) + o + (rotate(((w)), (25u)) ^ rotate(((w)), (14u)) ^ (((w)) >> (3u))) + v);
    w = ((rotate(((u)), (15u)) ^ rotate(((u)), (13u)) ^ (((u)) >> (10u))) + p + (rotate(((x)), (25u)) ^ rotate(((x)), (14u)) ^ (((x)) >> (3u))) + w);
    x = ((rotate(((v)), (15u)) ^ rotate(((v)), (13u)) ^ (((v)) >> (10u))) + q + (rotate(((y)), (25u)) ^ rotate(((y)), (14u)) ^ (((y)) >> (3u))) + x);
    y = ((rotate(((w)), (15u)) ^ rotate(((w)), (13u)) ^ (((w)) >> (10u))) + r + (rotate(((z)), (25u)) ^ rotate(((z)), (14u)) ^ (((z)) >> (3u))) + y);
    z = ((rotate(((x)), (15u)) ^ rotate(((x)), (13u)) ^ (((x)) >> (10u))) + s + (rotate(((k)), (25u)) ^ rotate(((k)), (14u)) ^ (((k)) >> (3u))) + z);
  };
  {
    {
      j += Ga[32 + 0];
      j += k;
      j += (rotate(((g)), (26u)) ^ rotate(((g)), (21u)) ^ rotate(((g)), (7u)));
      j += (bitselect(i, h, g));
      f += j;
      j += (rotate(((c)), (30u)) ^ rotate(((c)), (19u)) ^ rotate(((c)), (10u)));
      j += (bitselect(c, d, (c ^ e)));
    };
    {
      i += Ga[32 + 1];
      i += l;
      i += (rotate(((f)), (26u)) ^ rotate(((f)), (21u)) ^ rotate(((f)), (7u)));
      i += (bitselect(h, g, f));
      e += i;
      i += (rotate(((j)), (30u)) ^ rotate(((j)), (19u)) ^ rotate(((j)), (10u)));
      i += (bitselect(j, c, (j ^ d)));
    };
    {
      h += Ga[32 + 2];
      h += m;
      h += (rotate(((e)), (26u)) ^ rotate(((e)), (21u)) ^ rotate(((e)), (7u)));
      h += (bitselect(g, f, e));
      d += h;
      h += (rotate(((i)), (30u)) ^ rotate(((i)), (19u)) ^ rotate(((i)), (10u)));
      h += (bitselect(i, j, (i ^ c)));
    };
    {
      g += Ga[32 + 3];
      g += n;
      g += (rotate(((d)), (26u)) ^ rotate(((d)), (21u)) ^ rotate(((d)), (7u)));
      g += (bitselect(f, e, d));
      c += g;
      g += (rotate(((h)), (30u)) ^ rotate(((h)), (19u)) ^ rotate(((h)), (10u)));
      g += (bitselect(h, i, (h ^ j)));
    };
    {
      f += Ga[32 + 4];
      f += o;
      f += (rotate(((c)), (26u)) ^ rotate(((c)), (21u)) ^ rotate(((c)), (7u)));
      f += (bitselect(e, d, c));
      j += f;
      f += (rotate(((g)), (30u)) ^ rotate(((g)), (19u)) ^ rotate(((g)), (10u)));
      f += (bitselect(g, h, (g ^ i)));
    };
    {
      e += Ga[32 + 5];
      e += p;
      e += (rotate(((j)), (26u)) ^ rotate(((j)), (21u)) ^ rotate(((j)), (7u)));
      e += (bitselect(d, c, j));
      i += e;
      e += (rotate(((f)), (30u)) ^ rotate(((f)), (19u)) ^ rotate(((f)), (10u)));
      e += (bitselect(f, g, (f ^ h)));
    };
    {
      d += Ga[32 + 6];
      d += q;
      d += (rotate(((i)), (26u)) ^ rotate(((i)), (21u)) ^ rotate(((i)), (7u)));
      d += (bitselect(c, j, i));
      h += d;
      d += (rotate(((e)), (30u)) ^ rotate(((e)), (19u)) ^ rotate(((e)), (10u)));
      d += (bitselect(e, f, (e ^ g)));
    };
    {
      c += Ga[32 + 7];
      c += r;
      c += (rotate(((h)), (26u)) ^ rotate(((h)), (21u)) ^ rotate(((h)), (7u)));
      c += (bitselect(j, i, h));
      g += c;
      c += (rotate(((d)), (30u)) ^ rotate(((d)), (19u)) ^ rotate(((d)), (10u)));
      c += (bitselect(d, e, (d ^ f)));
    };
    {
      j += Ga[32 + 8];
      j += s;
      j += (rotate(((g)), (26u)) ^ rotate(((g)), (21u)) ^ rotate(((g)), (7u)));
      j += (bitselect(i, h, g));
      f += j;
      j += (rotate(((c)), (30u)) ^ rotate(((c)), (19u)) ^ rotate(((c)), (10u)));
      j += (bitselect(c, d, (c ^ e)));
    };
    {
      i += Ga[32 + 9];
      i += t;
      i += (rotate(((f)), (26u)) ^ rotate(((f)), (21u)) ^ rotate(((f)), (7u)));
      i += (bitselect(h, g, f));
      e += i;
      i += (rotate(((j)), (30u)) ^ rotate(((j)), (19u)) ^ rotate(((j)), (10u)));
      i += (bitselect(j, c, (j ^ d)));
    };
    {
      h += Ga[32 + 10];
      h += u;
      h += (rotate(((e)), (26u)) ^ rotate(((e)), (21u)) ^ rotate(((e)), (7u)));
      h += (bitselect(g, f, e));
      d += h;
      h += (rotate(((i)), (30u)) ^ rotate(((i)), (19u)) ^ rotate(((i)), (10u)));
      h += (bitselect(i, j, (i ^ c)));
    };
    {
      g += Ga[32 + 11];
      g += v;
      g += (rotate(((d)), (26u)) ^ rotate(((d)), (21u)) ^ rotate(((d)), (7u)));
      g += (bitselect(f, e, d));
      c += g;
      g += (rotate(((h)), (30u)) ^ rotate(((h)), (19u)) ^ rotate(((h)), (10u)));
      g += (bitselect(h, i, (h ^ j)));
    };
    {
      f += Ga[32 + 12];
      f += w;
      f += (rotate(((c)), (26u)) ^ rotate(((c)), (21u)) ^ rotate(((c)), (7u)));
      f += (bitselect(e, d, c));
      j += f;
      f += (rotate(((g)), (30u)) ^ rotate(((g)), (19u)) ^ rotate(((g)), (10u)));
      f += (bitselect(g, h, (g ^ i)));
    };
    {
      e += Ga[32 + 13];
      e += x;
      e += (rotate(((j)), (26u)) ^ rotate(((j)), (21u)) ^ rotate(((j)), (7u)));
      e += (bitselect(d, c, j));
      i += e;
      e += (rotate(((f)), (30u)) ^ rotate(((f)), (19u)) ^ rotate(((f)), (10u)));
      e += (bitselect(f, g, (f ^ h)));
    };
    {
      d += Ga[32 + 14];
      d += y;
      d += (rotate(((i)), (26u)) ^ rotate(((i)), (21u)) ^ rotate(((i)), (7u)));
      d += (bitselect(c, j, i));
      h += d;
      d += (rotate(((e)), (30u)) ^ rotate(((e)), (19u)) ^ rotate(((e)), (10u)));
      d += (bitselect(e, f, (e ^ g)));
    };
    {
      c += Ga[32 + 15];
      c += z;
      c += (rotate(((h)), (26u)) ^ rotate(((h)), (21u)) ^ rotate(((h)), (7u)));
      c += (bitselect(j, i, h));
      g += c;
      c += (rotate(((d)), (30u)) ^ rotate(((d)), (19u)) ^ rotate(((d)), (10u)));
      c += (bitselect(d, e, (d ^ f)));
    };
  };

  {
    k = ((rotate(((y)), (15u)) ^ rotate(((y)), (13u)) ^ (((y)) >> (10u))) + t + (rotate(((l)), (25u)) ^ rotate(((l)), (14u)) ^ (((l)) >> (3u))) + k);
    l = ((rotate(((z)), (15u)) ^ rotate(((z)), (13u)) ^ (((z)) >> (10u))) + u + (rotate(((m)), (25u)) ^ rotate(((m)), (14u)) ^ (((m)) >> (3u))) + l);
    m = ((rotate(((k)), (15u)) ^ rotate(((k)), (13u)) ^ (((k)) >> (10u))) + v + (rotate(((n)), (25u)) ^ rotate(((n)), (14u)) ^ (((n)) >> (3u))) + m);
    n = ((rotate(((l)), (15u)) ^ rotate(((l)), (13u)) ^ (((l)) >> (10u))) + w + (rotate(((o)), (25u)) ^ rotate(((o)), (14u)) ^ (((o)) >> (3u))) + n);
    o = ((rotate(((m)), (15u)) ^ rotate(((m)), (13u)) ^ (((m)) >> (10u))) + x + (rotate(((p)), (25u)) ^ rotate(((p)), (14u)) ^ (((p)) >> (3u))) + o);
    p = ((rotate(((n)), (15u)) ^ rotate(((n)), (13u)) ^ (((n)) >> (10u))) + y + (rotate(((q)), (25u)) ^ rotate(((q)), (14u)) ^ (((q)) >> (3u))) + p);
    q = ((rotate(((o)), (15u)) ^ rotate(((o)), (13u)) ^ (((o)) >> (10u))) + z + (rotate(((r)), (25u)) ^ rotate(((r)), (14u)) ^ (((r)) >> (3u))) + q);
    r = ((rotate(((p)), (15u)) ^ rotate(((p)), (13u)) ^ (((p)) >> (10u))) + k + (rotate(((s)), (25u)) ^ rotate(((s)), (14u)) ^ (((s)) >> (3u))) + r);
    s = ((rotate(((q)), (15u)) ^ rotate(((q)), (13u)) ^ (((q)) >> (10u))) + l + (rotate(((t)), (25u)) ^ rotate(((t)), (14u)) ^ (((t)) >> (3u))) + s);
    t = ((rotate(((r)), (15u)) ^ rotate(((r)), (13u)) ^ (((r)) >> (10u))) + m + (rotate(((u)), (25u)) ^ rotate(((u)), (14u)) ^ (((u)) >> (3u))) + t);
    u = ((rotate(((s)), (15u)) ^ rotate(((s)), (13u)) ^ (((s)) >> (10u))) + n + (rotate(((v)), (25u)) ^ rotate(((v)), (14u)) ^ (((v)) >> (3u))) + u);
    v = ((rotate(((t)), (15u)) ^ rotate(((t)), (13u)) ^ (((t)) >> (10u))) + o + (rotate(((w)), (25u)) ^ rotate(((w)), (14u)) ^ (((w)) >> (3u))) + v);
    w = ((rotate(((u)), (15u)) ^ rotate(((u)), (13u)) ^ (((u)) >> (10u))) + p + (rotate(((x)), (25u)) ^ rotate(((x)), (14u)) ^ (((x)) >> (3u))) + w);
    x = ((rotate(((v)), (15u)) ^ rotate(((v)), (13u)) ^ (((v)) >> (10u))) + q + (rotate(((y)), (25u)) ^ rotate(((y)), (14u)) ^ (((y)) >> (3u))) + x);
    y = ((rotate(((w)), (15u)) ^ rotate(((w)), (13u)) ^ (((w)) >> (10u))) + r + (rotate(((z)), (25u)) ^ rotate(((z)), (14u)) ^ (((z)) >> (3u))) + y);
    z = ((rotate(((x)), (15u)) ^ rotate(((x)), (13u)) ^ (((x)) >> (10u))) + s + (rotate(((k)), (25u)) ^ rotate(((k)), (14u)) ^ (((k)) >> (3u))) + z);
  };
  {
    {
      j += Ga[48 + 0];
      j += k;
      j += (rotate(((g)), (26u)) ^ rotate(((g)), (21u)) ^ rotate(((g)), (7u)));
      j += (bitselect(i, h, g));
      f += j;
      j += (rotate(((c)), (30u)) ^ rotate(((c)), (19u)) ^ rotate(((c)), (10u)));
      j += (bitselect(c, d, (c ^ e)));
    };
    {
      i += Ga[48 + 1];
      i += l;
      i += (rotate(((f)), (26u)) ^ rotate(((f)), (21u)) ^ rotate(((f)), (7u)));
      i += (bitselect(h, g, f));
      e += i;
      i += (rotate(((j)), (30u)) ^ rotate(((j)), (19u)) ^ rotate(((j)), (10u)));
      i += (bitselect(j, c, (j ^ d)));
    };
    {
      h += Ga[48 + 2];
      h += m;
      h += (rotate(((e)), (26u)) ^ rotate(((e)), (21u)) ^ rotate(((e)), (7u)));
      h += (bitselect(g, f, e));
      d += h;
      h += (rotate(((i)), (30u)) ^ rotate(((i)), (19u)) ^ rotate(((i)), (10u)));
      h += (bitselect(i, j, (i ^ c)));
    };
    {
      g += Ga[48 + 3];
      g += n;
      g += (rotate(((d)), (26u)) ^ rotate(((d)), (21u)) ^ rotate(((d)), (7u)));
      g += (bitselect(f, e, d));
      c += g;
      g += (rotate(((h)), (30u)) ^ rotate(((h)), (19u)) ^ rotate(((h)), (10u)));
      g += (bitselect(h, i, (h ^ j)));
    };
    {
      f += Ga[48 + 4];
      f += o;
      f += (rotate(((c)), (26u)) ^ rotate(((c)), (21u)) ^ rotate(((c)), (7u)));
      f += (bitselect(e, d, c));
      j += f;
      f += (rotate(((g)), (30u)) ^ rotate(((g)), (19u)) ^ rotate(((g)), (10u)));
      f += (bitselect(g, h, (g ^ i)));
    };
    {
      e += Ga[48 + 5];
      e += p;
      e += (rotate(((j)), (26u)) ^ rotate(((j)), (21u)) ^ rotate(((j)), (7u)));
      e += (bitselect(d, c, j));
      i += e;
      e += (rotate(((f)), (30u)) ^ rotate(((f)), (19u)) ^ rotate(((f)), (10u)));
      e += (bitselect(f, g, (f ^ h)));
    };
    {
      d += Ga[48 + 6];
      d += q;
      d += (rotate(((i)), (26u)) ^ rotate(((i)), (21u)) ^ rotate(((i)), (7u)));
      d += (bitselect(c, j, i));
      h += d;
      d += (rotate(((e)), (30u)) ^ rotate(((e)), (19u)) ^ rotate(((e)), (10u)));
      d += (bitselect(e, f, (e ^ g)));
    };
    {
      c += Ga[48 + 7];
      c += r;
      c += (rotate(((h)), (26u)) ^ rotate(((h)), (21u)) ^ rotate(((h)), (7u)));
      c += (bitselect(j, i, h));
      g += c;
      c += (rotate(((d)), (30u)) ^ rotate(((d)), (19u)) ^ rotate(((d)), (10u)));
      c += (bitselect(d, e, (d ^ f)));
    };
    {
      j += Ga[48 + 8];
      j += s;
      j += (rotate(((g)), (26u)) ^ rotate(((g)), (21u)) ^ rotate(((g)), (7u)));
      j += (bitselect(i, h, g));
      f += j;
      j += (rotate(((c)), (30u)) ^ rotate(((c)), (19u)) ^ rotate(((c)), (10u)));
      j += (bitselect(c, d, (c ^ e)));
    };
    {
      i += Ga[48 + 9];
      i += t;
      i += (rotate(((f)), (26u)) ^ rotate(((f)), (21u)) ^ rotate(((f)), (7u)));
      i += (bitselect(h, g, f));
      e += i;
      i += (rotate(((j)), (30u)) ^ rotate(((j)), (19u)) ^ rotate(((j)), (10u)));
      i += (bitselect(j, c, (j ^ d)));
    };
    {
      h += Ga[48 + 10];
      h += u;
      h += (rotate(((e)), (26u)) ^ rotate(((e)), (21u)) ^ rotate(((e)), (7u)));
      h += (bitselect(g, f, e));
      d += h;
      h += (rotate(((i)), (30u)) ^ rotate(((i)), (19u)) ^ rotate(((i)), (10u)));
      h += (bitselect(i, j, (i ^ c)));
    };
    {
      g += Ga[48 + 11];
      g += v;
      g += (rotate(((d)), (26u)) ^ rotate(((d)), (21u)) ^ rotate(((d)), (7u)));
      g += (bitselect(f, e, d));
      c += g;
      g += (rotate(((h)), (30u)) ^ rotate(((h)), (19u)) ^ rotate(((h)), (10u)));
      g += (bitselect(h, i, (h ^ j)));
    };
    {
      f += Ga[48 + 12];
      f += w;
      f += (rotate(((c)), (26u)) ^ rotate(((c)), (21u)) ^ rotate(((c)), (7u)));
      f += (bitselect(e, d, c));
      j += f;
      f += (rotate(((g)), (30u)) ^ rotate(((g)), (19u)) ^ rotate(((g)), (10u)));
      f += (bitselect(g, h, (g ^ i)));
    };
    {
      e += Ga[48 + 13];
      e += x;
      e += (rotate(((j)), (26u)) ^ rotate(((j)), (21u)) ^ rotate(((j)), (7u)));
      e += (bitselect(d, c, j));
      i += e;
      e += (rotate(((f)), (30u)) ^ rotate(((f)), (19u)) ^ rotate(((f)), (10u)));
      e += (bitselect(f, g, (f ^ h)));
    };
    {
      d += Ga[48 + 14];
      d += y;
      d += (rotate(((i)), (26u)) ^ rotate(((i)), (21u)) ^ rotate(((i)), (7u)));
      d += (bitselect(c, j, i));
      h += d;
      d += (rotate(((e)), (30u)) ^ rotate(((e)), (19u)) ^ rotate(((e)), (10u)));
      d += (bitselect(e, f, (e ^ g)));
    };
    {
      c += Ga[48 + 15];
      c += z;
      c += (rotate(((h)), (26u)) ^ rotate(((h)), (21u)) ^ rotate(((h)), (7u)));
      c += (bitselect(j, i, h));
      g += c;
      c += (rotate(((d)), (30u)) ^ rotate(((d)), (19u)) ^ rotate(((d)), (10u)));
      c += (bitselect(d, e, (d ^ f)));
    };
  };

  b[0] += c;
  b[1] += d;
  b[2] += e;
  b[3] += f;
  b[4] += g;
  b[5] += h;
  b[6] += i;
  b[7] += j;
}

void C(__global const unsigned int* a, int b, unsigned int* c, int d, int e, unsigned int* f, unsigned int g) {
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

  unsigned int n[8];
  n[0] = 0x6a09e667;
  n[1] = 0xbb67ae85;
  n[2] = 0x3c6ef372;
  n[3] = 0xa54ff53a;
  n[4] = 0x510e527f;
  n[5] = 0x9b05688c;
  n[6] = 0x1f83d9ab;
  n[7] = 0x5be0cd19;

  unsigned int o[0x10];
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

  unsigned int p[8] = {0};
  p[0] = 0x6a09e667;
  p[1] = 0xbb67ae85;
  p[2] = 0x3c6ef372;
  p[3] = 0xa54ff53a;
  p[4] = 0x510e527f;
  p[5] = 0x9b05688c;
  p[6] = 0x1f83d9ab;
  p[7] = 0x5be0cd19;

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
  unsigned int r[8] = {0};

  unsigned int s = g;
  unsigned int t = 0;
  while (s > 0) {
    if (s > 32)
      t = 32;
    else
      t = s;

    r[0] = n[0];
    r[1] = n[1];
    r[2] = n[2];
    r[3] = n[3];
    r[4] = n[4];
    r[5] = n[5];
    r[6] = n[6];
    r[7] = n[7];

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
    o[5] = r[5];
    o[6] = r[6];
    o[7] = r[7];
    o[8] = 0x80000000;
    o[9] = 0;
    o[10] = 0;
    o[11] = 0;
    o[12] = 0;
    o[13] = 0;
    o[14] = 0;
    o[15] = 0x60 * 8;

    r[0] = p[0];
    r[1] = p[1];
    r[2] = p[2];
    r[3] = p[3];
    r[4] = p[4];
    r[5] = p[5];
    r[6] = p[6];
    r[7] = p[7];

    B(o, r);

    j[0] = o[0] = r[0];
    j[1] = o[1] = r[1];
    j[2] = o[2] = r[2];
    j[3] = o[3] = r[3];
    j[4] = o[4] = r[4];
    j[5] = o[5] = r[5];
    j[6] = o[6] = r[6];
    j[7] = o[7] = r[7];

    for (unsigned int v = 1; v < e; v++) {
      o[8] = 0x80000000;
      o[9] = 0;
      o[10] = 0;
      o[11] = 0;
      o[12] = 0;
      o[13] = 0;
      o[14] = 0;
      o[15] = 0x60 * 8;
      r[0] = n[0];
      r[1] = n[1];
      r[2] = n[2];
      r[3] = n[3];
      r[4] = n[4];
      r[5] = n[5];
      r[6] = n[6];
      r[7] = n[7];
      B(o, r);

      unsigned int w[0x10] = {0};
      w[0] = r[0];
      w[1] = r[1];
      w[2] = r[2];
      w[3] = r[3];
      w[4] = r[4];
      w[5] = r[5];
      w[6] = r[6];
      w[7] = r[7];
      w[8] = 0x80000000;
      w[9] = 0;
      w[10] = 0;
      w[11] = 0;
      w[12] = 0;
      w[13] = 0;
      w[14] = 0;
      w[15] = 0x60 * 8;

      r[0] = p[0];
      r[1] = p[1];
      r[2] = p[2];
      r[3] = p[3];
      r[4] = p[4];
      r[5] = p[5];
      r[6] = p[6];
      r[7] = p[7];

      B(w, r);

      o[0] = r[0];
      o[1] = r[1];
      o[2] = r[2];
      o[3] = r[3];
      o[4] = r[4];
      o[5] = r[5];
      o[6] = r[6];
      o[7] = r[7];

      j[0] ^= r[0];
      j[1] ^= r[1];
      j[2] ^= r[2];
      j[3] ^= r[3];
      j[4] ^= r[4];
      j[5] ^= r[5];
      j[6] ^= r[6];
      j[7] ^= r[7];
    }

    j[0] = A(j[0]);
    j[1] = A(j[1]);
    j[2] = A(j[2]);
    j[3] = A(j[3]);
    j[4] = A(j[4]);
    j[5] = A(j[5]);
    j[6] = A(j[6]);
    j[7] = A(j[7]);

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
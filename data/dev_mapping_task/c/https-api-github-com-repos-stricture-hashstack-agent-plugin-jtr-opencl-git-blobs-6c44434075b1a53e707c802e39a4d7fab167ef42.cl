typedef struct {
  union {
    unsigned char c[8][8][sizeof(int)];
    int v[8][8];
  } xkeys;
} opencl_DES_bs_transfer;

typedef struct {
  unsigned int num_uncracked_hashes;
  unsigned int offset_table_size;
  unsigned int hash_table_size;
  unsigned int bitmap_size_bits;
  unsigned int cmp_steps;
  unsigned int cmp_bits;
} DES_hash_check_params;
typedef unsigned int vtype;
inline void A(vtype a, vtype b, vtype c, vtype d, vtype e, vtype f, __private vtype* g, vtype h, vtype i, vtype j, vtype k) {
  vtype l, m, n, o, p, q, r;
  vtype s, t, u;
  vtype v, w, x, y;
  vtype z, aa, ab, ac;
  vtype ad, ae, af, ag;
  vtype ah, ai, aj, ak;
  vtype al, am, an;
  vtype ao, ap, aq;
  vtype ar, as, at, au;

  (l) = bitselect((c), (b), (e));
  (m) = (((b)) ^ ((c)));
  (n) = (a) | (d);
  (o) = (((m)) ^ ((n)));
  (p) = bitselect((e), (l), (o));
  (q) = (((d)) ^ ((p)));
  (r) = (((a)) ^ ((q)));

  (s) = bitselect((r), (n), (l));
  (t) = bitselect((m), (o), (e));
  (u) = (((s)) ^ ((t)));

  (v) = bitselect((n), (r), (u));
  (w) = bitselect((q), (r), (e));
  (x) = bitselect((v), (u), (w));
  (y) = (((l)) ^ ((x)));

  (z) = bitselect((o), (q), (v));
  (aa) = bitselect((l), (o), (r));
  (ab) = bitselect((e), (aa), (y));
  (ac) = (((z)) ^ ((ab)));

  (ad) = bitselect((r), (aa), (c));
  (ae) = bitselect((d), (l), (y));
  (af) = bitselect((ac), (ad), (ae));
  (ag) = ~(af);
  (ar) = bitselect((ag), (ac), (f));
  (g[h]) = (((g[h])) ^ ((ar)));

  (ah) = bitselect((ag), (c), (ab));
  (ai) = bitselect((ad), (b), (o));
  (aj) = bitselect((ah), (d), (ai));
  (ak) = (((y)) ^ ((aj)));
  (as) = bitselect((ak), (r), (f));
  (g[i]) = (((g[i])) ^ ((as)));

  (al) = bitselect((w), (t), (aj));
  (am) = bitselect((ai), (r), (p));
  (an) = (((al)) ^ ((am)));
  (au) = bitselect((an), (y), (f));
  (g[k]) = (((g[k])) ^ ((au)));

  (ao) = bitselect((ag), (o), (x));
  (ap) = bitselect((c), (ao), (ah));
  (aq) = bitselect((ap), (m), (am));
  (at) = bitselect((aq), (u), (f));
  (g[j]) = (((g[j])) ^ ((at)));
}
inline void B(vtype a, vtype b, vtype c, vtype d, vtype e, vtype f, __private vtype* g, vtype h, vtype i, vtype j, vtype k) {
  vtype l, m, n, o, p, q;
  vtype r, s, t, u;
  vtype v, w, x;
  vtype y, z, aa;
  vtype ab, ac, ad, ae;
  vtype af, ag, ah;
  vtype ai, aj, ak;
  vtype al, am, an;
  vtype ao, ap, aq, ar;

  (l) = bitselect((a), (c), (f));
  (m) = bitselect((f), (l), (e));
  (n) = bitselect((c), (d), (m));
  (o) = (((a)) ^ ((n)));
  (p) = (((e)) ^ ((f)));
  (q) = (((o)) ^ ((p)));

  (r) = bitselect((d), (o), (f));
  (s) = ~(r);
  (t) = (((l)) ^ ((s)));
  (u) = (((p)) ^ ((t)));
  (ap) = bitselect((u), (q), (b));
  (g[i]) = (((g[i])) ^ ((ap)));

  (v) = (((d)) ^ ((m)));
  (w) = bitselect((o), (f), (p));
  (x) = bitselect((t), (v), (w));

  (y) = bitselect((t), (v), (e));
  (z) = (((c)) ^ ((v)));
  (aa) = bitselect((y), (z), (a));

  (ab) = bitselect((o), (q), (t));
  (ac) = bitselect((d), (aa), (e));
  (ad) = (((ab)) ^ ((ac)));
  (ae) = (((s)) ^ ((ad)));
  (ao) = bitselect((ae), (aa), (b));
  (g[h]) = (((g[h])) ^ ((ao)));

  (af) = bitselect((aa), (ae), (p));
  (ag) = bitselect((q), (t), (a));
  (ah) = bitselect((af), (ag), (w));

  (ai) = bitselect((ab), (ae), (aa));
  (aj) = bitselect((ag), (c), (m));
  (ak) = bitselect((ai), (aj), (e));
  (ar) = bitselect((x), (ak), (b));
  (g[k]) = (((g[k])) ^ ((ar)));

  (al) = bitselect((ag), (ac), (f));
  (am) = bitselect((r), (ah), (al));
  (an) = (((aj)) ^ ((am)));
  (aq) = bitselect((ah), (an), (b));
  (g[j]) = (((g[j])) ^ ((aq)));
}
inline void C(vtype a, vtype b, vtype c, vtype d, vtype e, vtype f, __private vtype* g, vtype h, vtype i, vtype j, vtype k) {
  vtype l, m, n;
  vtype o, p, q, r, s;
  vtype t, u, v;
  vtype w, x, y, z;
  vtype aa, ab, ac, ad;
  vtype ae, af, ag, ah;
  vtype ai, aj, ak;
  vtype al, am, an;
  vtype ao, ap, aq, ar;

  (l) = bitselect((d), (c), (e));
  (m) = (((f)) ^ ((l)));
  (n) = (((b)) ^ ((m)));

  (o) = bitselect((c), (f), (n));
  (p) = bitselect((e), (c), (m));
  (q) = bitselect((e), (m), (b));
  (r) = bitselect((p), (d), (q));
  (s) = (((o)) ^ ((r)));

  (t) = bitselect((n), (q), (d));
  (u) = bitselect((t), (s), (c));
  (v) = ~(u);
  (ap) = bitselect((s), (v), (a));
  (g[i]) = (((g[i])) ^ ((ap)));

  (w) = (((p)) ^ ((s)));
  (x) = bitselect((b), (m), (r));
  (y) = bitselect((u), (b), (e));
  (z) = bitselect((w), (x), (y));

  (aa) = (((p)) ^ ((v)));
  (ab) = bitselect((aa), (t), (n));
  (ac) = (((x)) ^ ((ab)));
  (ad) = (((y)) ^ ((ac)));

  (ae) = bitselect((d), (f), (m));
  (af) = bitselect((aa), (ae), (q));
  (ag) = bitselect((ac), (f), (aa));
  (ah) = bitselect((af), (y), (ag));
  (ao) = bitselect((ah), (ad), (a));
  (g[h]) = (((g[h])) ^ ((ao)));

  (ai) = bitselect((ab), (ac), (e));
  (aj) = bitselect((ae), (p), (d));
  (ak) = bitselect((ai), (ah), (aj));
  (ar) = bitselect((n), (ak), (a));
  (g[k]) = (((g[k])) ^ ((ar)));

  (al) = bitselect((ab), (b), (x));
  (am) = bitselect((al), (aj), (f));
  (an) = (((y)) ^ ((am)));
  (aq) = bitselect((an), (z), (a));
  (g[j]) = (((g[j])) ^ ((aq)));
}

inline void D(vtype a, vtype b, vtype c, vtype d, vtype e, vtype f, __private vtype* g, vtype h, vtype i, vtype j, vtype k) {
  vtype l, m, n, o, p, q, r, s;
  vtype t;
  vtype u, v, w, x;
  vtype y;
  vtype z, aa, ab, ac;
  vtype ad, ae, af, ag;
  vtype ah, ai, aj, ak;

  (l) = bitselect((e), (c), (a));
  (m) = bitselect((l), (a), (d));
  (n) = (((c)) ^ ((m)));
  (o) = bitselect((a), (n), (b));
  (p) = bitselect((c), (e), (a));
  (q) = (((d)) ^ ((p)));
  (r) = bitselect((q), (c), (e));
  (s) = (((o)) ^ ((r)));

  (t) = ~(s);

  (u) = bitselect((d), (b), (m));
  (v) = (((a)) ^ ((l)));
  (w) = bitselect((t), (u), (v));
  (x) = (((p)) ^ ((w)));

  (y) = ~(x);

  (z) = bitselect((v), (y), (d));
  (aa) = bitselect((r), (q), (p));
  (ab) = bitselect((t), (aa), (b));
  (ac) = (((z)) ^ ((ab)));
  (aj) = bitselect((ac), (s), (f));
  (g[j]) = (((g[j])) ^ ((aj)));
  (ak) = bitselect((t), (ac), (f));
  (g[k]) = (((g[k])) ^ ((ak)));

  (ad) = bitselect((b), (d), (q));
  (ae) = bitselect((u), (ad), (v));
  (af) = (((y)) ^ ((ae)));
  (ag) = (((ac)) ^ ((af)));
  (ah) = bitselect((y), (ag), (f));
  (g[h]) = (((g[h])) ^ ((ah)));
  (ai) = bitselect((ag), (x), (f));
  (g[i]) = (((g[i])) ^ ((ai)));
}
inline void E(vtype a, vtype b, vtype c, vtype d, vtype e, vtype f, __private vtype* g, vtype h, vtype i, vtype j, vtype k) {
  vtype l, m, n, o, p, q;
  vtype r, s, t, u, v;
  vtype w, x, y, z;
  vtype aa, ab, ac;
  vtype ad, ae, af, ag;
  vtype ah, ai, aj;
  vtype ak, al, am;
  vtype an, ao, ap;
  vtype aq, ar, as, at;

  (l) = bitselect((a), (c), (e));
  (m) = ~(l);
  (n) = bitselect((m), (a), (c));
  (o) = (((b)) ^ ((n)));
  (p) = (((e)) ^ ((f)));
  (q) = (((o)) ^ ((p)));

  (r) = bitselect((c), (m), (b));
  (s) = bitselect((b), (q), (o));
  (t) = bitselect((f), (l), (s));
  (u) = bitselect((t), (e), (a));
  (v) = (((r)) ^ ((u)));

  (w) = bitselect((p), (v), (o));
  (x) = bitselect((f), (a), (w));
  (y) = bitselect((s), (f), (x));
  (z) = (((v)) ^ ((y)));
  (as) = bitselect((z), (v), (d));
  (g[j]) = (((g[j])) ^ ((as)));

  (aa) = bitselect((m), (t), (w));
  (ab) = bitselect((y), (l), (a));
  (ac) = (((aa)) ^ ((ab)));
  (ar) = bitselect((ac), (q), (d));
  (g[i]) = (((g[i])) ^ ((ar)));

  (ad) = bitselect((ac), (ab), (f));
  (ae) = bitselect((ad), (u), (b));
  (af) = bitselect((r), (b), (q));
  (ag) = bitselect((ae), (af), (ac));

  (ah) = bitselect((e), (ac), (q));
  (ai) = bitselect((o), (z), (aa));
  (aj) = bitselect((ah), (ai), (ae));

  (ak) = bitselect((y), (ae), (af));
  (al) = bitselect((ab), (p), (ah));
  (am) = (((ak)) ^ ((al)));
  (at) = bitselect((ag), (am), (d));
  (g[k]) = (((g[k])) ^ ((at)));

  (an) = bitselect((r), (n), (f));
  (ao) = bitselect((o), (q), (x));
  (ap) = bitselect((an), (ao), (ad));
  (aq) = bitselect((ap), (aj), (d));
  (g[h]) = (((g[h])) ^ ((aq)));
}
inline void F(vtype a, vtype b, vtype c, vtype d, vtype e, vtype f, __private vtype* g, vtype h, vtype i, vtype j, vtype k) {
  vtype l, m, n, o, p, q;
  vtype r, s, t, u;
  vtype v, w, x, y;
  vtype z, aa, ab;
  vtype ac, ad, ae;
  vtype af, ag, ah, ai;
  vtype aj, ak, al;
  vtype am, an, ao;
  vtype ap, aq, ar, as;

  (l) = bitselect((a), (d), (e));
  (m) = (((b)) ^ ((l)));
  (n) = bitselect((m), (d), (c));
  (o) = (((a)) ^ ((n)));
  (p) = (((e)) ^ ((o)));
  (q) = ~(p);

  (r) = bitselect((o), (p), (d));
  (s) = bitselect((c), (d), (r));
  (t) = (((m)) ^ ((s)));
  (u) = (((p)) ^ ((t)));

  (v) = bitselect((d), (o), (r));
  (w) = (((c)) ^ ((v)));
  (x) = bitselect((d), (c), (p));
  (y) = bitselect((w), (x), (t));

  (z) = bitselect((q), (x), (t));
  (aa) = bitselect((e), (w), (y));
  (ab) = bitselect((z), (p), (aa));
  (ap) = bitselect((q), (ab), (f));
  (g[h]) = (((g[h])) ^ ((ap)));

  (ac) = bitselect((o), (ab), (b));
  (ad) = bitselect((a), (z), (ac));
  (ae) = (((u)) ^ ((ad)));
  (as) = bitselect((u), (ae), (f));
  (g[k]) = (((g[k])) ^ ((as)));

  (af) = bitselect((w), (n), (p));
  (ag) = bitselect((af), (x), (s));
  (ah) = (((ae)) ^ ((ag)));
  (ai) = (((l)) ^ ((ah)));

  (aj) = bitselect((e), (ab), (z));
  (ak) = bitselect((ai), (ah), (aj));
  (al) = ~(ak);
  (aq) = bitselect((al), (ai), (f));
  (g[i]) = (((g[i])) ^ ((aq)));

  (am) = bitselect((aj), (ae), (ah));
  (an) = bitselect((ad), (af), (n));
  (ao) = (((am)) ^ ((an)));
  (ar) = bitselect((y), (ao), (f));
  (g[j]) = (((g[j])) ^ ((ar)));
}
inline void G(vtype a, vtype b, vtype c, vtype d, vtype e, vtype f, __private vtype* g, vtype h, vtype i, vtype j, vtype k) {
  vtype l, m, n, o, p, q;
  vtype r, s, t, u, v;
  vtype w, x, y;
  vtype z, aa, ab;
  vtype ac, ad, ae, af;
  vtype ag, ah, ai;
  vtype aj, ak, al;
  vtype am, an, ao;
  vtype ap, aq, ar, as;

  (l) = bitselect((b), (f), (c));
  (m) = (((d)) ^ ((l)));
  (n) = bitselect((c), (e), (b));
  (o) = bitselect((f), (b), (d));
  (p) = bitselect((n), (o), (e));
  (q) = (((m)) ^ ((p)));

  (r) = (((e)) ^ ((f)));
  (s) = (((b)) ^ ((c)));
  (t) = bitselect((c), (p), (d));
  (u) = bitselect((s), (t), (m));
  (v) = (((r)) ^ ((u)));
  (ap) = bitselect((v), (q), (a));
  (g[h]) = (((g[h])) ^ ((ap)));

  (w) = (((b)) ^ ((v)));
  (x) = bitselect((w), (e), (s));
  (y) = bitselect((v), (x), (f));

  (z) = bitselect((m), (w), (f));
  (aa) = bitselect((z), (s), (r));
  (ab) = (((o)) ^ ((aa)));

  (ac) = bitselect((m), (ab), (b));
  (ad) = ~(e);
  (ae) = bitselect((ad), (w), (t));
  (af) = (((ac)) ^ ((ae)));
  (aq) = bitselect((af), (y), (a));
  (g[i]) = (((g[i])) ^ ((aq)));

  (ag) = (((s)) ^ ((af)));
  (ah) = bitselect((y), (ag), (ac));
  (ai) = bitselect((ah), (q), (ae));
  (ar) = bitselect((ai), (ab), (a));
  (g[j]) = (((g[j])) ^ ((ar)));

  (aj) = bitselect((w), (v), (u));
  (ak) = (((w)) ^ ((ag)));
  (al) = bitselect((aj), (ak), (d));

  (am) = bitselect((y), (q), (v));
  (an) = bitselect((al), (c), (am));
  (ao) = ~(an);
  (as) = bitselect((al), (ao), (a));
  (g[k]) = (((g[k])) ^ ((as)));
}
inline void H(vtype a, vtype b, vtype c, vtype d, vtype e, vtype f, __private vtype* g, vtype h, vtype i, vtype j, vtype k) {
  vtype l, m, n, o, p, q;
  vtype r, s, t, u, v;
  vtype w, x, y;
  vtype z, aa, ab;
  vtype ac;
  vtype ad, ae, af;
  vtype ag, ah, ai;
  vtype aj, ak, al, am;
  vtype an, ao, ap, aq;

  (l) = bitselect((e), (a), (c));
  (m) = (((d)) ^ ((l)));
  (n) = bitselect((c), (d), (e));
  (o) = bitselect((b), (e), (a));
  (p) = bitselect((m), (n), (o));
  (q) = (((b)) ^ ((p)));

  (r) = bitselect((m), (d), (c));
  (s) = bitselect((e), (r), (b));
  (t) = bitselect((a), (q), (s));
  (u) = bitselect((c), (e), (b));
  (v) = (((t)) ^ ((u)));

  (w) = bitselect((q), (e), (m));
  (x) = bitselect((w), (a), (r));
  (y) = (((v)) ^ ((x)));
  (ap) = bitselect((y), (v), (f));
  (g[j]) = (((g[j])) ^ ((ap)));

  (z) = bitselect((u), (y), (e));
  (aa) = (((s)) ^ ((z)));
  (ab) = (((q)) ^ ((aa)));

  (ac) = ~(ab);

  (ad) = bitselect((p), (b), (z));
  (ae) = bitselect((ac), (ad), (x));
  (af) = (((aa)) ^ ((ae)));
  (ao) = bitselect((af), (q), (f));
  (g[i]) = (((g[i])) ^ ((ao)));

  (ag) = bitselect((t), (u), (ad));
  (ah) = bitselect((p), (ag), (v));
  (ai) = (((ac)) ^ ((ah)));
  (aq) = bitselect((ac), (ai), (f));
  (g[k]) = (((g[k])) ^ ((aq)));

  (aj) = bitselect((p), (b), (v));
  (ak) = (a) | (x);
  (al) = (((aj)) ^ ((ak)));
  (am) = (((ae)) ^ ((al)));
  (an) = bitselect((am), (ab), (f));
  (g[h]) = (((g[h])) ^ ((an)));
}
inline void I(__private unsigned int* a, __global int* b, int c, volatile __global uint* d, volatile __global uint* e, __global int* f, int g) {
  int h[2], i, j, k;

  for (j = 0; j < c; j++) {
    h[0] = b[j];
    h[1] = b[j + c];

    i = a[0] ^ -(h[0] & 1);

    for (k = 1; k < 32; k++)
      i |= a[k] ^ -((h[0] >> k) & 1);

    for (; k < 64; k += 2) {
      i |= a[k] ^ -((h[1] >> (k & 0x1F)) & 1);
      i |= a[k + 1] ^ -((h[1] >> ((k + 1) & 0x1F)) & 1);
    }

    if (i != ~(int)0) {
      if (!(atomic_or(&e[j / 32], (1U << (j % 32))) & (1U << (j % 32)))) {
        i = atomic_add(&d[0], 1);
        d[1 + 2 * i] = g;
        d[2 + 2 * i] = 0;
        for (k = 0; k < 64; k++)
          f[i * 64 + k] = (int)a[k];
      }
    }
  }
}
inline void J(__private unsigned int* a, __private unsigned int* b, __global unsigned int* c, __global unsigned int* d, DES_hash_check_params e, volatile __global uint* f, volatile __global uint* g, unsigned int h, unsigned int i, unsigned int j) {
  unsigned long k;
  unsigned int l, m, n;

  for (n = j; n < 32; n++)
    b[0] |= ((((uint)a[n]) >> i) & 1) << n;
  ;
  for (n = j; n < 32; n++)
    b[1] |= ((((uint)a[32 + n]) >> i) & 1) << n;
  ;

  k = ((unsigned long)b[1] << 32) | (unsigned long)b[0];
  k += (unsigned long)c[k % e.offset_table_size];
  l = k % e.hash_table_size;

  if (d[l + e.hash_table_size] == b[1])
    if (d[l] == b[0])
      if (!(atomic_or(&g[l / 32], (1U << (l % 32))) & (1U << (l % 32)))) {
        m = atomic_add(&f[0], 1);
        f[1 + 2 * m] = (h * 32) + i;
        f[2 + 2 * m] = l;
      }
}

__kernel void K(__global unsigned int* a, __global unsigned int* b, __global unsigned int* c, DES_hash_check_params d, volatile __global uint* e, volatile __global uint* f, __global uint* g) {
  int h;
  unsigned int i[64];
  int j = get_global_id(0);
  int k = get_global_size(0);
  unsigned int l[2], m, n;

  for (h = 0; h < 64; h++)
    i[h] = a[j + h * k];

  for (h = 0; h < 32; h++) {
    l[0] = 0;
    l[1] = 0;
    for (m = 0; m < d.cmp_bits; m++)
      l[1] |= ((((uint)i[32 + m]) >> h) & 1) << m;
    ;
    n = l[1] & (d.bitmap_size_bits - 1);
    m = (g[n >> 5] >> (n & 31)) & 1U;
    if (m)
      J(i, l, b, c, d, e, f, j, h, 0);
  }
}

__kernel void L(__global unsigned int* a, __global unsigned int* b, __global unsigned int* c, DES_hash_check_params d, volatile __global uint* e, volatile __global uint* f, __global int* g) {
  unsigned int h[2], i, j, k;
  unsigned int l[64];
  int m = get_global_id(0);
  int n = get_global_size(0);

  for (j = 0; j < 64; j++)
    l[j] = a[m + j * n];

  for (j = 0; j < d.num_uncracked_hashes; j++) {
    h[0] = g[j];
    h[1] = g[j + d.num_uncracked_hashes];

    i = l[0] ^ -(h[0] & 1);

    for (k = 1; k < 32; k++)
      i |= l[k] ^ -((h[0] >> k) & 1);

    for (; k < 64; k += 2) {
      i |= l[k] ^ -((h[1] >> (k & 0x1F)) & 1);
      i |= l[k + 1] ^ -((h[1] >> ((k + 1) & 0x1F)) & 1);
    }

    if (i != ~(int)0) {
      for (i = 0; i < 32; i++) {
        h[0] = h[1] = 0;
        J(l, h, b, c, d, e, f, m, i, 0);
      }
    }
  }
}
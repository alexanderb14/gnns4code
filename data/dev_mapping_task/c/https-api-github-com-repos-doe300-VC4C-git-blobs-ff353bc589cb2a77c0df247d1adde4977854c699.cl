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
__kernel void J(constant uint* a

                ,
                constant int* b

                ,
                __global int* c, __global vtype* d) {
  int e = get_global_id(0);

  int f = get_local_id(0);

  int g = get_global_size(0);
  vtype h[64];
  int i;
  int j, k;

  __local int l[56 * 256];
  int m = f * 56;
  for (k = 0; k < 56; k++)
    l[f * 56 + k] = c[e + k * g];
  barrier(1);

  {
    vtype n = 0;
    *((__private vtype*)((__private int*)&(h[0]) + (0))) = (n);
    *((__private vtype*)((__private int*)&(h[0]) + (1))) = (n);
    *((__private vtype*)((__private int*)&(h[0]) + (2))) = (n);
    *((__private vtype*)((__private int*)&(h[0]) + (3))) = (n);
    *((__private vtype*)((__private int*)&(h[0]) + (4))) = (n);
    *((__private vtype*)((__private int*)&(h[0]) + (5))) = (n);
    *((__private vtype*)((__private int*)&(h[0]) + (6))) = (n);
    *((__private vtype*)((__private int*)&(h[0]) + (7))) = (n);
    ;
    *((__private vtype*)((__private int*)&(h[8]) + (0))) = (n);
    *((__private vtype*)((__private int*)&(h[8]) + (1))) = (n);
    *((__private vtype*)((__private int*)&(h[8]) + (2))) = (n);
    *((__private vtype*)((__private int*)&(h[8]) + (3))) = (n);
    *((__private vtype*)((__private int*)&(h[8]) + (4))) = (n);
    *((__private vtype*)((__private int*)&(h[8]) + (5))) = (n);
    *((__private vtype*)((__private int*)&(h[8]) + (6))) = (n);
    *((__private vtype*)((__private int*)&(h[8]) + (7))) = (n);
    ;
    *((__private vtype*)((__private int*)&(h[16]) + (0))) = (n);
    *((__private vtype*)((__private int*)&(h[16]) + (1))) = (n);
    *((__private vtype*)((__private int*)&(h[16]) + (2))) = (n);
    *((__private vtype*)((__private int*)&(h[16]) + (3))) = (n);
    *((__private vtype*)((__private int*)&(h[16]) + (4))) = (n);
    *((__private vtype*)((__private int*)&(h[16]) + (5))) = (n);
    *((__private vtype*)((__private int*)&(h[16]) + (6))) = (n);
    *((__private vtype*)((__private int*)&(h[16]) + (7))) = (n);
    ;
    *((__private vtype*)((__private int*)&(h[24]) + (0))) = (n);
    *((__private vtype*)((__private int*)&(h[24]) + (1))) = (n);
    *((__private vtype*)((__private int*)&(h[24]) + (2))) = (n);
    *((__private vtype*)((__private int*)&(h[24]) + (3))) = (n);
    *((__private vtype*)((__private int*)&(h[24]) + (4))) = (n);
    *((__private vtype*)((__private int*)&(h[24]) + (5))) = (n);
    *((__private vtype*)((__private int*)&(h[24]) + (6))) = (n);
    *((__private vtype*)((__private int*)&(h[24]) + (7))) = (n);
    ;
    *((__private vtype*)((__private int*)&(h[32]) + (0))) = (n);
    *((__private vtype*)((__private int*)&(h[32]) + (1))) = (n);
    *((__private vtype*)((__private int*)&(h[32]) + (2))) = (n);
    *((__private vtype*)((__private int*)&(h[32]) + (3))) = (n);
    *((__private vtype*)((__private int*)&(h[32]) + (4))) = (n);
    *((__private vtype*)((__private int*)&(h[32]) + (5))) = (n);
    *((__private vtype*)((__private int*)&(h[32]) + (6))) = (n);
    *((__private vtype*)((__private int*)&(h[32]) + (7))) = (n);
    ;
    *((__private vtype*)((__private int*)&(h[40]) + (0))) = (n);
    *((__private vtype*)((__private int*)&(h[40]) + (1))) = (n);
    *((__private vtype*)((__private int*)&(h[40]) + (2))) = (n);
    *((__private vtype*)((__private int*)&(h[40]) + (3))) = (n);
    *((__private vtype*)((__private int*)&(h[40]) + (4))) = (n);
    *((__private vtype*)((__private int*)&(h[40]) + (5))) = (n);
    *((__private vtype*)((__private int*)&(h[40]) + (6))) = (n);
    *((__private vtype*)((__private int*)&(h[40]) + (7))) = (n);
    ;
    *((__private vtype*)((__private int*)&(h[48]) + (0))) = (n);
    *((__private vtype*)((__private int*)&(h[48]) + (1))) = (n);
    *((__private vtype*)((__private int*)&(h[48]) + (2))) = (n);
    *((__private vtype*)((__private int*)&(h[48]) + (3))) = (n);
    *((__private vtype*)((__private int*)&(h[48]) + (4))) = (n);
    *((__private vtype*)((__private int*)&(h[48]) + (5))) = (n);
    *((__private vtype*)((__private int*)&(h[48]) + (6))) = (n);
    *((__private vtype*)((__private int*)&(h[48]) + (7))) = (n);
    ;
    *((__private vtype*)((__private int*)&(h[56]) + (0))) = (n);
    *((__private vtype*)((__private int*)&(h[56]) + (1))) = (n);
    *((__private vtype*)((__private int*)&(h[56]) + (2))) = (n);
    *((__private vtype*)((__private int*)&(h[56]) + (3))) = (n);
    *((__private vtype*)((__private int*)&(h[56]) + (4))) = (n);
    *((__private vtype*)((__private int*)&(h[56]) + (5))) = (n);
    *((__private vtype*)((__private int*)&(h[56]) + (6))) = (n);
    *((__private vtype*)((__private int*)&(h[56]) + (7))) = (n);
    ;
  }
  int o;
  j = 0;
  o = 8;
  i = 25;
start:
  A(((h[b[0]]) ^ (l[a[0 + j] + m])), ((h[b[1]]) ^ (l[a[1 + j] + m])), ((h[b[2]]) ^ (l[a[2 + j] + m])), ((h[b[3]]) ^ (l[a[3 + j] + m])), ((h[b[4]]) ^ (l[a[4 + j] + m])), ((h[b[5]]) ^ (l[a[5 + j] + m])), h, 40, 48, 54, 62);
  B(((h[b[6]]) ^ (l[a[6 + j] + m])), ((h[b[7]]) ^ (l[a[7 + j] + m])), ((h[b[8]]) ^ (l[a[8 + j] + m])), ((h[b[9]]) ^ (l[a[9 + j] + m])), ((h[b[10]]) ^ (l[a[10 + j] + m])), ((h[b[11]]) ^ (l[a[11 + j] + m])), h, 44, 59, 33, 49);
  C(((h[7]) ^ (l[a[12 + j] + m])), ((h[8]) ^ (l[a[13 + j] + m])), ((h[9]) ^ (l[a[14 + j] + m])), ((h[10]) ^ (l[a[15 + j] + m])), ((h[11]) ^ (l[a[16 + j] + m])), ((h[12]) ^ (l[a[17 + j] + m])), h, 55, 47, 61, 37);
  D(((h[11]) ^ (l[a[18 + j] + m])), ((h[12]) ^ (l[a[19 + j] + m])), ((h[13]) ^ (l[a[20 + j] + m])), ((h[14]) ^ (l[a[21 + j] + m])), ((h[15]) ^ (l[a[22 + j] + m])), ((h[16]) ^ (l[a[23 + j] + m])), h, 57, 51, 41, 32);
  E(((h[b[12]]) ^ (l[a[24 + j] + m])), ((h[b[13]]) ^ (l[a[25 + j] + m])), ((h[b[14]]) ^ (l[a[26 + j] + m])), ((h[b[15]]) ^ (l[a[27 + j] + m])), ((h[b[16]]) ^ (l[a[28 + j] + m])), ((h[b[17]]) ^ (l[a[29 + j] + m])), h, 39, 45, 56, 34);
  F(((h[b[18]]) ^ (l[a[30 + j] + m])), ((h[b[19]]) ^ (l[a[31 + j] + m])), ((h[b[20]]) ^ (l[a[32 + j] + m])), ((h[b[21]]) ^ (l[a[33 + j] + m])), ((h[b[22]]) ^ (l[a[34 + j] + m])), ((h[b[23]]) ^ (l[a[35 + j] + m])), h, 35, 60, 42, 50);
  G(((h[23]) ^ (l[a[36 + j] + m])), ((h[24]) ^ (l[a[37 + j] + m])), ((h[25]) ^ (l[a[38 + j] + m])), ((h[26]) ^ (l[a[39 + j] + m])), ((h[27]) ^ (l[a[40 + j] + m])), ((h[28]) ^ (l[a[41 + j] + m])), h, 63, 43, 53, 38);
  H(((h[27]) ^ (l[a[42 + j] + m])), ((h[28]) ^ (l[a[43 + j] + m])), ((h[29]) ^ (l[a[44 + j] + m])), ((h[30]) ^ (l[a[45 + j] + m])), ((h[31]) ^ (l[a[46 + j] + m])), ((h[0]) ^ (l[a[47 + j] + m])), h, 36, 58, 46, 52);
  ;
  if (o == 0x100)
    goto next;
  A(((h[b[24]]) ^ (l[a[48 + j] + m])), ((h[b[25]]) ^ (l[a[49 + j] + m])), ((h[b[26]]) ^ (l[a[50 + j] + m])), ((h[b[27]]) ^ (l[a[51 + j] + m])), ((h[b[28]]) ^ (l[a[52 + j] + m])), ((h[b[29]]) ^ (l[a[53 + j] + m])), h, 8, 16, 22, 30);
  B(((h[b[30]]) ^ (l[a[54 + j] + m])), ((h[b[31]]) ^ (l[a[55 + j] + m])), ((h[b[32]]) ^ (l[a[56 + j] + m])), ((h[b[33]]) ^ (l[a[57 + j] + m])), ((h[b[34]]) ^ (l[a[58 + j] + m])), ((h[b[35]]) ^ (l[a[59 + j] + m])), h, 12, 27, 1, 17);
  C(((h[39]) ^ (l[a[60 + j] + m])), ((h[40]) ^ (l[a[61 + j] + m])), ((h[41]) ^ (l[a[62 + j] + m])), ((h[42]) ^ (l[a[63 + j] + m])), ((h[43]) ^ (l[a[64 + j] + m])), ((h[44]) ^ (l[a[65 + j] + m])), h, 23, 15, 29, 5);
  D(((h[43]) ^ (l[a[66 + j] + m])), ((h[44]) ^ (l[a[67 + j] + m])), ((h[45]) ^ (l[a[68 + j] + m])), ((h[46]) ^ (l[a[69 + j] + m])), ((h[47]) ^ (l[a[70 + j] + m])), ((h[48]) ^ (l[a[71 + j] + m])), h, 25, 19, 9, 0);
  E(((h[b[36]]) ^ (l[a[72 + j] + m])), ((h[b[37]]) ^ (l[a[73 + j] + m])), ((h[b[38]]) ^ (l[a[74 + j] + m])), ((h[b[39]]) ^ (l[a[75 + j] + m])), ((h[b[40]]) ^ (l[a[76 + j] + m])), ((h[b[41]]) ^ (l[a[77 + j] + m])), h, 7, 13, 24, 2);
  F(((h[b[42]]) ^ (l[a[78 + j] + m])), ((h[b[43]]) ^ (l[a[79 + j] + m])), ((h[b[44]]) ^ (l[a[80 + j] + m])), ((h[b[45]]) ^ (l[a[81 + j] + m])), ((h[b[46]]) ^ (l[a[82 + j] + m])), ((h[b[47]]) ^ (l[a[83 + j] + m])), h, 3, 28, 10, 18);
  G(((h[55]) ^ (l[a[84 + j] + m])), ((h[56]) ^ (l[a[85 + j] + m])), ((h[57]) ^ (l[a[86 + j] + m])), ((h[58]) ^ (l[a[87 + j] + m])), ((h[59]) ^ (l[a[88 + j] + m])), ((h[60]) ^ (l[a[89 + j] + m])), h, 31, 11, 21, 6);
  H(((h[59]) ^ (l[a[90 + j] + m])), ((h[60]) ^ (l[a[91 + j] + m])), ((h[61]) ^ (l[a[92 + j] + m])), ((h[62]) ^ (l[a[93 + j] + m])), ((h[63]) ^ (l[a[94 + j] + m])), ((h[32]) ^ (l[a[95 + j] + m])), h, 4, 26, 14, 20);
  ;
  j += 96;
  o--;
  ;

  if (o > 0)
    goto start;
  j -= (0x300 + 48);
  o = 0x108;

  if (--i)
    goto swap;

  for (k = 0; k < 64; k++)
    d[k * g + e] = h[k];

  return;
swap:
  A(((h[b[24]]) ^ (l[a[48 + j] + m])), ((h[b[25]]) ^ (l[a[49 + j] + m])), ((h[b[26]]) ^ (l[a[50 + j] + m])), ((h[b[27]]) ^ (l[a[51 + j] + m])), ((h[b[28]]) ^ (l[a[52 + j] + m])), ((h[b[29]]) ^ (l[a[53 + j] + m])), h, 8, 16, 22, 30);
  B(((h[b[30]]) ^ (l[a[54 + j] + m])), ((h[b[31]]) ^ (l[a[55 + j] + m])), ((h[b[32]]) ^ (l[a[56 + j] + m])), ((h[b[33]]) ^ (l[a[57 + j] + m])), ((h[b[34]]) ^ (l[a[58 + j] + m])), ((h[b[35]]) ^ (l[a[59 + j] + m])), h, 12, 27, 1, 17);
  C(((h[39]) ^ (l[a[60 + j] + m])), ((h[40]) ^ (l[a[61 + j] + m])), ((h[41]) ^ (l[a[62 + j] + m])), ((h[42]) ^ (l[a[63 + j] + m])), ((h[43]) ^ (l[a[64 + j] + m])), ((h[44]) ^ (l[a[65 + j] + m])), h, 23, 15, 29, 5);
  D(((h[43]) ^ (l[a[66 + j] + m])), ((h[44]) ^ (l[a[67 + j] + m])), ((h[45]) ^ (l[a[68 + j] + m])), ((h[46]) ^ (l[a[69 + j] + m])), ((h[47]) ^ (l[a[70 + j] + m])), ((h[48]) ^ (l[a[71 + j] + m])), h, 25, 19, 9, 0);
  E(((h[b[36]]) ^ (l[a[72 + j] + m])), ((h[b[37]]) ^ (l[a[73 + j] + m])), ((h[b[38]]) ^ (l[a[74 + j] + m])), ((h[b[39]]) ^ (l[a[75 + j] + m])), ((h[b[40]]) ^ (l[a[76 + j] + m])), ((h[b[41]]) ^ (l[a[77 + j] + m])), h, 7, 13, 24, 2);
  F(((h[b[42]]) ^ (l[a[78 + j] + m])), ((h[b[43]]) ^ (l[a[79 + j] + m])), ((h[b[44]]) ^ (l[a[80 + j] + m])), ((h[b[45]]) ^ (l[a[81 + j] + m])), ((h[b[46]]) ^ (l[a[82 + j] + m])), ((h[b[47]]) ^ (l[a[83 + j] + m])), h, 3, 28, 10, 18);
  G(((h[55]) ^ (l[a[84 + j] + m])), ((h[56]) ^ (l[a[85 + j] + m])), ((h[57]) ^ (l[a[86 + j] + m])), ((h[58]) ^ (l[a[87 + j] + m])), ((h[59]) ^ (l[a[88 + j] + m])), ((h[60]) ^ (l[a[89 + j] + m])), h, 31, 11, 21, 6);
  H(((h[59]) ^ (l[a[90 + j] + m])), ((h[60]) ^ (l[a[91 + j] + m])), ((h[61]) ^ (l[a[92 + j] + m])), ((h[62]) ^ (l[a[93 + j] + m])), ((h[63]) ^ (l[a[94 + j] + m])), ((h[32]) ^ (l[a[95 + j] + m])), h, 4, 26, 14, 20);
  ;
  j += 96;
  if (--o)
    goto start;
next:
  j -= (0x300 - 48);
  o = 8;
  i--;
  goto start;
}
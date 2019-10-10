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
  int h = get_local_size(0);

  vtype i[64];

  int j;

  int k, l;

  __local int m[56 * 256];
  int n = f * 56;
  for (l = 0; l < 56; l++)
    m[f * 56 + l] = c[e + l * g];
  barrier(1);

  {
    vtype o = 0;
    *((__private vtype*)((__private int*)&(i[0]) + (0))) = (o);
    *((__private vtype*)((__private int*)&(i[0]) + (1))) = (o);
    *((__private vtype*)((__private int*)&(i[0]) + (2))) = (o);
    *((__private vtype*)((__private int*)&(i[0]) + (3))) = (o);
    *((__private vtype*)((__private int*)&(i[0]) + (4))) = (o);
    *((__private vtype*)((__private int*)&(i[0]) + (5))) = (o);
    *((__private vtype*)((__private int*)&(i[0]) + (6))) = (o);
    *((__private vtype*)((__private int*)&(i[0]) + (7))) = (o);
    ;
    *((__private vtype*)((__private int*)&(i[8]) + (0))) = (o);
    *((__private vtype*)((__private int*)&(i[8]) + (1))) = (o);
    *((__private vtype*)((__private int*)&(i[8]) + (2))) = (o);
    *((__private vtype*)((__private int*)&(i[8]) + (3))) = (o);
    *((__private vtype*)((__private int*)&(i[8]) + (4))) = (o);
    *((__private vtype*)((__private int*)&(i[8]) + (5))) = (o);
    *((__private vtype*)((__private int*)&(i[8]) + (6))) = (o);
    *((__private vtype*)((__private int*)&(i[8]) + (7))) = (o);
    ;
    *((__private vtype*)((__private int*)&(i[16]) + (0))) = (o);
    *((__private vtype*)((__private int*)&(i[16]) + (1))) = (o);
    *((__private vtype*)((__private int*)&(i[16]) + (2))) = (o);
    *((__private vtype*)((__private int*)&(i[16]) + (3))) = (o);
    *((__private vtype*)((__private int*)&(i[16]) + (4))) = (o);
    *((__private vtype*)((__private int*)&(i[16]) + (5))) = (o);
    *((__private vtype*)((__private int*)&(i[16]) + (6))) = (o);
    *((__private vtype*)((__private int*)&(i[16]) + (7))) = (o);
    ;
    *((__private vtype*)((__private int*)&(i[24]) + (0))) = (o);
    *((__private vtype*)((__private int*)&(i[24]) + (1))) = (o);
    *((__private vtype*)((__private int*)&(i[24]) + (2))) = (o);
    *((__private vtype*)((__private int*)&(i[24]) + (3))) = (o);
    *((__private vtype*)((__private int*)&(i[24]) + (4))) = (o);
    *((__private vtype*)((__private int*)&(i[24]) + (5))) = (o);
    *((__private vtype*)((__private int*)&(i[24]) + (6))) = (o);
    *((__private vtype*)((__private int*)&(i[24]) + (7))) = (o);
    ;
    *((__private vtype*)((__private int*)&(i[32]) + (0))) = (o);
    *((__private vtype*)((__private int*)&(i[32]) + (1))) = (o);
    *((__private vtype*)((__private int*)&(i[32]) + (2))) = (o);
    *((__private vtype*)((__private int*)&(i[32]) + (3))) = (o);
    *((__private vtype*)((__private int*)&(i[32]) + (4))) = (o);
    *((__private vtype*)((__private int*)&(i[32]) + (5))) = (o);
    *((__private vtype*)((__private int*)&(i[32]) + (6))) = (o);
    *((__private vtype*)((__private int*)&(i[32]) + (7))) = (o);
    ;
    *((__private vtype*)((__private int*)&(i[40]) + (0))) = (o);
    *((__private vtype*)((__private int*)&(i[40]) + (1))) = (o);
    *((__private vtype*)((__private int*)&(i[40]) + (2))) = (o);
    *((__private vtype*)((__private int*)&(i[40]) + (3))) = (o);
    *((__private vtype*)((__private int*)&(i[40]) + (4))) = (o);
    *((__private vtype*)((__private int*)&(i[40]) + (5))) = (o);
    *((__private vtype*)((__private int*)&(i[40]) + (6))) = (o);
    *((__private vtype*)((__private int*)&(i[40]) + (7))) = (o);
    ;
    *((__private vtype*)((__private int*)&(i[48]) + (0))) = (o);
    *((__private vtype*)((__private int*)&(i[48]) + (1))) = (o);
    *((__private vtype*)((__private int*)&(i[48]) + (2))) = (o);
    *((__private vtype*)((__private int*)&(i[48]) + (3))) = (o);
    *((__private vtype*)((__private int*)&(i[48]) + (4))) = (o);
    *((__private vtype*)((__private int*)&(i[48]) + (5))) = (o);
    *((__private vtype*)((__private int*)&(i[48]) + (6))) = (o);
    *((__private vtype*)((__private int*)&(i[48]) + (7))) = (o);
    ;
    *((__private vtype*)((__private int*)&(i[56]) + (0))) = (o);
    *((__private vtype*)((__private int*)&(i[56]) + (1))) = (o);
    *((__private vtype*)((__private int*)&(i[56]) + (2))) = (o);
    *((__private vtype*)((__private int*)&(i[56]) + (3))) = (o);
    *((__private vtype*)((__private int*)&(i[56]) + (4))) = (o);
    *((__private vtype*)((__private int*)&(i[56]) + (5))) = (o);
    *((__private vtype*)((__private int*)&(i[56]) + (6))) = (o);
    *((__private vtype*)((__private int*)&(i[56]) + (7))) = (o);
    ;
  }
  int p;
  k = 0;
  p = 8;
  j = 25;
start:
  A(((i[b[0]]) ^ (m[a[0 + k] + n])), ((i[b[1]]) ^ (m[a[1 + k] + n])), ((i[b[2]]) ^ (m[a[2 + k] + n])), ((i[b[3]]) ^ (m[a[3 + k] + n])), ((i[b[4]]) ^ (m[a[4 + k] + n])), ((i[b[5]]) ^ (m[a[5 + k] + n])), i, 40, 48, 54, 62);
  B(((i[b[6]]) ^ (m[a[6 + k] + n])), ((i[b[7]]) ^ (m[a[7 + k] + n])), ((i[b[8]]) ^ (m[a[8 + k] + n])), ((i[b[9]]) ^ (m[a[9 + k] + n])), ((i[b[10]]) ^ (m[a[10 + k] + n])), ((i[b[11]]) ^ (m[a[11 + k] + n])), i, 44, 59, 33, 49);
  C(((i[7]) ^ (m[a[12 + k] + n])), ((i[8]) ^ (m[a[13 + k] + n])), ((i[9]) ^ (m[a[14 + k] + n])), ((i[10]) ^ (m[a[15 + k] + n])), ((i[11]) ^ (m[a[16 + k] + n])), ((i[12]) ^ (m[a[17 + k] + n])), i, 55, 47, 61, 37);
  D(((i[11]) ^ (m[a[18 + k] + n])), ((i[12]) ^ (m[a[19 + k] + n])), ((i[13]) ^ (m[a[20 + k] + n])), ((i[14]) ^ (m[a[21 + k] + n])), ((i[15]) ^ (m[a[22 + k] + n])), ((i[16]) ^ (m[a[23 + k] + n])), i, 57, 51, 41, 32);
  E(((i[b[12]]) ^ (m[a[24 + k] + n])), ((i[b[13]]) ^ (m[a[25 + k] + n])), ((i[b[14]]) ^ (m[a[26 + k] + n])), ((i[b[15]]) ^ (m[a[27 + k] + n])), ((i[b[16]]) ^ (m[a[28 + k] + n])), ((i[b[17]]) ^ (m[a[29 + k] + n])), i, 39, 45, 56, 34);
  F(((i[b[18]]) ^ (m[a[30 + k] + n])), ((i[b[19]]) ^ (m[a[31 + k] + n])), ((i[b[20]]) ^ (m[a[32 + k] + n])), ((i[b[21]]) ^ (m[a[33 + k] + n])), ((i[b[22]]) ^ (m[a[34 + k] + n])), ((i[b[23]]) ^ (m[a[35 + k] + n])), i, 35, 60, 42, 50);
  G(((i[23]) ^ (m[a[36 + k] + n])), ((i[24]) ^ (m[a[37 + k] + n])), ((i[25]) ^ (m[a[38 + k] + n])), ((i[26]) ^ (m[a[39 + k] + n])), ((i[27]) ^ (m[a[40 + k] + n])), ((i[28]) ^ (m[a[41 + k] + n])), i, 63, 43, 53, 38);
  H(((i[27]) ^ (m[a[42 + k] + n])), ((i[28]) ^ (m[a[43 + k] + n])), ((i[29]) ^ (m[a[44 + k] + n])), ((i[30]) ^ (m[a[45 + k] + n])), ((i[31]) ^ (m[a[46 + k] + n])), ((i[0]) ^ (m[a[47 + k] + n])), i, 36, 58, 46, 52);
  ;
  if (p == 0x100)
    goto next;
  A(((i[b[24]]) ^ (m[a[48 + k] + n])), ((i[b[25]]) ^ (m[a[49 + k] + n])), ((i[b[26]]) ^ (m[a[50 + k] + n])), ((i[b[27]]) ^ (m[a[51 + k] + n])), ((i[b[28]]) ^ (m[a[52 + k] + n])), ((i[b[29]]) ^ (m[a[53 + k] + n])), i, 8, 16, 22, 30);
  B(((i[b[30]]) ^ (m[a[54 + k] + n])), ((i[b[31]]) ^ (m[a[55 + k] + n])), ((i[b[32]]) ^ (m[a[56 + k] + n])), ((i[b[33]]) ^ (m[a[57 + k] + n])), ((i[b[34]]) ^ (m[a[58 + k] + n])), ((i[b[35]]) ^ (m[a[59 + k] + n])), i, 12, 27, 1, 17);
  C(((i[39]) ^ (m[a[60 + k] + n])), ((i[40]) ^ (m[a[61 + k] + n])), ((i[41]) ^ (m[a[62 + k] + n])), ((i[42]) ^ (m[a[63 + k] + n])), ((i[43]) ^ (m[a[64 + k] + n])), ((i[44]) ^ (m[a[65 + k] + n])), i, 23, 15, 29, 5);
  D(((i[43]) ^ (m[a[66 + k] + n])), ((i[44]) ^ (m[a[67 + k] + n])), ((i[45]) ^ (m[a[68 + k] + n])), ((i[46]) ^ (m[a[69 + k] + n])), ((i[47]) ^ (m[a[70 + k] + n])), ((i[48]) ^ (m[a[71 + k] + n])), i, 25, 19, 9, 0);
  E(((i[b[36]]) ^ (m[a[72 + k] + n])), ((i[b[37]]) ^ (m[a[73 + k] + n])), ((i[b[38]]) ^ (m[a[74 + k] + n])), ((i[b[39]]) ^ (m[a[75 + k] + n])), ((i[b[40]]) ^ (m[a[76 + k] + n])), ((i[b[41]]) ^ (m[a[77 + k] + n])), i, 7, 13, 24, 2);
  F(((i[b[42]]) ^ (m[a[78 + k] + n])), ((i[b[43]]) ^ (m[a[79 + k] + n])), ((i[b[44]]) ^ (m[a[80 + k] + n])), ((i[b[45]]) ^ (m[a[81 + k] + n])), ((i[b[46]]) ^ (m[a[82 + k] + n])), ((i[b[47]]) ^ (m[a[83 + k] + n])), i, 3, 28, 10, 18);
  G(((i[55]) ^ (m[a[84 + k] + n])), ((i[56]) ^ (m[a[85 + k] + n])), ((i[57]) ^ (m[a[86 + k] + n])), ((i[58]) ^ (m[a[87 + k] + n])), ((i[59]) ^ (m[a[88 + k] + n])), ((i[60]) ^ (m[a[89 + k] + n])), i, 31, 11, 21, 6);
  H(((i[59]) ^ (m[a[90 + k] + n])), ((i[60]) ^ (m[a[91 + k] + n])), ((i[61]) ^ (m[a[92 + k] + n])), ((i[62]) ^ (m[a[93 + k] + n])), ((i[63]) ^ (m[a[94 + k] + n])), ((i[32]) ^ (m[a[95 + k] + n])), i, 4, 26, 14, 20);
  ;
  k += 96;
  p--;
  ;

  if (p > 0)
    goto start;
  k -= (0x300 + 48);
  p = 0x108;

  if (--j)
    goto swap;

  for (l = 0; l < 64; l++)
    d[l * g + e] = i[l];

  return;
swap:
  A(((i[b[24]]) ^ (m[a[48 + k] + n])), ((i[b[25]]) ^ (m[a[49 + k] + n])), ((i[b[26]]) ^ (m[a[50 + k] + n])), ((i[b[27]]) ^ (m[a[51 + k] + n])), ((i[b[28]]) ^ (m[a[52 + k] + n])), ((i[b[29]]) ^ (m[a[53 + k] + n])), i, 8, 16, 22, 30);
  B(((i[b[30]]) ^ (m[a[54 + k] + n])), ((i[b[31]]) ^ (m[a[55 + k] + n])), ((i[b[32]]) ^ (m[a[56 + k] + n])), ((i[b[33]]) ^ (m[a[57 + k] + n])), ((i[b[34]]) ^ (m[a[58 + k] + n])), ((i[b[35]]) ^ (m[a[59 + k] + n])), i, 12, 27, 1, 17);
  C(((i[39]) ^ (m[a[60 + k] + n])), ((i[40]) ^ (m[a[61 + k] + n])), ((i[41]) ^ (m[a[62 + k] + n])), ((i[42]) ^ (m[a[63 + k] + n])), ((i[43]) ^ (m[a[64 + k] + n])), ((i[44]) ^ (m[a[65 + k] + n])), i, 23, 15, 29, 5);
  D(((i[43]) ^ (m[a[66 + k] + n])), ((i[44]) ^ (m[a[67 + k] + n])), ((i[45]) ^ (m[a[68 + k] + n])), ((i[46]) ^ (m[a[69 + k] + n])), ((i[47]) ^ (m[a[70 + k] + n])), ((i[48]) ^ (m[a[71 + k] + n])), i, 25, 19, 9, 0);
  E(((i[b[36]]) ^ (m[a[72 + k] + n])), ((i[b[37]]) ^ (m[a[73 + k] + n])), ((i[b[38]]) ^ (m[a[74 + k] + n])), ((i[b[39]]) ^ (m[a[75 + k] + n])), ((i[b[40]]) ^ (m[a[76 + k] + n])), ((i[b[41]]) ^ (m[a[77 + k] + n])), i, 7, 13, 24, 2);
  F(((i[b[42]]) ^ (m[a[78 + k] + n])), ((i[b[43]]) ^ (m[a[79 + k] + n])), ((i[b[44]]) ^ (m[a[80 + k] + n])), ((i[b[45]]) ^ (m[a[81 + k] + n])), ((i[b[46]]) ^ (m[a[82 + k] + n])), ((i[b[47]]) ^ (m[a[83 + k] + n])), i, 3, 28, 10, 18);
  G(((i[55]) ^ (m[a[84 + k] + n])), ((i[56]) ^ (m[a[85 + k] + n])), ((i[57]) ^ (m[a[86 + k] + n])), ((i[58]) ^ (m[a[87 + k] + n])), ((i[59]) ^ (m[a[88 + k] + n])), ((i[60]) ^ (m[a[89 + k] + n])), i, 31, 11, 21, 6);
  H(((i[59]) ^ (m[a[90 + k] + n])), ((i[60]) ^ (m[a[91 + k] + n])), ((i[61]) ^ (m[a[92 + k] + n])), ((i[62]) ^ (m[a[93 + k] + n])), ((i[63]) ^ (m[a[94 + k] + n])), ((i[32]) ^ (m[a[95 + k] + n])), i, 4, 26, 14, 20);
  ;
  k += 96;
  if (--p)
    goto start;
next:
  k -= (0x300 - 48);
  p = 8;
  j--;
  goto start;
}
__constant uint2 Ga[24] = {(uint2)(0x00000001, 0x00000000), (uint2)(0x00008082, 0x00000000), (uint2)(0x0000808a, 0x80000000), (uint2)(0x80008000, 0x80000000), (uint2)(0x0000808b, 0x00000000), (uint2)(0x80000001, 0x00000000), (uint2)(0x80008081, 0x80000000), (uint2)(0x00008009, 0x80000000), (uint2)(0x0000008a, 0x00000000), (uint2)(0x00000088, 0x00000000), (uint2)(0x80008009, 0x00000000), (uint2)(0x8000000a, 0x00000000),
                           (uint2)(0x8000808b, 0x00000000), (uint2)(0x0000008b, 0x80000000), (uint2)(0x00008089, 0x80000000), (uint2)(0x00008003, 0x80000000), (uint2)(0x00008002, 0x80000000), (uint2)(0x00000080, 0x80000000), (uint2)(0x0000800a, 0x00000000), (uint2)(0x8000000a, 0x80000000), (uint2)(0x80008081, 0x80000000), (uint2)(0x00008080, 0x80000000), (uint2)(0x80000001, 0x00000000), (uint2)(0x80008008, 0x80000000)};

uint2 A(const uint2 a, const uint b) {
  return (uint2)((a.x << b) ^ (a.y >> (32 - b)), (a.y << b) ^ (a.x >> (32 - b)));
}
uint2 B(const uint2 a, const uint b) {
  return (uint2)((a.y << b) ^ (a.x >> (32 - b)), (a.x << b) ^ (a.y >> (32 - b)));
}
void C(uint2* a, uint2* b, uint2* c, uint2* d, uint2* e, uint2* f, uint2* g, uint2* h, uint2* i, uint2* j, uint2* k, uint2* l, uint2* m, uint2* n, uint2* o, uint2* p, uint2* q, uint2* r, uint2* s, uint2* t, uint2* u, uint2* v, uint2* w, uint2* x, uint2* y) {
  uint2 z, aa, ab, ac, ad, ae, af;
  for (uint ag = 0; ag < 24; ++ag)
    do {
      z = *a ^ *f ^ *k ^ *p ^ *u ^ A(*c ^ *h ^ *m ^ *r ^ *w, 1);
      aa = *b ^ *g ^ *l ^ *q ^ *v ^ A(*d ^ *i ^ *n ^ *s ^ *x, 1);
      ab = *c ^ *h ^ *m ^ *r ^ *w ^ A(*e ^ *j ^ *o ^ *t ^ *y, 1);
      ac = *d ^ *i ^ *n ^ *s ^ *x ^ A(*a ^ *f ^ *k ^ *p ^ *u, 1);
      ad = *e ^ *j ^ *o ^ *t ^ *y ^ A(*b ^ *g ^ *l ^ *q ^ *v, 1);
      ae = *b ^ z;
      *a ^= ad;
      *b = B(*g ^ z, 12);
      *g = A(*j ^ ac, 20);
      *j = B(*w ^ aa, 29);
      *w = B(*o ^ ac, 7);
      *o = A(*u ^ ad, 18);
      *u = B(*c ^ aa, 30);
      *c = B(*m ^ aa, 11);
      *m = A(*n ^ ab, 25);
      *n = A(*t ^ ac, 8);
      *t = B(*x ^ ab, 24);
      *x = B(*p ^ ad, 9);
      *p = A(*e ^ ac, 27);
      *e = A(*y ^ ac, 14);
      *y = A(*v ^ z, 2);
      *v = B(*i ^ ab, 23);
      *i = B(*q ^ z, 13);
      *q = B(*f ^ ad, 4);
      *f = A(*d ^ ab, 28);
      *d = A(*s ^ ab, 21);
      *s = A(*r ^ aa, 15);
      *r = A(*l ^ z, 10);
      *l = A(*h ^ aa, 6);
      *h = A(*k ^ ad, 3);
      *k = A(ae, 1);
      ae = *a;
      af = *b;
      *a = bitselect(*a ^ *c, *a, *b);
      *b = bitselect(*b ^ *d, *b, *c);
      *c = bitselect(*c ^ *e, *c, *d);
      *d = bitselect(*d ^ ae, *d, *e);
      *e = bitselect(*e ^ af, *e, ae);
      ae = *f;
      af = *g;
      *f = bitselect(*f ^ *h, *f, *g);
      *g = bitselect(*g ^ *i, *g, *h);
      *h = bitselect(*h ^ *j, *h, *i);
      *i = bitselect(*i ^ ae, *i, *j);
      *j = bitselect(*j ^ af, *j, ae);
      ae = *k;
      af = *l;
      *k = bitselect(*k ^ *m, *k, *l);
      *l = bitselect(*l ^ *n, *l, *m);
      *m = bitselect(*m ^ *o, *m, *n);
      *n = bitselect(*n ^ ae, *n, *o);
      *o = bitselect(*o ^ af, *o, ae);
      ae = *p;
      af = *q;
      *p = bitselect(*p ^ *r, *p, *q);
      *q = bitselect(*q ^ *s, *q, *r);
      *r = bitselect(*r ^ *t, *r, *s);
      *s = bitselect(*s ^ ae, *s, *t);
      *t = bitselect(*t ^ af, *t, ae);
      ae = *u;
      af = *v;
      *u = bitselect(*u ^ *w, *u, *v);
      *v = bitselect(*v ^ *x, *v, *w);
      *w = bitselect(*w ^ *y, *w, *x);
      *x = bitselect(*x ^ ae, *x, *y);
      *y = bitselect(*y ^ af, *y, ae);
      *a ^= Ga[ag];
    } while (0);
}

__attribute__((reqd_work_group_size(128, 1, 1))) __kernel void D(

    const uint a,

    __global const uint2* restrict b, __global uint* restrict c) {
  uint2 d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab;

  d = b[0];
  e = b[1];
  f = b[2];
  g = b[3];
  h = b[4];
  i = b[5];
  j = b[6];
  k = b[7];
  l = b[8];
 m = (uint2)(b9].x, aget_global_id(0));
 n = (uint2)(1, 0);
 o = 0;
 p = 0;
 q = 0;
 r = 0;
 s = 0;
 t = (uint2)(0, 0x80000000U);
 u = 0;
 v = 0;
 w = 0;
 x = 0;
 y = 0;
 z = 0;
 aa = 0;
 ab = 0;

 C(&d, &e, &f, &g, &h, &i, &j, &k, &l, &m, &n, &o, &p, &q, &r, &s, &t, &u, &v, &w, &x, &y, &z, &aa, &ab);

 if ((g.y & 0xFFFFFFF0U) == 0) {
   c[c[(0x0F)]++] = a + get_global_id(0);
 }
}
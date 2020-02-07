typedef struct {
  char a;
  int b;
  int c;
  char d;
} S;

void A(global float4* a, global float4* b) {
  int c = get_global_id(0);
  b[c].z = 42.f;
}

void B(global float4* a, global float4* b) {
  int c = get_global_id(0);
  b[c].z = 7.f;
  b[c].y = 42.f;
}

void C(global float4* a, global float4* b) {
  int c = get_global_id(0);
  b[c].zy = (float2)(7.f, 42.f);
}

void D(global float4* a, global float4* b) {
  int c = get_global_id(0);
  b[c].y = b[c].z;
}

void E(global float4* a, global float4* b) {
  int c = get_global_id(0);
  b[c].wzyx = b[c];
}

void F(global float4* a, global float4* b) {
  int c = get_global_id(0);
  b[c].zy = b[c].yz;
}

void G(global float4* a, global float4* b) {
  int c = get_global_id(0);
  b[c].wzyx = a[c];
}

void H(global float4* a, global float4* b) {
  int c = get_global_id(0);
  b[c].zy = a[c].yz;
}

void I(global float4* a, global float4* b) {
  int c = get_global_id(0);

  float4 d = b[c];
  d.z = 42.f;
  b[c] = d;
  b[c + 1] = d;
}

void J(global S* a, global S* b) {
  int c = get_global_id(0);
  b[c].c = 42;
}

void K(global S* a, global S* b) {
  int c = get_global_id(0);
  b[c].c = b[c].b;
}

void L(global S* a, global S* b) {
  int c = get_global_id(0);
  b[c].c = a[c].b;
}

kernel void M(global float4* a, global float4* b, global float4* c, global float4* d, global float4* e, global float4* f, global float4* g, global float4* h, global float4* i, global float4* j,

              global S* k, global S* l, global S* m, global S* n,

              global float* o) {
  A(a, b);
  B(a, c);
  C(a, d);
  D(a, e);
  E(a, f);
  F(a, g);
  G(a, h);
  H(a, i);
  I(a, j);

  J(k, l);
  K(k, m);
  L(k, n);
}
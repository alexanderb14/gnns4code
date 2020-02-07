struct S {
  int a;
  float b;
};

kernel void A(global int* a, global float* b, global struct S* c) {
  struct S d;
  local struct S e;
  d.a = *a;
  d.b = *b;
  e = d;
  e.a += 1;
  e.b += 0.1f;
  *c = e;
  c->a += 2;
  c->b += 0.2f;
}
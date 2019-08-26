typedef struct Foo {
  int x;
  float y;
  float z;
} Foo;

__kernel void A() {
  __local int a;
  __local int b[128];
  __local Foo c;
  __local Foo d[64];

  a = 1;
  b[0] = 1;
  c.x = 1;
  d[0].x = 1;
}
struct __attribute__((packed)) Foo {
  char a;
  int b;
};

kernel void A(struct Foo a, global int* b) {
  *b = a.b;
}
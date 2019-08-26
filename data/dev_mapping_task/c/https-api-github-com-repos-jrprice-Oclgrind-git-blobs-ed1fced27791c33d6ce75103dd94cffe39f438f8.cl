struct S {
  char a;
  int b;
  char c;
};

kernel void A(global struct S* a) {
  struct S b;
  b.a = 42;
  b.b = 0xF9FFFFF9;
  b.c = 127;

  *a = b;
}
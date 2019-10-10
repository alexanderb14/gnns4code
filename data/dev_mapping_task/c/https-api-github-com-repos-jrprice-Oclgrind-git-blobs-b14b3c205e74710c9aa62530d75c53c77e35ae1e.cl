struct T {
  char a;
  int b;
  char c;
};

struct S {
  char a;
  int b;
  char c;
  struct T d;
};

kernel void A(global struct S* a) {
  struct S b;
  b.a = 1;
  b.b = 0x02000002;
  b.c = 3;
  b.d.a = 4;
  b.d.b = 0x05000005;
  b.d.c = 6;

  *a = b;
}
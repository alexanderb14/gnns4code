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

kernel void A(local int* a, global struct S* b) {
  struct S c = { 1, 0x02000002, 3b * a c;
}
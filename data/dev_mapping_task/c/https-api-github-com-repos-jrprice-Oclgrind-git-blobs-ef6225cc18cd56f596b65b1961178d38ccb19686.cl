struct S {
  char a;
  int b;
  char c;
};

kernel void A(local struct S* a, global struct S* b) {
  int c = get_local_id(0);

  struct S d;
  d.a = 42;
  d.b = 0xF9FFFFF9;
  d.c = 127;

  if (c == 0) {
    *a = d;
  }
  barrier(1);
  if (c == 1) {
    *b = *a;
  }
}
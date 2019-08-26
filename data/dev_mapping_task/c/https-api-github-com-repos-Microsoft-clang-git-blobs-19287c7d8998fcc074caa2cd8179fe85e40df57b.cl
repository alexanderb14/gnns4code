void A(int* a) {
  *a = 1;
}

void B(void) {
  int a;
  a = 1;

  int b = 2;

  int c[100];
  c[0] = 3;

  int* d = &a;

  int* e = c;

  A(&a);

  const int f = 4;
  a = f;
}
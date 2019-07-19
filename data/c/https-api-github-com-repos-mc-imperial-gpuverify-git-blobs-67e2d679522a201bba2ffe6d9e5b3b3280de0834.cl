void A(int* a) {
  *a = 1;
}

void B() {
  int* a;
  int b;

  a = &b;

  A(&b);
  A(a);

  if (b == 1 && *a == 1) {
  }
}

__kernel void C(__global int* a, uint b) {
  B();
}
__attribute__((overloadable)) void A(int a); __attribute__((overloadable)) void A(long a); void B(long a) {
  A(a);
}

void C(long a) {
  A(a);
}
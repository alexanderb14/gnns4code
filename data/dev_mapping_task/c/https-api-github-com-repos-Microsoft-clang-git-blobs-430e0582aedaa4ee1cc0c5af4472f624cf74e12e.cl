void A(char* a); __attribute__((always_inline)) void B() {
  char a;
  A(&a);
}

void C() {
  B();
}
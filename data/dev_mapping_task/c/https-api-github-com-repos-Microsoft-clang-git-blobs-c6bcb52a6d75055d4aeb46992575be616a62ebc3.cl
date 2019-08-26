void A(void) __attribute__((convergent)); void B(void); void C(void) __attribute__((noduplicate)); void D(void); void E(void); void F(int a) {
  if (a) {
    D();
  }
  B();
  if (a) {
    E();
  }
}
void G(int a) {
  if (a) {
    D();
  }
  A();
  if (a) {
    E();
  }
}
void H() {
  for (int a = 0; a < 10; a++)
    A();
}
void I() {
  for (int a = 0; a < 10; a++)
    C();
}
void A(void) __attribute__((convergent)); void B(void) __attribute__((convergent(1))); void C(int a __attribute__((convergent))); void D(void) {
  int a __attribute__((convergent));
}
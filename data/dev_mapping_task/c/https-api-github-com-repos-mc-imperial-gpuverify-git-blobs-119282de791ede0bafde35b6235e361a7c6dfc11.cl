void A(int* a) {
}

__kernel void B() {
  int a = 0;
  a = 0;

  A(&a);
}
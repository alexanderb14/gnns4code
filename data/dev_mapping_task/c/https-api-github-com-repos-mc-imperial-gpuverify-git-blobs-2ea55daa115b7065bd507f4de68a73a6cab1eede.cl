void A(int4* a) {
}

__kernel void B() {
  int4 a;
  A(&a);
}
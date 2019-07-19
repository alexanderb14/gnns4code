void A(local int*); __kernel void B(void) {
  __local int a;
  A(&a);
}

__kernel void __attribute__((__overloadable__)) C(local int* a) {
  *a = 5;
}
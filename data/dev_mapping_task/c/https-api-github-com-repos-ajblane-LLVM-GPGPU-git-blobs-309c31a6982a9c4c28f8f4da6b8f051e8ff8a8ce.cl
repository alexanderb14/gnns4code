__kernel void A(void) {
  __local int a;
  ++a;
}

__kernel void __attribute__((__overloadable__)) B(local int* a) {
  *a = 5;
}
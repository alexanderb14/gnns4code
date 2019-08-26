void A(__global int* a) __attribute__((noreturn)); __kernel void B(__global int* a) {
  A(a);
}
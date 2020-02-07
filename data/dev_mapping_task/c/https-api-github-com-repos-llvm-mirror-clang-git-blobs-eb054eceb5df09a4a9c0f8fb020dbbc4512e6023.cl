__attribute__((overloadable)) void A(read_only image1d_t a); __attribute__((overloadable)) void A(write_only image1d_t b); kernel void B(read_only image1d_t a, write_only image1d_t b) {
  A(a);

  A(b);
}
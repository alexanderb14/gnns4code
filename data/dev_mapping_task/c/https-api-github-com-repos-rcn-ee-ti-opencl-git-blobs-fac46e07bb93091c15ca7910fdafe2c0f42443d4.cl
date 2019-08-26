void A(uint32_t a, global uint32_t* b); kernel void B(uint32_t a, global uint32_t* b) {
  A(a, b);
}
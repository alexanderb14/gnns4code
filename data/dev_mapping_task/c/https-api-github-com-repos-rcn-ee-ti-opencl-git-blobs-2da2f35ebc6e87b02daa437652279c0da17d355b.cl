void A(global uint32_t* a); kernel void B(global uint32_t* a) {
  A(a);
}
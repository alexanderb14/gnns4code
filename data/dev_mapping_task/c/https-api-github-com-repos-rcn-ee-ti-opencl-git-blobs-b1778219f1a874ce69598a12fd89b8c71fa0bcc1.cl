void A(global uint32_t* a); void B(global uint32_t* a); kernel void C(global uint32_t* a) {
  A(a);
}

kernel void D(global uint32_t* a) {
  B(a);
}
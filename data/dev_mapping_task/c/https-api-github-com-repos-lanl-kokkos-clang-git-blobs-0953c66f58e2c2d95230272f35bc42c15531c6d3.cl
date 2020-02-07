typedef unsigned int uint2 __attribute((ext_vector_type(2))); void A(void) {
  (uint2)(((uint2)(0)).s0, 0);
}
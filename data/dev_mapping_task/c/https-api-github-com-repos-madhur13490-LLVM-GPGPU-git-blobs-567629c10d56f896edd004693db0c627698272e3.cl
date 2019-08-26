typedef __attribute__((ext_vector_type(2))) unsigned int uint2; typedef __attribute__((ext_vector_type(2))) int int2; void A() {
  uint2 a, b;
  int2 c = a != b;
}
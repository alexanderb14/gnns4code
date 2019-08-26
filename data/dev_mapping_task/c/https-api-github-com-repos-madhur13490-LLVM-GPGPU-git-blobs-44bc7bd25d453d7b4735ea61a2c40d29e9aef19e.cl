typedef char char3 __attribute((ext_vector_type(3))); ; void A(char3* a, char3* b) {
  *a = *b;
}
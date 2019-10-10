typedef __attribute__((ext_vector_type(2))) char char2; typedef __attribute__((ext_vector_type(4))) unsigned int uint4; typedef __attribute__((ext_vector_type(8))) long long8; void A() {
  char2 a = (char2)(1);
  uint4 b = (uint4)(1);
  long8 c = (long8)(1);

  a++;
  --a;
  b--;
  ++b;
  c++;
}
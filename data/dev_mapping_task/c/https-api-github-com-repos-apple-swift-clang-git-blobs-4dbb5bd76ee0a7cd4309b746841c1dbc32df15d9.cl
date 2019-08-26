typedef float float8 __attribute__((ext_vector_type(8))); void A() {
  float8 a = (float8)(0, 0, 0, 0, 0, 0, 0, 0);

  a.s01234;
  a.xyzxy;
}
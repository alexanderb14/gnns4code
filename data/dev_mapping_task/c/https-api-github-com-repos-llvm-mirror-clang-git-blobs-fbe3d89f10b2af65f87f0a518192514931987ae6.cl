typedef __attribute__((ext_vector_type(4))) unsigned char uchar4; typedef __attribute__((ext_vector_type(8))) unsigned char uchar8; void A(uchar8 a) {
  uchar4 b[4] = {{(uchar4){a.lo}}};
}
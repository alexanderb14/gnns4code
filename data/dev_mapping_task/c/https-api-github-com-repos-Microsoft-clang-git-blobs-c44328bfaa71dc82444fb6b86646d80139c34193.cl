typedef unsigned char __attribute__((ext_vector_type(3))) uchar3; kernel void A(uchar3 a) {
  a.odd = 1;
}

kernel void B(uchar3 a) {
  a.hi = 2;
}
kernel void A(__global int* restrict a, const int b, volatile int c, __constant float* restrict d) {
  *a = b + c;
}

kernel void B(read_only image1d_t a, image2d_t b, write_only image2d_array_t c) {
}

kernel void C(__global half* a) {
}
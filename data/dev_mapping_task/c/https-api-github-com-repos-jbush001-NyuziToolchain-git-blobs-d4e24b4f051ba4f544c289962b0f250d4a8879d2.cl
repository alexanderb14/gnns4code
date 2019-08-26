global int* A(image2d_t a) {
  return __builtin_astype(a, global int*);
}
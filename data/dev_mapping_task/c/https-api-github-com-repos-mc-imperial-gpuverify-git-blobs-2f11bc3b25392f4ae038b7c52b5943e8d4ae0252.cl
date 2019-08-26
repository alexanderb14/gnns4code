float* A(float* a); __kernel void B() {
  float a = 0;
  float* b = A(&a);
  b[0] = b[0] + 1;
}
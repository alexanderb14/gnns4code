__kernel void A(const int a, __global bool* b) {
  float c = a;
  c = sqrt(c);
  int d = __clc_ceil(c);
  for (int e = 2; e <= d; e++) {
    if (d % e == 0) {
      *b = false;
      return;
    }
  }
  *b = true;
}
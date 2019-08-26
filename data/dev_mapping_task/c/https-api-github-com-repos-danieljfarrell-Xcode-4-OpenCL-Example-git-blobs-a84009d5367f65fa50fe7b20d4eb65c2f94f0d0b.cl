kernel void A(global float* a, global float* b, int c, int d) {
  size_t e = get_global_id(0);
  float f = 0.0;
  int g;
  for (g = 0; g < d; g++) {
    f += a[g + c * e];
  }
  b[e] = f;
}
__kernel void A(const int a, const int b, __global const float* c, __global float* d) {
  int e = 4;
  const int f = get_global_id(0) * e;
  if (f < b) {
    for (int g = 0; g < b; g++) {
      d[(g + 0) * b + f] = c[f * a + (g + 0)];
      d[(g + 1) * b + f] = c[f * a + (g + 1)];
      d[(g + 2) * b + f] = c[f * a + (g + 2)];
      d[(g + 3) * b + f] = c[f * a + (g + 3)];
    }
  }
}
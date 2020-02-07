__kernel void A(const int a, const int b, __global const float* c, __global float* d) {
  int e = 4;
  const int f = get_global_id(0) * e;
  if (f < a) {
    for (int g = 0; g < b; g++) {
      d[(f + 0) * b + g] = c[g * a + (f + 0)];
      d[(f + 1) * b + g] = c[g * a + (f + 1)];
      d[(f + 2) * b + g] = c[g * a + (f + 2)];
      d[(f + 3) * b + g] = c[g * a + (f + 3)];
    }
  }
}
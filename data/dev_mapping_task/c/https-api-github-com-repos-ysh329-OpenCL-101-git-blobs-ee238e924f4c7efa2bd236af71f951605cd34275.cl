__kernel void A(const int a, const int b, __global const float* c, __global float* d) {
  int e = 4;
  const int f = get_global_id(0) * e;
  const int g = get_global_id(1) * e;

  if (g < a && f < b) {
    d[(g + 0) * b + (f + 0)] = c[(f + 0) * a + (g + 0)];
    d[(g + 0) * b + (f + 1)] = c[(f + 1) * a + (g + 0)];
    d[(g + 0) * b + (f + 2)] = c[(f + 2) * a + (g + 0)];
    d[(g + 0) * b + (f + 3)] = c[(f + 3) * a + (g + 0)];

    d[(g + 1) * b + (f + 0)] = c[(f + 0) * a + (g + 1)];
    d[(g + 1) * b + (f + 1)] = c[(f + 1) * a + (g + 1)];
    d[(g + 1) * b + (f + 2)] = c[(f + 2) * a + (g + 1)];
    d[(g + 1) * b + (f + 3)] = c[(f + 3) * a + (g + 1)];

    d[(g + 2) * b + (f + 0)] = c[(f + 0) * a + (g + 2)];
    d[(g + 2) * b + (f + 1)] = c[(f + 1) * a + (g + 2)];
    d[(g + 2) * b + (f + 2)] = c[(f + 2) * a + (g + 2)];
    d[(g + 2) * b + (f + 3)] = c[(f + 3) * a + (g + 2)];

    d[(g + 3) * b + (f + 0)] = c[(f + 0) * a + (g + 3)];
    d[(g + 3) * b + (f + 1)] = c[(f + 1) * a + (g + 3)];
    d[(g + 3) * b + (f + 2)] = c[(f + 2) * a + (g + 3)];
    d[(g + 3) * b + (f + 3)] = c[(f + 3) * a + (g + 3)];
  }
}
__kernel void A(int a, int b, __global int* c, __global int* d, __global int* e) {
  int f = get_global_id(0);
  int g = 0;

  int h[1024];

  if (f < b) {
    for (int i = 0; i < a; ++i)
      h[i] = c[f * b + i];

    for (int j = 0; j < a; ++j) {
      g = 0;
      for (int i = 0; i < a; ++i) {
        g += h[i] * d[i * a + j];
      }
      e[f * b + j] = g;
    }
  }
}
__kernel void A(int a, int b, __global int* c, __global int* d, __global int* e) {
  int f = get_global_id(0);
  int g = 0;

  if (f < b) {
    for (int h = 0; h < a; ++h) {
      g = 0;
      for (int i = 0; i < a; ++i) {
        g += c[f * b + i] * d[i * a + h];
      }
      e[f * b + h] = g;
    }
  }
}
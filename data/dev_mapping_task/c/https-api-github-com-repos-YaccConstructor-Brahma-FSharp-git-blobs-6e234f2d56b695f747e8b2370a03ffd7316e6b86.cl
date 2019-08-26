__kernel void A(const int a, const int b, const int c, const __global int* d, const __global int* e, __global int* f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);

  float i = 0.0f;
  for (int j = 0; j < c; j++) {
    i += d[j * a + g] * e[h * c + j];
  }

  f[h * a + g] = i;
}
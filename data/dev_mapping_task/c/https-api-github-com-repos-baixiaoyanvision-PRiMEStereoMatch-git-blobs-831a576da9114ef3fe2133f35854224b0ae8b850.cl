__kernel void A(__global const float* a, __global const float* b, const int c, const int d, const int e, __global char* f, __global char* g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);

  const int j = i * d;
  int k;

  float l = 1e5f;
  char m = 0;

  for (int n = 1; n < e; n++) {
    float o = *(a + ((n * c) + i) * d + h);
    if (o < l) {
      l = o;
      m = n;
    }
  }
  *(f + j + h) = m;

  l = 1e5f;
  m = 0;

  for (int n = 1; n < e; n++) {
    float o = *(b + ((n * c) + i) * d + h);
    if (o < l) {
      l = o;
      m = n;
    }
  }
  *(g + j + h) = m;
}
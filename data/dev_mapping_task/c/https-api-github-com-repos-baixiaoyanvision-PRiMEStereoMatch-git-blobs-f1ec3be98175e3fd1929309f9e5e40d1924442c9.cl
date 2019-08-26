__kernel void A(__global const double* restrict a, __global const double* restrict b, const int c, const int d, const int e, __global char* restrict f, __global char* restrict g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);

  const int j = i * d;
  int k;

  double l = 1e10;
  char m = 0;

  for (int n = 1; n < e; n++) {
    k = ((n * c) + i) * d + h;
    double o = *(a + k);
    if (o < l) {
      l = o;
      m = n;
    }
  }
  *(f + j + h) = m * 4;

  l = 1e10;
  m = 0;

  for (int n = 1; n < e; n++) {
    k = ((n * c) + i) * d + h;
    double o = *(b + k);
    if (o < l) {
      l = o;
      m = n;
    }
  }
  *(g + j + h) = m * 4;
}
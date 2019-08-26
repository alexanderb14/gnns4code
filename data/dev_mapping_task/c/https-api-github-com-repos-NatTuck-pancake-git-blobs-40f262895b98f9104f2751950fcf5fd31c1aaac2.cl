kernel void A(global float* a, global float* b, global float* c, long d, long e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);

  for (long h = 0; h < e; ++h) {
    float i = a[d * g + f];

    for (int j = 0; j < d; ++j) {
      i += b[d * g + j] * c[d * j + f];
    }

    a[d * g + f] = i;
  }
}
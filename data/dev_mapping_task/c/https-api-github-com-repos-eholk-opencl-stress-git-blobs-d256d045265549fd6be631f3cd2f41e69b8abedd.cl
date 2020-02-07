__kernel void A(__global int* a, __global int* b) {
  int c = get_global_id(0);

  int d = get_global_size(0);

  int e = 0;
  for (int f = 0; f < d; f++) {
    int g = a[c];
    for (int h = 0; h < g; ++h) {
      int i = b[c % f];
      for (int j = 0; j < i; ++j) {
        for (int k = 0; k < a[b[c]]; ++k) {
          e += a[h] * a[f] / b[j] * sqrt((float)k);
        }
      }
    }
  }

  a[c] = e;
}
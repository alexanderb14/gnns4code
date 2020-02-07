__kernel void A(__global int* a) {
  int b = get_global_id(0);

  int c = get_global_size(0);

  int d = 0;
  for (int e = 0; e < c; e++) {
    int f = a[b];
    for (int g = 0; g < f; ++g) {
      d += a[g] * a[e];
    }
  }

  a[b] = d;
}
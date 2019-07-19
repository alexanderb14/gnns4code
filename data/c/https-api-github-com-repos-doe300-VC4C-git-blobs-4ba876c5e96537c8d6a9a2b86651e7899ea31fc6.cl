__kernel void A(__global int* a, __global uint* b, uint c) {
  int d = a[0];
  uint e = 0;
  for (uint f = 1; f < c; f++) {
    int g = a[f];

    if (((g) < (d))) {
      d = g;
      e = f;
    }
  }
  *b = e;
}
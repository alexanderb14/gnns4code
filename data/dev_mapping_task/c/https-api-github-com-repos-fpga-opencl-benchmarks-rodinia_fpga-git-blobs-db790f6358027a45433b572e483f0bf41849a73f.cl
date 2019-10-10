__kernel void A(__global int* a, __global int* b, __global int* c, int d, int e) {
  for (int f = 0; f < e - 1; f++) {
    int g;
    for (int h = 0; h < d; h++) {
      g = b[h];
      if (h > 0) {
        g = ((g) <= (b[h - 1]) ? (g) : (b[h - 1]));
      }
      if (h < d - 1) {
        g = ((g) <= (b[h + 1]) ? (g) : (b[h + 1]));
      }
      c[h] = a[d * f + h] + g;
    }

    if (f != e - 2) {
      f++;
    } else {
      break;
    }

    for (int h = 0; h < d; h++) {
      g = c[h];
      if (h > 0) {
        g = ((g) <= (c[h - 1]) ? (g) : (c[h - 1]));
      }
      if (h < d - 1) {
        g = ((g) <= (c[h + 1]) ? (g) : (c[h + 1]));
      }
      b[h] = a[d * f + h] + g;
    }
  }
}
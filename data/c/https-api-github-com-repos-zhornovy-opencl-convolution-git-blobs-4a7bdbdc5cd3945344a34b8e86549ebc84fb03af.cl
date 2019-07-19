__kernel void A(__global uchar* a, __global uchar* b) {
  float c[] = {-1, 0, 1, -2, 0, 2, -1, 0, 1};
  uint d = 3;
  uint e = 3, f = 640, g = 480;
  uint h = get_global_id(0);
  int i = 0;
  while (h > f) {
    h -= f;
    i++;
  }
  if (h > 5 && h < f - 5 && i > 5 && i < g - 5) {
    float j = 0, k = 0;
    for (uint l = 0; l < d; l++) {
      for (uint m = 0; m < e; m++) {
        int n = h + (l - (d / 2));
        int o = i + (m - (e / 2));

        if ((n < 0) || (n >= f) || (o < 0) || (o >= g))
          continue;

        uchar p = a[n + o * f];
        float q = c[l + m * d];
        j += p * q;

        k += q;
      }
    }
    if (k == 0)
      k = 1;
    j /= k;
    b[h + i * f] = (uchar)j;
  } else {
    b[h + i * f] = (uchar)(250);
  }
  barrier(1);
}
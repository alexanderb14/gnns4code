__kernel void A(__global unsigned char* a, __global unsigned char* b, int c, int d) {
  unsigned int e = get_global_id(0);

  unsigned int f, g;

  unsigned int h = e * 4;

  f = e / c;
  g = e % c;

  unsigned char i[(7 * 7)];
  unsigned int j, k, l, m, n, o;
  unsigned int p;

  unsigned int q = ((g * c + f) * 4);

  if ((f <= (c - 7 - 1)) && (g <= (d - 7 - 1)) && (f >= 7) && (g >= 7)) {
    p = 0;
    for (int r = 0; r < 7; ++r) {
      for (int s = 0; s < 7; ++s) {
        i[p] = a[(((g - r) * c + (f - s)) * 4)];
        p++;
      }
    }

    j = 0;
    for (int r = 0; r < (7 * 7); ++r) {
      j += i[r];
    }
    k = j / (7 * 7);

    l = 0;
    for (int r = 0; r < (7 * 7); ++r) {
      m = i[r] - k;
      l += m * m;
    }
    l = l / (7 * 7);

    p = 0;
    for (int r = 0; r < 7; ++r) {
      for (int s = 0; s < 7; ++s) {
        i[p] = a[(((g - r) * c + (f + s)) * 4)];
        p++;
      }
    }

    j = 0;
    for (int r = 0; r < (7 * 7); ++r) {
      j += i[r];
    }
    o = j / (7 * 7);

    n = 0;
    for (int r = 0; r < (7 * 7); ++r) {
      m = i[r] - o;
      n += m * m;
    }
    n = n / (7 * 7);

    if (n < l) {
      l = n;
      k = o;
    }

    p = 0;
    for (int r = 0; r < 7; ++r) {
      for (int s = 0; s < 7; ++s) {
        i[p] = a[(((g + r) * c + (f - s)) * 4)];
        p++;
      }
    }

    j = 0;
    for (int r = 0; r < (7 * 7); ++r) {
      j += i[r];
    }
    o = j / (7 * 7);

    n = 0;
    for (int r = 0; r < (7 * 7); ++r) {
      m = i[r] - o;
      n += m * m;
    }
    n = n / (7 * 7);

    if (n < l) {
      l = n;
      k = o;
    }

    p = 0;
    for (int r = 0; r < 7; ++r) {
      for (int s = 0; s < 7; ++s) {
        i[p] = a[(((g + r) * c + (f + s)) * 4)];
        p++;
      }
    }

    j = 0;
    for (int r = 0; r < (7 * 7); ++r) {
      j += i[r];
    }
    o = j / (7 * 7);

    n = 0;
    for (int r = 0; r < (7 * 7); ++r) {
      m = i[r] - o;
      n += m * m;
    }
    n = n / (7 * 7);

    if (n < l) {
      l = n;
      k = o;
    }

    if (k > 255) {
      b[q] = 255;
      b[q + 1] = 255;
      b[q + 2] = 255;
    } else {
      b[q] = k;
      b[q + 1] = k;
      b[q + 2] = k;
    }

    b[q + 3] = a[h + 3];
  } else {
    b[q] = 0;
    b[q + 1] = 0;
    b[q + 2] = 0;
    b[q + 3] = 0;
  }
}
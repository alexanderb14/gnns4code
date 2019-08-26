__kernel void A(__global char* a, __global char* b, int c, int d) {
  unsigned int e = get_global_id(0);

  unsigned int f, g;

  unsigned int h = e * 4;

  f = e / c;
  g = e % c;

  unsigned char i[9];
  unsigned int j, k, l, m, n, o;

  unsigned int p = ((g * c + f) * 4);

  if ((f <= (c - 4)) && (g <= (d - 4)) && (f >= 3) && (g >= 3)) {
    i[0] = a[(((g - 2) * c + (f - 2)) * 4)];
    i[1] = a[(((g - 2) * c + (f - 1)) * 4)];
    i[2] = a[(((g - 2) * c + (f)) * 4)];
    i[3] = a[(((g - 1) * c + (f - 2)) * 4)];
    i[4] = a[(((g - 1) * c + (f - 1)) * 4)];
    i[5] = a[(((g - 1) * c + (f)) * 4)];
    i[6] = a[(((g)*c + (f - 2)) * 4)];
    i[7] = a[(((g)*c + (f - 1)) * 4)];
    i[8] = a[(((g)*c + (f)) * 4)];

    j = 0;
    for (int e = 0; e <= 8; ++e) {
      j += i[e];
    }
    k = j / 9;

    l = 0;
    for (int e = 0; e <= 8; ++e) {
      m = i[e] - k;
      l += m * m;
    }
    l = l / 9;

    i[0] = a[(((g - 2) * c + (f)) * 4)];
    i[1] = a[(((g - 2) * c + (f + 1)) * 4)];
    i[2] = a[(((g - 2) * c + (f + 2)) * 4)];
    i[3] = a[(((g - 1) * c + (f)) * 4)];
    i[4] = a[(((g - 1) * c + (f + 1)) * 4)];
    i[5] = a[(((g - 1) * c + (f + 2)) * 4)];
    i[6] = a[(((g)*c + (f)) * 4)];
    i[7] = a[(((g)*c + (f + 1)) * 4)];
    i[8] = a[(((g)*c + (f + 2)) * 4)];

    j = 0;
    for (int e = 0; e <= 8; ++e) {
      j += i[e];
    }
    o = j / 9;

    n = 0;
    for (int e = 0; e <= 8; ++e) {
      m = i[e] - o;
      n += m * m;
    }
    n = n / 9;

    if (n < l) {
      l = n;
      k = o;
    }

    i[0] = a[(((g)*c + (f - 2)) * 4)];
    i[1] = a[(((g)*c + (f - 1)) * 4)];
    i[2] = a[(((g)*c + (f)) * 4)];
    i[3] = a[(((g + 1) * c + (f - 2)) * 4)];
    i[4] = a[(((g + 1) * c + (f - 1)) * 4)];
    i[5] = a[(((g + 1) * c + (f)) * 4)];
    i[6] = a[(((g + 2) * c + (f - 2)) * 4)];
    i[7] = a[(((g + 2) * c + (f - 1)) * 4)];
    i[8] = a[(((g + 2) * c + (f)) * 4)];

    j = 0;
    for (int e = 0; e <= 8; ++e) {
      j += i[e];
    }
    o = j / 9;

    n = 0;
    for (int e = 0; e <= 8; ++e) {
      m = i[e] - o;
      n += m * m;
    }
    n = n / 9;

    if (n < l) {
      l = n;
      k = o;
    }

    i[0] = a[(((g)*c + (f)) * 4)];
    i[1] = a[(((g)*c + (f + 1)) * 4)];
    i[2] = a[(((g)*c + (f + 2)) * 4)];
    i[3] = a[(((g + 1) * c + (f)) * 4)];
    i[4] = a[(((g + 1) * c + (f + 1)) * 4)];
    i[5] = a[(((g + 1) * c + (f + 2)) * 4)];
    i[6] = a[(((g + 2) * c + (f)) * 4)];
    i[7] = a[(((g + 2) * c + (f + 1)) * 4)];
    i[8] = a[(((g + 2) * c + (f + 2)) * 4)];

    j = 0;
    for (int e = 0; e <= 8; ++e) {
      j += i[e];
    }
    o = j / 9;

    n = 0;
    for (int e = 0; e <= 8; ++e) {
      m = i[e] - o;
      n += m * m;
    }
    n = n / 9;

    if (n < l) {
      l = n;
      k = o;
    }

    b[p] = k;
    b[p + 1] = k;
    b[p + 2] = k;

    b[p + 3] = a[h + 3];
  } else {
    b[p] = 0;
    b[p + 1] = 0;
    b[p + 2] = 0;
    b[p + 3] = 0;
  }
}
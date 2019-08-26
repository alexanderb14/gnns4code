__kernel void A(__global char* a, __global char* b, int c, int d) {
  unsigned int e = get_global_id(0);

  unsigned int f = e * 4;

  unsigned int g, h;

  h = e / c;

  g = e % c;

  if ((g < c - 1) && (g > 0) && (h > 0) && (h < d - 1)) {
    unsigned int i;
    i = -a[f - 4] + 8 * a[f] + -a[f + 4] +

        -a[f - 4 - 4 * c] + -a[f - 4 + 4 * c] +

        -a[f + 4 - 4 * c] + -a[f + 4 + 4 * c] +

        -a[f - 4 * c] + -a[f + 4 * c];

    i = i;
    if (i > 255) {
      b[f] = 255;
    } else {
      b[f] = i;
    }

    i = -a[f - 3] + 8 * a[f + 1] + -a[f + 5] +

        -a[f - 3 - 4 * c] + -a[f - 3 + 4 * c] +

        -a[f + 5 - 4 * c] + -a[f + 5 + 4 * c] +

        -a[f - 4 * c + 1] + -a[f + 4 * c + 1];

    i = i;
    if (i > 255) {
      b[f + 1] = 255;
    } else {
      b[f + 1] = i;
    }

    i = -a[f - 2] + 8 * a[f + 2] + -a[f + 6] +

        -a[f - 2 - 4 * c] + -a[f - 2 + 4 * c] +

        -a[f + 6 - 4 * c] + -a[f + 6 + 4 * c] +

        -a[f - 4 * c + 2] + -a[f + 4 * c + 2];

    i = i;
    if (i > 255) {
      b[f + 2] = 255;
    } else {
      b[f + 2] = i;
    }

  } else {
    b[f] = a[f];
    b[f + 1] = a[f + 1];
    b[f + 2] = a[f + 2];
  }

  b[f + 3] = a[f + 3];
}
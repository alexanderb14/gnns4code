__kernel void A(__global uchar* a, __global uchar* b, __global uchar* c, size_t d, size_t e) {
  size_t f = get_global_id(0);
  size_t g = get_global_id(1);
  size_t h = get_local_id(0) + 1;
  size_t i = get_local_id(1) + 1;

  size_t j = f * e + g;

  __local int k[18][18];

  k[h][i] = a[j];

  if (h == 1) {
    k[0][i] = a[j - e];

    if (i == 1)
      k[0][0] = a[j - e - 1];

    else if (i == 16)
      k[0][17] = a[j - e + 1];
  }

  else if (h == 16) {
    k[17][i] = a[j + e];

    if (i == 1)
      k[17][0] = a[j + e - 1];

    else if (i == 16)
      k[17][17] = a[j + e + 1];
  }

  if (i == 1)
    k[h][0] = a[j - 1];
  else if (i == 16)
    k[h][17] = a[j + 1];

  barrier(1);

  uchar l = k[h][i];

  switch (c[j]) {
    case 0:

      if (l <= k[h][i + 1] || l <= k[h][i - 1]) {
        b[j] = 0;
      }

      else {
        b[j] = l;
      }
      break;

    case 45:

      if (l <= k[h - 1][i + 1] || l <= k[h + 1][i - 1]) {
        b[j] = 0;
      }

      else {
        b[j] = l;
      }
      break;

    case 90:

      if (l <= k[h - 1][i] || l <= k[h + 1][i]) {
        b[j] = 0;
      }

      else {
        b[j] = l;
      }
      break;

    case 135:

      if (l <= k[h - 1][i - 1] || l <= k[h + 1][i + 1]) {
        b[j] = 0;
      }

      else {
        b[j] = l;
      }
      break;

    default:
      b[j] = l;
      break;
  }
}
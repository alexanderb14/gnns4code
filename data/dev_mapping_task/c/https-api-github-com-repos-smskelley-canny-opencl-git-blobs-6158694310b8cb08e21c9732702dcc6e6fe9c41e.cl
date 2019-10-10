__constant float Ga[3][3] = {{0.0625, 0.125, 0.0625}, {0.1250, 0.250, 0.1250}, {0.0625, 0.125, 0.0625}};

__kernel void A(__global uchar* a, __global uchar* b, size_t c, size_t d) {
  int e = 0;
  size_t f = get_global_id(0);
  size_t g = get_global_id(1);
  size_t h = get_local_id(0) + 1;
  size_t i = get_local_id(1) + 1;

  size_t j = f * d + g;

  __local int k[16 + 2][16 + 2];

  k[h][i] = a[j];

  if (h == 1) {
    k[0][i] = a[j - d];

    if (i == 1)
      k[0][0] = a[j - d - 1];

    else if (i == 16)
      k[0][16 + 1] = a[j - d + 1];
  }

  else if (h == 16) {
    k[16 + 1][i] = a[j + d];

    if (i == 1)
      k[16 + 1][0] = a[j + d - 1];

    else if (i == 16)
      k[16 + 1][16 + 1] = a[j + d + 1];
  }

  if (i == 1)
    k[h][0] = a[j - 1];
  else if (i == 16)
    k[h][16 + 1] = a[j + 1];

  barrier(1);

  for (int l = 0; l < 3; l++)
    for (int m = 0; m < 3; m++)
      e += Ga[l][m] * k[l + h - 1][m + i - 1];

  b[j] = min(255, max(0, e));

  return;
}
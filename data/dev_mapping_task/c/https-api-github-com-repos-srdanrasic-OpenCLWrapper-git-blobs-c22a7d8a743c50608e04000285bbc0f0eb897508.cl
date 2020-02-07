__kernel void A(__global uchar* a, __global uchar* b, unsigned int c, unsigned int d, int e) {
  unsigned int f = get_global_id(0);
  unsigned int g = get_global_id(1);

  unsigned int h = e + f * (e + 1);
  unsigned int i = e + g * (e + 1);

  unsigned int j = h, k = i;

  for (unsigned int l = h; l <= h + e; l++)
    for (unsigned int m = i; m <= i + e; m++)
      if (a[m * c + l] > a[k * c + j]) {
        j = l;
        k = m;
      }

  for (unsigned int l = j - e; l <= min(j + e, c - 1); l++)
    for (unsigned int m = k - e; m <= min(k + e, d - 1); m++)
      if (a[m * c + l] > a[k * c + j])
        goto failed;

  b[k * c + j] = 255;
failed:;
}

__kernel void B(__global uchar* a, __global uchar* b, __constant uchar* c, int d, int e, int f, int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);

  const int j = i;
  const int k = h;

  unsigned char l = 0;
  for (int m = 0; m < g; m++) {
    const int n = m * g;
    const int o = (j + m) * d + k;

    for (int p = 0; p < g; p++) {
      const int q = n + p;
      const int r = o + p;
      l += c[q] * a[r];
    }
  }

  const int s = i * e + h;
  b[s] = l;
}
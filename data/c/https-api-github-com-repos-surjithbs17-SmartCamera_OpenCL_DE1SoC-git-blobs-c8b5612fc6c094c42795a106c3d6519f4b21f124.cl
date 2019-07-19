__kernel void A(__global unsigned int* restrict a, __global unsigned int* restrict b) {
  const float c[25] = {1, 4, 6, 4, 1, 4, 16, 24, 16, 4, 6, 2, 36, 24, 6, 4, 16, 24, 16, 4, 1, 4, 6, 4, 1};

  int d = get_global_size(0);
  int e = get_global_size(1);
  int f = get_global_id(0);
  int g = get_global_id(1);
  int h = (g * (d)) + f;
  int i = (g / 2) * (d / 2) + (f / 2);

  const int j = 2;
  const int k = 5;

  if (f >= d || g >= e)
    return;

  if (f % 2 != 0 || g % 2 != 0) {
    return;
  }

  if (f < j || g < j) {
    b[i] = a[h];

    return;
  }

  if ((f > d - j - 1) && (f < d)) {
    b[i] = a[h];

    return;
  }

  if ((g > e - j - 1) && (g < e)) {
    b[i] = a[h];

    return;
  }

  float l = 0;
  int m = 0;
  int n = 0;
  for (int o = -j; o <= j; o++) {
    for (int p = -j; p <= j; p++) {
      m = f + p;
      n = g + o;
      float q = (float)(a[n * d + m]);
      l += q * c[(o + j) * k + (p + j)];
    }
  }
  b[i] = (unsigned int)clamp((int)l / 256, (int)0, (int)255);
}

__kernel void B(__global unsigned int* restrict a, __global unsigned int* restrict b) {
  const float c[25] = {1, 4, 6, 4, 1, 4, 16, 24, 16, 4, 6, 24, 36, 24, 6, 4, 16, 24, 16, 4, 1, 4, 6, 4, 1};

  int d = get_global_id(0);
  int e = get_global_id(1);
  int f = get_global_size(0);
  int g = get_global_size(1);
  int h = e / 2 * (f / 2) + d / 2;
  int i = e * (f) + d;

  const int j = 2;
  const int k = 5;

  if (d >= f || e >= g)
    return;

  if (d < j || e < j) {
    b[i] = a[h];
    return;
  }

  if ((d > f - j - 1) && (d < f)) {
    b[i] = a[h];
    return;
  }

  if ((e > g - j - 1) && (e < g)) {
    b[i] = a[h];
    return;
  }

  float l = 0;
  int m = 0;
  int n = 0;
  for (int o = -j; o <= j; o++) {
    for (int p = -j; p <= j; p++) {
      m = d + p;
      n = e + o;
      if (m % 2 != 0 || n % 2 != 0) {
        continue;
      }
      float q = (float)(a[n / 2 * f / 2 + m / 2]);
      l += q * c[(o + j) * k + (p + j)];
    }
  }
  b[i] = (unsigned int)clamp((int)l / 64, (int)0, (int)255);
}
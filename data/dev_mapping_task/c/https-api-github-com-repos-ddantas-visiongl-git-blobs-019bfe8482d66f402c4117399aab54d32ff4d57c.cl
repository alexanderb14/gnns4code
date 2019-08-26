__kernel void A(__global int* a, int b) {
  int c = get_global_id(0);
  int d = get_global_size(0) * 2;
  int e = 1;
  for (int f = d >> 1; f > 0; f >>= 1) {
    if (c < f) {
      int g = e * (2 * c + 1) - 1;
      int h = e * (2 * c + 2) - 1;

      a[h] += a[g];
    }
    e *= 2;
    barrier(2);
  }

  int i = a[d - 1];

  if (c == 0)
    a[d - 1] = 0;

  int f;
  for (f = 1; f < d / 2; f *= 2) {
    e = e >> 1;
    barrier(2);
    if (c < f) {
      int g = (e * ((2 * c) + 1)) - 1;
      int h = (e * ((2 * c) + 2)) - 1;

      int j = a[g];
      a[g] = a[h];
      a[h] += j;
    }
  }

  f *= 2;
  e = e >> 1;
  barrier(2);
  if (c == 0) {
  } else if (c < f) {
    int g = (e * ((2 * c) + 1)) - 1;
    int h = (e * ((2 * c) + 2)) - 1;
    int k = a[g];
    int l = a[h];

    barrier(2);

    a[g - 1] = l;
    a[h - 1] = l + k;
  }
  a[d - 1] = i;
}

__kernel void B(__global int* a, int b, int c) {
  int d = get_global_id(0);

  int e = get_global_size(0) * 2;
  int f = 1;
  for (int g = e >> 1; g > 0; g >>= 1) {
    if (d < g) {
      int h = f * (2 * d + 1) - 1;
      int i = f * (2 * d + 2) - 1;

      if (g == e >> 1) {
        a[i] = a[i] * 255 / c;
        a[h] = a[h] * 255 / c;
      }

      atomic_add(&a[i], a[h]);
    }
    f *= 2;
    barrier(2);
  }

  int j = a[e - 1];

  if (d == 0)
    a[e - 1] = 0;

  int g;
  for (g = 1; g < e / 2; g *= 2) {
    f = f >> 1;
    barrier(2);
    if (d < g) {
      int h = (f * ((2 * d) + 1)) - 1;
      int i = (f * ((2 * d) + 2)) - 1;

      int k = a[h];
      a[h] = a[i];
      a[i] += k;
    }
  }

  g *= 2;
  f = f >> 1;
  barrier(2);
  if (d == 0) {
  } else if (d < g) {
    int h = (f * ((2 * d) + 1)) - 1;
    int i = (f * ((2 * d) + 2)) - 1;
    int l = a[h];
    int m = a[i];

    barrier(2);

    a[h - 1] = m;
    a[i - 1] = m + l;
  }
  a[e - 1] = j;
}
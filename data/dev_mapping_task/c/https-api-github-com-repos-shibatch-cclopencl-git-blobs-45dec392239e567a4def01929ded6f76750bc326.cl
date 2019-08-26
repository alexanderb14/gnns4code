__kernel void A(global int* a, global int* b, global int* c, int d, int e, int f, int g) {
  const int h = get_global_id(0), i = get_global_id(1);
  const int j = i * f + h;

  if (i == 0 && h < d + 1) {
    c[h] = h == 0 ? 1 : 0;
  }

  if (h >= f || i >= g)
    return;

  if (b[j] == e) {
    a[j] = -1;
    return;
  }
  if (i > 0 && b[j] == b[j - f]) {
    a[j] = j - f;
    return;
  }
  if (h > 0 && b[j] == b[j - 1]) {
    a[j] = j - 1;
    return;
  }
  a[j] = j;
}

__kernel void B(global int* a, global int* b, global int* c, int d, int e, int f) {
  const int g = get_global_id(0), h = get_global_id(1);
  if (g >= e || h >= f)
    return;
  const int i = h * e + g;

  if (c[d - 1] == 0)
    return;

  int j = a[i], k = j;

  if (j == -1)
    return;

  for (int l = -1; l <= 1; l++) {
    for (int m = -1; m <= 1; m++) {
      if (0 <= g + m && g + m < e && 0 <= h + l && h + l < f) {
        const int n = (h + l) * e + g + m, o = a[n];
        if (o != -1 && o < j)
          j = o;
      }
    }
  }

  for (int p = 0; p < 6; p++)
    j = a[j];

  if (j != k) {
    atomic_min(&a[k], j);
    atomic_min(&a[i], j);
    c[d] = 1;
  }
}
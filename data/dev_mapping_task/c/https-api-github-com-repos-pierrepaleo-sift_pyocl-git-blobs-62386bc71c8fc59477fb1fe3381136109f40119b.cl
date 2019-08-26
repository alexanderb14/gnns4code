__kernel void A(const __global float* a, __global float* b, __global float* c __attribute__((max_constant_size(16384))), int d, int e, int f) {
  int g = (int)get_global_id(1);
  int h = (int)get_global_id(0);

  if (g < f && h < e) {
    int i, j, k;
    if (d & 1) {
      i = d / 2;
      j = i;
      k = i;
    } else {
      i = d / 2 - 1;
      j = i;
      k = i + 1;
    }
    int l = i - h;
    int m = e - 1 - h + i;
    float n = 0.0f;

    for (int o = 0; o <= k + j; o++) {
      int p = h - i + o;
      if (o < l)
        p = l - o - 1;
      if (o > m)
        p = e - (o - m);

      n += a[g * e + p] * c[d - 1 - o];
    }
    b[g * e + h] = n;
  }
}

__kernel void B(const __global float* a, __global float* b, __global float* c __attribute__((max_constant_size(16384))), int d, int e, int f) {
  int g = (int)get_global_id(1);
  int h = (int)get_global_id(0);

  if (g < f && h < e) {
    int i, j, k;
    if (d & 1) {
      i = d / 2;
      j = i;
      k = i;
    } else {
      i = d / 2 - 1;
      j = i;
      k = i + 1;
    }
    int l = i - g;
    int m = f - 1 - g + i;
    float n = 0.0f;

    for (int o = 0; o <= k + j; o++) {
      int p = g - i + o;
      if (o < l)
        p = l - o - 1;
      if (o > m)
        p = f - (o - m);

      n += a[p * e + h] * c[d - 1 - o];
    }
    b[g * e + h] = n;
  }
}
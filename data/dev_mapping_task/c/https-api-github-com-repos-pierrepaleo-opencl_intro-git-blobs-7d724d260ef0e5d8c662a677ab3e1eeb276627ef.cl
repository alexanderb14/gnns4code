__kernel void A(const __global float* a, __global float* b, __global float* c, int d, int e, int f, int g) {
  int h = (int)get_global_id(2);
  int i = (int)get_global_id(1);
  int j = (int)get_global_id(0);

  if (i < f && j < e && h < g) {
    int k, l, m;
    if (d & 1) {
      k = d / 2;
      l = k;
      m = k;
    } else {
      k = d / 2 - 1;
      l = k;
      m = k + 1;
    }
    int n = k - j;
    int o = e - 1 - j + k;
    float p = 0.0f;

    for (int q = 0; q <= m + l; q++) {
      int r = j - k + q;
      if (q < n)
        r = n - q - 1;
      if (q > o)
        r = e - (q - o);

      p += a[(h * f + i) * e + r] * c[d - 1 - q];
    }
    b[(h * f + i) * e + j] = p;
  }
}

__kernel void B(const __global float* a, __global float* b, __global float* c, int d, int e, int f, int g) {
  int h = (int)get_global_id(2);
  int i = (int)get_global_id(1);
  int j = (int)get_global_id(0);

  if (i < f && j < e && h < g) {
    int k, l, m;
    if (d & 1) {
      k = d / 2;
      l = k;
      m = k;
    } else {
      k = d / 2 - 1;
      l = k;
      m = k + 1;
    }
    int n = k - i;
    int o = f - 1 - i + k;
    float p = 0.0f;

    for (int q = 0; q <= m + l; q++) {
      int r = i - k + q;
      if (q < n)
        r = n - q - 1;
      if (q > o)
        r = f - (q - o);

      p += a[(h * f + r) * e + j] * c[d - 1 - q];
    }
    b[(h * f + i) * e + j] = p;
  }
}
__kernel void C(const __global float* a, __global float* b, __global float* c, int d, int e, int f, int g) {
  int h = (int)get_global_id(2);
  int i = (int)get_global_id(1);
  int j = (int)get_global_id(0);

  if (i < f && j < e && h < g) {
    int k, l, m;
    if (d & 1) {
      k = d / 2;
      l = k;
      m = k;
    } else {
      k = d / 2 - 1;
      l = k;
      m = k + 1;
    }
    int n = k - h;
    int o = g - 1 - h + k;
    float p = 0.0f;

    for (int q = 0; q <= m + l; q++) {
      int r = h - k + q;
      if (q < n)
        r = n - q - 1;
      if (q > o)
        r = g - (q - o);

      p += a[(r * f + i) * e + j] * c[d - 1 - q];
    }
    b[(h * f + i) * e + j] = p;
  }
}
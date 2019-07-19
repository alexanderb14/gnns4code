__kernel void A(const __global float* a, __global float* b, int c, int d, int e, int f, float g) {
  int h = (int)get_global_id(1);
  int i = (int)get_global_id(0);

  if (h < d && i < c) {
    float j = cos(g);
    float k = sin(g);

    float l = (i - e) * j - (h - f) * k;
    float m = (i - f) * k + (h - e) * j;
    l += e;
    m += f;

    if (l < 0 || l > c - 1 || m < 0 || m > d - 1) {
      b[h * c + i] = 0;
      return;
    }

    int n = (int)__clc_floor(l);
    int o = (int)__clc_ceil(l);
    int p = (int)__clc_floor(m);
    int q = (int)__clc_ceil(m);
    float r;
    float s = 0.001f;
    if ((l - n) < s && (m - p) < s)
      r = a[p * c + n];
    else if ((o - l) < s && (q - m) < s)
      r = a[q * c + o];
    else {
      if (n < 0)
        n = 0;
      if (o >= c)
        o = c - 1;
      if (p < 0)
        p = 0;
      if (q >= d)
        q = d - 1;

      r = a[q * c + n] * (o - l) * (m - p) + a[q * c + o] * (l - n) * (m - p) + a[p * c + n] * (o - l) * (q - m) + a[p * c + o] * (l - n) * (q - m);
    }
    b[h * c + i] = r;
  }
}
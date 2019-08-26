__kernel void A(__global float* a, int b, int c, int d, int e, float f, int g) {
  int h = 0;
  int i = 0;
  float j = 3.1415926535897932384626433832795;
  int k = 0;
  float l = 0.0;
  float m = 0.0;
  float n = 0.0;
  int o = 0;

  h = get_global_id(0) > d ? d : get_global_id(0);
  i = get_global_id(1) > e ? e : get_global_id(1);

  o = c + mul24(i, d) + h;

  k = (int)__clc_floor((float)g / 2);

  for (int p = -k; p <= k; p++) {
    for (int q = -k; q <= k; q++) {
      n = exp((float)((-1.0) * (float)((float)q * (float)q + (float)p * (float)p) / (2.0 * f * f)));
      m += n;
      int r = h + q >= 0 && h + q <= d ? h + q : 0;
      int s = i + p >= 0 && i + p <= e ? i + p : 0;

      int t = b + mul24(s, d) + r;
      l += n * a[t];
    }
  }

  if ((i <= e) && (h <= d)) {
    a[o] = l / (2.0 * j * f * f);
  }
}
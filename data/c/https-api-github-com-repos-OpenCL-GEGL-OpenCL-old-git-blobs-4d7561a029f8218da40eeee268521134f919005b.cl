__kernel void A(__global const float4* a, __global float4* b, float4 c, float d, float e, float f, int g, int h, int i, int j, int k, float l, float m, float n, float o) {
  int p = get_global_id(0);
  int q = get_global_id(1);
  int r = p + q * get_global_size(0);
  float s = 0.0f;
  float t, u, v, w;
  int x, y;
  x = p + g;
  y = q + h;
  w = f * (y - j) - i;
  v = e * (y - j) + j;

  t = e * (x - i) - w;
  u = f * (x - i) + v;

  if (m == 0.0f)
    s = 0.0f;
  else {
    switch (k) {
      case 0:
        s = hypot((t - i) / d, u - j);
        break;

      case 1:
        s = fmax(__clc_fabs(t - i) / d, __clc_fabs(u - j));
        break;

      case 2:
        s = __clc_fabs(t - i) / d + __clc_fabs(u - j);
        break;
    }
    s /= m;
    s = (s - n) / o;
  }

  if (s < 0.0f)
    s = 0.0f;
  if (s > 1.0f)
    s = 1.0f;

  if (l > 0.9999f && l < 2.0001f)
    s *= s;
  else if (l != 1.0f)
    s = __clc_pow(s, l);

  b[r] = a[r] * (1.0f - s) + c * s;
}
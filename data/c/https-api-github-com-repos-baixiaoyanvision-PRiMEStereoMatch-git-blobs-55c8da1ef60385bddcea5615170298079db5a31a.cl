__kernel void A(__global const float* restrict a, __global const float* restrict b, __global const float* restrict c, __global const float* restrict d, const int e, const int f, __global float* restrict g, __global float* restrict h) {
  const int i = get_global_id(0);
  const int j = get_global_id(1);
  const int k = get_global_id(2);

  const int l = j * f;
  const int m = ((k * e) + j) * f;

  float n = *(a + (l * 3) + (3 * i));
  float o = *(a + (l * 3) + (3 * i) + 1);
  float p = *(a + (l * 3) + (3 * i) + 2);
  float q = *(c + l + i);
  float r, s, t, u;

  float v = 0;
  float w = 0;

  if (i >= abs(k)) {
    r = *(b + (l * 3) + 3 * (i - k));
    s = *(b + (l * 3) + 3 * (i - k) + 1);
    t = *(b + (l * 3) + 3 * (i - k) + 2);
    u = *(d + l + (i - k));

    v += __clc_fabs(n - r);
    v += __clc_fabs(o - s);
    v += __clc_fabs(p - t);
    v *= 0.3333333333f;

    w = __clc_fabs(q - u);
  } else {
    v += __clc_fabs(n - 1.0f);
    v += __clc_fabs(o - 1.0f);
    v += __clc_fabs(p - 1.0f);
    v *= 0.3333333333f;

    w = __clc_fabs(q - 1.0f);
  }

  v = v > 0.028f ? 0.028f : v;
  w = w > 0.008f ? 0.008f : w;
  *(g + m + i) = 0.9f * v + 0.1f * w;

  n = *(b + (l * 3) + (3 * i));
  o = *(b + (l * 3) + (3 * i) + 1);
  p = *(b + (l * 3) + (3 * i) + 2);
  q = *(d + l + i);

  v = 0;
  w = 0;

  if (i >= abs(k)) {
    r = *(a + (l * 3) + 3 * (i + k));
    s = *(a + (l * 3) + 3 * (i + k) + 1);
    t = *(a + (l * 3) + 3 * (i + k) + 2);
    u = *(c + l + (i + k));

    v += __clc_fabs(n - r);
    v += __clc_fabs(o - s);
    v += __clc_fabs(p - t);
    v *= 0.3333333333f;

    w = __clc_fabs(q - u);
  } else {
    v += __clc_fabs(n - 1.0f);
    v += __clc_fabs(o - 1.0f);
    v += __clc_fabs(p - 1.0f);
    v *= 0.3333333333f;

    w = __clc_fabs(q - 1.0f);
  }

  v = v > 0.028f ? 0.028f : v;
  w = w > 0.008f ? 0.008f : w;
  *(h + m + i) = 0.9f * v + 0.1f * w;
}
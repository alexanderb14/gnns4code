__kernel void A(__global float* a, __global float* b, int c, int d, float e, float f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);

  float i = c / 2.0f;
  float j = d / 2.0f;

  float k = g - i;
  float l = h - j;

  int m = (int)(k * f + l * e + i);
  int n = (int)(l * f - k * e + j);

  if ((m >= 0) && (m < c) && (n >= 0) && (n < d)) {
    a[h * c + g] = b[n * c + m];
  }
}
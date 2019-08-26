__kernel void A(__global unsigned char* a, const int b, const int c, const float d, const float e, const float f) {
  int g = get_global_id(0);
  int h = g % b;
  int i = g / b;
  int j = h;
  int k = c - 1 - i;

  if (j >= b || k >= c) {
    return;
  }
  float l = (float)(j - b / 2) * f + d;
  float m = (float)(k - c / 2) * f + e;

  float n = l;
  float o = m;
  int p;
  int q = 200;
  for (p = 0; p < q; p++) {
    float r = n * n;
    float s = o * o;
    float t = n * o;
    n = l + r - s;
    o = m + 2 * t;
    if (r + s > 4) {
      break;
    }
  }
  float u = (float)p / (float)q;
  int v = 256 * u;
  if (v < 0) {
    v = 0;
  }
  if (v > 255) {
    v = 255;
  }

  a[h + i * b] = (unsigned char)v;
}
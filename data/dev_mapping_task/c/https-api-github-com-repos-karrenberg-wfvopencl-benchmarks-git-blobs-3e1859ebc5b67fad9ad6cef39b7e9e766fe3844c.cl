__kernel void A(__global int* a, const float b, const uint c, const int d) {
  int e = get_global_id(0);

  int f = e % d;
  int g = e / d;

  float h = ((f * b) - ((b / 2) * d)) / d;
  float i = ((g * b) - ((b / 2) * d)) / d;

  float j = h;
  float k = i;

  float l = j * j;
  float m = k * k;

  float n = b * b;

  uint o = 0;
  for (o = 0; (l + m <= n) && (o < c); ++o) {
    k = 2 * j * k + i;
    j = l - m + h;

    l = j * j;
    m = k * k;
  }
  a[e] = 255 * o / c;
}
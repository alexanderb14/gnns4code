__kernel void A(__global int* a, const int b, const int c, const int d, const int e, const int f) {
  int g = get_global_id(0);

  int h = g / d;
  int i = g - (h * c);

  if (h < (f - e) && i < c) {
    int j = 0;
    float k = 0.f;
    float l = 0.f;

    float m = 0.f;
    float n = 0.f;
    float o = 4.f * i / c - 2.f;
    float p = 4.f * (h + e) / d - 2.f;

    float q = k * k + l * l;

    while (j < b && q <= 4.f) {
      j++;
      m = k * k - l * l + o;
      n = 2.f * k * l + p;
      k = m;
      l = n;
      q = k * k + l * l;
    }

    a[h * d + i] = j;
  }
}
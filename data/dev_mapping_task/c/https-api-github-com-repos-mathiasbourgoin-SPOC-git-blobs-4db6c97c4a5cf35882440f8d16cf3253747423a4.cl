__kernel void A(__global int* a, const int b, const int c, const int d) {
  int e = get_global_id(0);

  int f = e / d;
  int g = e - (f * c);

  if (f >= d || g >= c)
    return;
  else {
    int h = 0;
    float i = 0.f;
    float j = 0.f;

    float k = 0.f;
    float l = 0.f;
    float m = 4.f * g / c - 2.f;
    float n = 4.f * f / d - 2.f;

    float o = i * i + j * j;

    while (h < b && o <= 4.f) {
      h++;
      k = i * i - j * j + m;
      l = 2.f * i * j + n;
      i = k;
      j = l;
      o = i * i + j * j;
    }

    a[f * d + g] = h;
  }
}

__kernel void B(__global int* a, const int b, const int c, const int d) {
  int e = get_global_id(0);
  int f = e / d;
  int g = e - (f * c);
  if (f >= d || g >= c)
    return;

  int h = a[e];
  int i = 0;
  int j = 0;
  int k = 0;
  int l = 0;
  int m = 0;
  int n = 0;
  int o = 0;
  int p = 0;
  if (g > 0)
    p = a[e - 1];
  if (g < c - 1)
    o = a[e + 1];
  if (f > 0)
    i = a[e - c];
  if (f < d - 1)
    l = a[e + c];

  if ((f < d - 1) && (g < c - 1))
    m = a[e + c + 1];
  if ((f < d - 1) && (g > 0))
    n = a[e + c - 1];
  if ((f > 0) && (g > 0))
    k = a[e - c - 1];
  if ((f > 0) && (g < c - 1))
    j = a[e - c + 1];
  int q = i + l + o + p + j + k + m + n;

  if ((h == 1) && ((q < 2) || (q > 3)))
    a[e] = 0;
  else if ((h == 0) && ((q == 3)))
    a[e] = 1;
}
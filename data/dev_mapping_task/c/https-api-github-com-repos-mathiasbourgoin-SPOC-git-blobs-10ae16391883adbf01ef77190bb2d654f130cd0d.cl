__kernel void A(__global int* a, const int b, const int c, const int d) {
  int e = get_local_id(1) + (get_group_id(1) * get_local_size(1));
  int f = get_local_id(0) + (get_group_id(0) * get_local_size(0));

  if (e >= d || f >= c)
    return;
  {
    int g = 0;
    float h = 0.f;
    float i = 0.f;

    float j = 0.f;
    float k = 0.f;
    float l = 4.f * f / c - 2.f;
    float m = 4.f * e / d - 2.f;

    float n = h * h + i * i;

    while (g < b && n <= 4.f) {
      g++;
      j = h * h - i * i + l;
      k = 2.f * h * i + m;
      h = j;
      i = k;
      n = h * h + i * i;
    }

    a[e * d + f] = g;
  }
}
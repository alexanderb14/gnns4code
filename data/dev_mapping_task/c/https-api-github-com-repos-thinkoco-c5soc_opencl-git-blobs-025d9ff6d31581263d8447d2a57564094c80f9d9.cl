__kernel void A(const float a, const float b, const float c, const unsigned int d, __global unsigned int* restrict e, __constant const unsigned int* restrict f, const unsigned int g) {
  const size_t h = get_global_id(0);
  const size_t i = get_global_id(1);
  const float j = a + (h * c);
  const float k = b - (i * c);

  float l = 0.0;
  float m = 0.0;
  float n = 0.0;
  float o = 0.0;
  unsigned int p = 0;

  while (n + o < 4.0 && p < d) {
    n = l * l;
    o = m * m;

    m = 2 * l * m + k;
    l = n - o + j;

    p++;
  }

  e[g * i + h] = (p == d) ? 0x00000000 : f[p];
}
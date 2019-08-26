inline int A(int a, int b, int c) {
  return c * b + a;
}
inline float B(float a) {
  return a * 3.25f - 2.f;
}
inline float C(float a) {
  return a * 2.5f - 1.25f;
}

__kernel void D(__global uint* a, float b, float c, float d) {
  int e = get_global_id(0);
  int f = get_global_id(1);
  int g = get_global_size(0);
  int h = get_global_size(1);
  int i = A(e, f, g);

  float j = B((float)e * b);
  float k = C((float)f * c);
  float l = 0.0f;
  float m = 0.0f;

  float n = 256.f;

  bool o = true;
  while (o) {
    const float p = mad(-m, m, mad(l, l, j));
    m = mad(2.f * l, m, k);
    l = p;
    n -= 1.f;
    o = -mad(m, m, mad(l, l, -d)) * n > 0.f;
  }

  const uint q = 256 - (uint)n;
  const uint r = (q == 256);
  const uint s = 255 << 24;
  const uint t = q | (q << 8) | (q << 16) | (255 << 24);
  a[i] = ((r) ? (s) : (t));
}
typedef ushort4 GeglRandom; unsigned int A(__global const int* a, const GeglRandom b, int c, int d, int e, int f); unsigned int B(__global const int* a, const GeglRandom b, int c, int d, int e, int f); int C(__global const int* a, const GeglRandom b, int c, int d, int e, int f, int g, int h); float D(__global const int* a, const GeglRandom b, int c, int d, int e, int f); float E(__global const int* a, const GeglRandom b, int c, int d, int e, int f, float g, float h); unsigned int A(__global const int* a, const GeglRandom b, int c, int d, int e, int f) {
  const long g = 103423;
  const long h = 101359;
  const long i = 101111;

  unsigned long j = c * g + d * h * g + f * i * h * g;

  int k = a[j % b.x], l = a[b.x + (j % b.y)], m = a[b.x + b.y + (j % b.z)];
  return k ^ l ^ m;
}

unsigned int B(__global const int* a, const GeglRandom b, int c, int d, int e, int f) {
  return A(a, b, c, d, e, f);
}

int C(__global const int* a, const GeglRandom b, int c, int d, int e, int f, int g, int h) {
  int i = A(a, b, c, d, e, f);
  return (i % (h - g)) + g;
}

float D(__global const int* a, const GeglRandom b, int c, int d, int e, int f) {
  int g = A(a, b, c, d, e, f);
  return (g & 0xffff) * 0.00001525902189669642175f;
}

float E(__global const int* a, const GeglRandom b, int c, int d, int e, int f, float g, float h) {
  float i = D(a, b, c, d, e, f);
  return i * (h - g) + g;
}
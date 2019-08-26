__kernel void A(__global float* a, __global int* b, int c, int d, int e) {
  const int f = c - 1;
  __global float* g;
  int h = d - 1;
  int i = 0;

  g = ((a) + ((h)*e));
  int j = i;
  float k = g[j];
  while (++j < c) {
    if (g[j] < k) {
      k = g[j];
      i = j;
    }
  }
  b[h] = i;

  while (h >= 0) {
    g = ((a) + ((h)*e));
    const float l = (i < 1) ? 0x1.fffffep127f : g[i - 1];
    const float m = g[i];
    const float n = (i >= f) ? 0x1.fffffep127f : g[i + 1];
    if (l < m) {
      i += (l < n) ? -1 : 1;
    } else {
      i += (m < n) ? 0 : 1;
    }
    b[h] = i;
  }
}
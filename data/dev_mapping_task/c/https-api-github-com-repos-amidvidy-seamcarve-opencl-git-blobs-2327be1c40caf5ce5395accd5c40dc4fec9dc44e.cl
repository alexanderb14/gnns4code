__kernel void A(__global float* a, int b, int c, int d) {
  const int e = b - 1;
  const int f = get_global_id(0);

  {
    __global float *g = a, *h = a, *i;
    int j = 0;

    while (++j < c) {
      i = h, h += d, g += d;

      const float k = (f < 1) ? 0x1.fffffep127f : i[f - 1];
      const float l = i[f];
      const float m = (f < e) ? i[f + 1] : 0x1.fffffep127f;

      h[f] = g[f] + (fmin((k), fmin((l), (m))));

      barrier(2);
    }
  }
}
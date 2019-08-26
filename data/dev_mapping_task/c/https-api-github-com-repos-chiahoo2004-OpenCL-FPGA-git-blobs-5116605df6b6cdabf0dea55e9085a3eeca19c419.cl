__kernel void A(__global const float* a, __global float* b, const int c, const float d, const int e, const int f, const int g, const int h, __global float* i, __global float* j, __global float* k, __global float* l, __global float* m) {
  int n = get_global_id(0);
  int o = get_global_id(1);

  int p = c * 2 + 1;
  int q = p * p;

  if (n < e && o < f) {
    n += c;
    o += c;

    int r = e + 2 * c;
    int s = f + 2 * c;

    for (int t = 0; t < g; ++t) {
      int u = 0;

      float v[3] = {};
      float w = 0;
      float x[3] = {};
      float y = 0;

      for (int z = -c; z <= c; z++) {
        for (int aa = -c; aa <= c; aa++) {
          v[0] += i[(o + aa) * r + (n + z) + t * r * s];
          v[1] += j[(o + aa) * r + (n + z) + t * r * s];
          v[2] += k[(o + aa) * r + (n + z) + t * r * s];
          w += l[(o + aa) * r + (n + z) + t * r * s];
        }
      }

      x[0] = v[0] / q;
      x[1] = v[1] / q;
      x[2] = v[2] / q;
      y = w / q;

      u = x[0] * m[o * r + n + 0 * r * s] + x[1] * m[o * r + n + 1 * r * s] + x[2] * m[o * r + n + 2 * r * s] + y;
      b[o * r + n + t * r * s] = (u & 0xffffff00) ? ~(u >> 24) : u;
    }
  }
}
__kernel void A(__global uchar4* a, __global uchar4* b, int c, int d, int e) {
  float f[9] = {1.0f, 2.0f, 1.0f, 2.0f, 4.0f, 2.0f, 1.0f, 2.0f, 1.0f};

  int2 g = (int2)(get_global_id(0) - 1, get_global_id(1) - 1);
  int2 h = (int2)(get_global_id(0) + 1, get_global_id(1) + 1);
  int2 i = (int2)(get_global_id(0), get_global_id(1));

  if (i.x < (c - e) && i.y < d) {
    int j = 0;
    float4 k = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
    float l = 0, m = 0, n = 0;
    for (int o = g.y; o <= h.y; o++) {
      for (int p = g.x; p <= h.x; p++) {
        float q = f[j] / 16.0f;
        uchar4 r = a[clamp(o, 0, d - 1) * c + clamp(p, 0, c - 1)];
        l += r.x * q;
        m += r.y * q;
        n += r.z * q;
        j += 1;
      }
    }

    b[i.y * c + i.x] = (uchar4)(l, m, n, 0);
  }
}
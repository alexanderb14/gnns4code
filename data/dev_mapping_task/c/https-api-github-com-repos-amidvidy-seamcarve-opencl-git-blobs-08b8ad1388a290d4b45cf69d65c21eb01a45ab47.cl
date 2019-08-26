__kernel void A(__read_only image2d_t a, __global float* b, sampler_t c, int d, int e, int f) {
  float4 g = (float4)(0.299f, 0.587f, 0.114f, 0.0f);

  float h[81] = {0.0f,   1.0f, 1.0f, 2.0f, 2.0f, 2.0f, 1.0f, 1.0f,   0.0f,   1.0f,   2.0f, 4.0f, 5.0f, 5.0f, 5.0f, 4.0f, 2.0f, 1.0f, 1.0f, 4.0f, 5.0f, 3.0f, 0.0f, 3.0f, 5.0f, 4.0f, 1.0f, 2.0f, 5.0f, 3.0f, -12.0f, -24.0f, -12.0f, 3.0f, 5.0f, 2.0f, 2.0f, 5.0f, 0.0f, -24.0f, -40.0f,
                 -24.0f, 0.0f, 5.0f, 2.0f, 2.0f, 5.0f, 3.0f, -12.0f, -24.0f, -12.0f, 3.0f, 5.0f, 2.0f, 1.0f, 4.0f, 5.0f, 3.0f, 0.0f, 3.0f, 5.0f, 4.0f, 1.0f, 1.0f, 2.0f, 4.0f, 5.0f, 5.0f, 5.0f, 4.0f, 2.0f, 1.0f,   0.0f,   1.0f,   1.0f, 2.0f, 2.0f, 2.0f, 1.0f, 1.0f, 0.0f};

  int2 i = (int2)(get_global_id(0), get_global_id(1));
  int2 j = i - 4;
  int2 k = i + 4;
  if (i.x < (d - f) && i.y < e) {
    float l = 0.0f;
    int m = 0;
    for (int n = j.y; n <= k.y; n++) {
      for (int o = j.x; o <= k.x; o++) {
        l += (dot(g, read_imagef(a, c, (int2)(o, n))) * (h[m]));
        m += 1;
      }
    }

    b[i.x + d * i.y] = l;
  }
}
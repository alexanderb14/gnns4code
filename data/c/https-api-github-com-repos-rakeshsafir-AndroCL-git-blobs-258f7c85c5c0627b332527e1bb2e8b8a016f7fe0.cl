__kernel void A(__global uchar4* a, __global uchar4* b, const int c, const int d) {
  int e = get_global_id(0);
  int f = get_global_id(1);
  int g = f * c + e;
  float4 h = (float4)0.0f;

  if ((e >= 2) && (e < (c - 2)) && (f >= 2) && (f < (d - 2))) {
    float4 i = 0.00392156862745f * convert_float4(a[g]);
    float j = 0.0f;

    for (int k = -2; k <= 2; k++) {
      for (int l = -2; l <= 2; l++) {
        int m = (f + k) * c + (e + l);
        float4 n = 0.00392156862745f * convert_float4(a[m]);
        float o = fast_distance((float)(l), (float)(k));
        float p = exp(-0.5f * __clc_pow((o / 3.0f), 2.0f));

        float q = fast_distance(n.xyz, i.xyz);
        float r = exp(-0.5f * __clc_pow((q / 0.2f), 2.0f));

        float s = p * r;
        j += s;
        h += s * n;
      }
    }
    h /= j;
    h.w = 1.0f;
  }
  b[g] = convert_uchar4_sat_rte(255.0f * h);
}
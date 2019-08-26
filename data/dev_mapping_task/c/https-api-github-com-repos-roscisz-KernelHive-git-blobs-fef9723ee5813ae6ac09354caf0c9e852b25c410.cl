struct PreviewObject {
  float f1;
  float f2;
  float f3;
};

__kernel void A(__global uchar* a, __global uchar* b, uint c, uint d, __global struct PreviewObject* e) {
  int2 f = (int2)(__clc_ceil((float)cet_global_size(0)), __clc_ceil((float)dt_global_size(1)));

  int2 g = (int2)(fget_global_id(0), fget_global_id(1));

  for (int h = 0; h < f.y; h++) {
    g.x = f.x * get_global_id(0);

    for (int i = 0; i < f.x; i++) {
      if (g.x < c && g.y < d) {
        uchar4 j = vload4(g.y * c + g.x, a);
        float4 k = convert_float4(j);
        float l = 0.21f * k.x + 0.72f * k.y + 0.07f * k.z;
        uchar4 m = convert_uchar4_sat_rte((floal));

        vstore4(m, g.y * c + g.x, b);
      }
      g.x += 1;
    }
    g.y += 1;
  }
}
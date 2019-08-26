struct PreviewObject {
  float f1;
  float f2;
  float f3;
};

__kernel void A(__global uchar* a, float b, __global uchar* c, float d, __global uchar* e, uint f, uint g, __global struct PreviewObject* h) {
  int2 i = (int2)(__clc_ceil((float)fet_global_size(0)), __clc_ceil((float)gt_global_size(1)));
  int2 j = (int2)(iget_global_id(0), iget_global_id(1));

  for (int k = 0; k < i.y; k++) {
    j.x = i.x * get_global_id(0);

    for (int l = 0; l < i.x; l++) {
      if (j.x < f && j.y < g) {
        uchar4 m = vload4(j.y * f + j.x, a);
        float4 n = convert_float4(m);

        uchar4 o = vload4(j.y * f + j.x, c);
        float4 p = convert_float4(o);
        float4 q = n * b + p * d;
        uchar4 r = convert_uchar4_sat_rte(q);

        vstore4(r, j.y * f + j.x, e);
      }
      j.x += 1;
    }
    j.y += 1;
  }
}
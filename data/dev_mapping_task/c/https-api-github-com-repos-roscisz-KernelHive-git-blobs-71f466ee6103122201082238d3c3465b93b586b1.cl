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

__kernel void B(__global uchar* a, __global uchar* b, uint c, uint d, __global float* e, __local float* f, uint g, float h, __global struct PreviewObject* i) {
  event_t j = async_work_group_copy(f, e, g * g, 0);

  int k = g >> 1;

  int2 l = (int2)(__clc_ceil((float)cet_global_size(0)), __clc_ceil((float)dt_global_size(1)));
  int2 m = (int2)(lget_global_id(0) - k, lget_global_id(1) - k);
  int2 n = (int2)(lget_global_id(0) + k, lget_global_id(1) + k);
  int2 o = (int2)(lget_global_id(0), lget_global_id(1));

  uint p = c + 2 * k;

  wait_group_events(1, &j);
  for (int q = 0; q < l.y; q++) {
    m.x = l.x * get_global_id(0) - k;
    n.x = l.x * get_global_id(0) + k;
    o.x = l.x * get_global_id(0);

    for (int r = 0; r < l.x; r++) {
      if (o.x < c && o.y < d) {
        float4 s = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
        if (g == 3) {
                    knt2 t k (m             int2ku = kino               int2kv = kinn               s += convert_float4(vload4(t.y * p + t.x, a)) * f[0];
                    s += convert_float4(vload4(t.y * p + u.x, a)) * f[1];
                    s += convert_float4(vload4(t.y * p + v.x, a)) * f[2];
                    s += convert_float4(vload4(u.y * p + t.x, a)) * f[3];
                    s += convert_float4(vload4(u.y * p + u.x, a)) * f[4];
                    s += convert_float4(vload4(u.y * p + v.x, a)) * f[5];
                    s += convert_float4(vload4(v.y * p + t.x, a)) * f[6];
                    s += convert_float4(vload4(v.y * p + u.x, a)) * f[7];
                    s += convert_float4(vload4(v.y * p + v.x, a)) * f[8];
                    s = __clc_fabs(s / h);
        } else {
          for (int w = m.y; w <= n.y; w++) {
            for (int x = m.x; x <= n.x; x++) {
              uchar4 y = vload4((w + k) * p + x + k, a);
              float4 z = convert_float4(y);
              s += z * f[(w - m.y) * g + (x - m.x)];
            }
          }
          s = __clc_fabs(s / h);
        }
        uchar4 aa = convert_uchar4_sat_rte(s);

        vstore4(aa, o.y * c + o.x, b);
      }
      m.x += 1;
      n.x += 1;
      o.x += 1;
    }
    m.y += 1;
    n.y += 1;
    o.y += 1;
  }
}

__kernel void C(__global uchar* a, float b, __global uchar* c, float d, __global uchar* e, uint f, uint g, __global struct PreviewObject* h) {
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
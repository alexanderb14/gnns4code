typedef unsigned char fixed8; __kernel __attribute__((reqd_work_group_size(64, 1, 1))) void A(__global uchar* a, __global const uchar* b, const float c, const float d, const int e, const int f, const int g, const int h, const int i, const int j, const int k, const int l, const int m, const int n, const int o, const int p, const int q, const int r, const int s, const int t, __global const float4* restrict u, __global const float4* restrict v) {
  const int w = get_global_id(0);
  const int x = get_global_id(1);
  const int y = get_global_id(2);

  if ((get_group_id(0) * 64 >= (s >> ((y == 0) ? 0 : 1))) || (get_group_id(1) * 16 >= (t >> ((y == 0) ? 0 : 1))))
    return;

  const int z = (y == 0) ? e : ((y == 1) ? f : g);
  const int aa = (y == 0) ? h : ((y == 1) ? i : j);
  const int ab = (y == 0) ? k : ((y == 1) ? l : m);
  const int ac = (y == 0) ? n : ((y == 1) ? o : p);

  __local uchar ad[64 * 36];
  const int ae = 64;
  const int af = 16;
  const int ag = 2;
  const int ah = get_local_id(0);

  const int ai = __clc_floor((get_group_id(1) * af) / d);
  const int aj = __clc_ceil(af / d) + 2 * ag;

  float4 ak = u[w];
  int4 al = __clc_floor(w / c);
  al += (int4)(-1, 0, 1, 2);
  al = clamp(al, 0, (q >> ((y == 0) ? 0 : 1)) - 1);
  const int am = (r >> ((y == 0) ? 0 : 1)) - 1;

  for (int an = 0; an <= aj; ++an) {
    int4 ao = z + clamp(ai - ag + an, 0, am) * ab;
    ao += al;
        ad[ah + an * ae] = convert_uchar(clamp(__clc_round(dot(ak,
                       (float4)(ao], ao], ao], ao]))), 0.0f, 255.0f));
  }

  barrier(1);

  if (w >= s >> ((y == 0) ? 0 : 1))
    return;

  int ap = aa + w + (get_group_id(1) * af) * ac;

  for (int an = 0; an < af; ++an) {
    if (x >= t >> ((y == 0) ? 0 : 1))
      break;
    int aq = __clc_floor((get_group_id(1) * af + an) / d);
    aq = aq - ai + ag;
    int ar = ah + aq * ae;
        a[ap] = convert_uchar(clamp(__clc_round(dot(v[get_group_id(1) * af + an],
                                (flarar ae                      ,ar ae0f, 255.0f));
        ap += ac;
  }
}
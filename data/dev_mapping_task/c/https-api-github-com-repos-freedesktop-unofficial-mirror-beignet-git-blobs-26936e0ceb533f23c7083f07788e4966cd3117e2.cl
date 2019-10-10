inline float3 A(uint a) {
  float3 b;
  b.x = (float)(a & 0xff);
  a >>= 8;
  b.y = (float)(a & 0xff);
  a >>= 8;
  b.z = (float)(a & 0xff);
  return b;
}

inline uint B(float3 a) {
  uint b;
  b = (((uint)a.x)) | (((uint)a.y) << 8) | (((uint)a.z) << 16);
  return b;
}
__kernel void C(__global const uint* a, __global uint* b, int c, int d, int e) {
  const int f = get_global_id(0);
  int g = get_global_id(1) * e;
  const int h = min(g + e, d);

  const int i = max(4 * f - 1, 0) + g * c;
  const int j = min(4 * f + 4, c - 1) + g * c;
  int k = f + g * (c >> 2);
  float3 l, m, n, o;
  do {
    const uint4 p = vload4(k, a);
    const float3 q = A(p.x);
    const float3 r = A(p.y);
    const float3 s = A(p.z);
    const float3 t = A(p.w);
    const float3 u = A(a[i]);
    const float3 v = A(a[j]);
    l = (u + q + r);
    m = (q + r + s);
    n = (r + s + t);
    o = (s + t + v);
  } while (0);

  const int w = max(g - 1, 0);
  const int x = max(4 * f - 1, 0) + w * c;
  const int y = min(4 * f + 4, c - 1) + w * c;
  const int z = f + w * (c >> 2);
  float3 aa, ab, ac, ad;
  do {
    const uint4 p = vload4(z, a);
    const float3 q = A(p.x);
    const float3 r = A(p.y);
    const float3 s = A(p.z);
    const float3 t = A(p.w);
    const float3 u = A(a[x]);
    const float3 v = A(a[y]);
    aa = (u + q + r);
    ab = (q + r + s);
    ac = (r + s + t);
    ad = (s + t + v);
  } while (0);

  const int ae = f + (d - 1) * (c >> 2);
  const int af = max(4 * f - 1, 0) + (d - 1) * c;
  const int ag = min(4 * f + 4, c - 1) + (d - 1) * c;

  const int ah = min(g + 1, d - 1);
  int ai = max(4 * f - 1, 0) + ah * c;
  int aj = min(4 * f + 4, c - 1) + ah * c;
  int ak = f + ah * (c >> 2);

  for (; g < h; ++g, k += (c >> 2), ak += (c >> 2), ai += c, aj += c) {
    const int al = min(ak, ae);
    const int i = min(ai, af);
    const int j = min(aj, ag);
    float3 am, an, ao, ap;
    do {
      const uint4 p = vload4(al, a);
      const float3 q = A(p.x);
      const float3 r = A(p.y);
      const float3 s = A(p.z);
      const float3 t = A(p.w);
      const float3 u = A(a[i]);
      const float3 v = A(a[j]);
      am = (u + q + r);
      an = (q + r + s);
      ao = (r + s + t);
      ap = (s + t + v);
    } while (0);
    const float3 aq = (aa + l + am) * (1.f / 9.f);
    const float3 ar = (ab + m + an) * (1.f / 9.f);
    const float3 as = (ac + n + ao) * (1.f / 9.f);
    const float3 at = (ad + o + ap) * (1.f / 9.f);
    const uint4 auatsrB vstore4(au, k, b);
    aa = l;
    ab = m;
    ac = n;
    ad = o;
    l = am;
    m = an;
    n = ao;
    o = ap;
  }
}
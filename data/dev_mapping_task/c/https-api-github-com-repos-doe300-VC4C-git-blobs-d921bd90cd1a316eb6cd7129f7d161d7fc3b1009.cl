inline float2 A(float2 a, float2 b) {
  return (float2)(mad(a.x, b.x, -a.y * b.y), mad(a.x, b.y, a.y * b.x));
}

inline float2 B(float2 a) {
  return (float2)(a.x, -a.y);
}

__kernel void C(__global const uchar* a, int b, int c, __global const uchar* d, int e, int f, __global uchar* g, int h, int i, int j, int k, int l) {
  int m = get_global_id(0);
  int n = get_global_id(1) * l;

  if (m < k) {
    int o = mad24(n, b, mad24(m, (int)sizeof(float2), c));
    int p = mad24(n, e, mad24(m, (int)sizeof(float2), f));
    int q = mad24(n, h, mad24(m, (int)sizeof(float2), i));

    for (int r = n, s = min(j, n + l); r < s; ++r, o += b, p += e, q += h) {
      float2 t = *(__global const float2*)(a + o);
      float2 u = *(__global const float2*)(d + p);
      __global float2* v = (__global float2*)(g + q);

      float2 w = A(t, u);

      v[0] = w;
    }
  }
}
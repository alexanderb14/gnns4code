inline int A(float a, float b, float c, __local int2* d, __local float4* e) {
  int2 f, g, h;
  int i = 0;
  int j = 0;
  bool k, l, m;
  bool n, o, p;
  k = n = 0;
  f = d[i++];
  for (int q = 0; q < f.y; q++) {
    g = d[i++];
    l = o = 1;
    for (int r = 0; r < g.y; r++) {
      h = d[i++];
      if (h.y == 0) {
        float4 s = e[j++];
        float4 t = e[j++];
        m = a * a * s.x + c * c * s.y + a * c * s.z + a * t.x + c * t.y + t.z < 0;
        p = b * b * s.x + c * c * s.y + b * c * s.z + b * t.x + c * t.y + t.z < 0;
      } else {
        m = p = 1;
        for (int u = 0; u < h.y; u++) {
          float4 s = e[j++];
          m *= ((s.x * a + s.y * c + s.z)) > 0;
          p *= ((s.x * b + s.y * c + s.z)) > 0;
        }
      }
      l *= (h.x == m);
      o *= (h.x == p);
    }
    k += (g.x == l);
    n += (g.x == o);
  }
  return ((f.x == k) * 2 + (f.x == n));
}

__kernel void B(__global uchar4* a, __global int2* b, __global float4* c, __global float2* d, int e, int f, uchar g, uchar h, uchar i,

                int j, int k, __local int2* l, __local float4* m, int n, int o) {
  __local float2 p[36];
  int q = get_local_id(1) * get_local_size(1) + get_local_id(0);
  if (q < n)
    l[q] = b[q];
  if (q < o)
    m[q] = c[q];
  if (q < 36)
    p[q] = d[q];
  int r = get_global_id(0) + j;

  int s = get_global_id(1) + k;

  float t = r * 1.0f / e;
  float u = (s * 2 + 1) * 1.0f / e;
  float v = s * 2 * 1.0f / e;
  float w, x, y;
  float z = 0.0f;
  float aa = 0.0f;
  for (int q = 0; q < 36; q++) {
    float2 ab = p[q];
    w = v + ab.x;
    x = u + ab.x;
    y = t + ab.y;
    int ac = A(w, x, y, l, m);
    z += ac / 2;
    aa += ac % 2;
  }
  z = z / 36.0f;
  aa = aa / 36.0f;

  int ad = (r * e / 2 + s);
  uchar4 ae = a[ad];
  float af = 1.0f - z;
  float ag = 1.0f - aa;
  ae.x = ae.x * af + g * z;
  ae.y = (ae.y * (af + ag) + h * (z + aa)) / 2;
  ae.z = ae.z * ag + g * aa;
  ae.w = (ae.w * (af + ag) + i * (z + aa)) / 2;
  a[ad] = ae;
}
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

__kernel void B(__global uchar4* a, __global int2* b, __global float4* c, __global float2* d, int e, int f, uchar g, uchar h, uchar i, float j, int k, int l, __local int2* m, __local float4* n, int o, int p) {
  __local float2 q[36];
  int r = get_local_id(1) * get_local_size(1) + get_local_id(0);
  if (r < o)
    m[r] = b[r];
  if (r < p)
    n[r] = c[r];
  if (r < 36)
    q[r] = d[r];
  int s = get_global_id(0) + k;

  int t = get_global_id(1) + l;

  barrier(1);

  float u = s * 1.0f / e;
  float v = (t * 2 + 1) * 1.0f / e;
  float w = t * 2 * 1.0f / e;
  float x, y, z;
  float aa = 0.0f;
  float ab = 0.0f;
  for (int r = 0; r < 36; r++) {
    float2 ac = q[r];
    x = w + ac.x;
    y = v + ac.x;
    z = u + ac.y;
    int ad = A(x, y, z, m, n);
    aa += ad / 2;
    ab += ad % 2;
  }
  aa = aa * j / 36.0f;
  ab = ab * j / 36.0f;

  int ae = (s * e / 2 + t);
  uchar4 af = a[ae];
  float ag = 1.0f - aa;
  float ah = 1.0f - ab;
  af.x = af.x * ag + g * aa;
  af.y = (af.y * (ag + ah) + h * (aa + ab)) / 2;
  af.z = af.z * ah + g * ab;
  af.w = (af.w * (ag + ah) + i * (aa + ab)) / 2;
  a[ae] = af;
}
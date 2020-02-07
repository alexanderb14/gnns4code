int A(float4 a, float4 b, float4 c, float4 d, float* e, float* f) {
  float4 g = (float4)(1.0f, 1.0f, 1.0f, 1.0f) / b;
  float4 h = g * (c - a);
  float4 i = g * (d - a);

  float4 j = min(i, h);
  float4 k = max(i, h);

  float l = max(max(j.x, j.y), max(j.x, j.z));
  float m = min(min(k.x, k.y), min(k.x, k.z));

  *e = l;
  *f = m;

  return m > l;
}

uint B(float4 a) {
  a.x = clamp(a.x, 0.0f, 1.0f);
  a.y = clamp(a.y, 0.0f, 1.0f);
  a.z = clamp(a.z, 0.0f, 1.0f);
  a.w = clamp(a.w, 0.0f, 1.0f);
  return ((uint)(a.w * 255.0f) << 24) | ((uint)(a.z * 255.0f) << 16) | ((uint)(a.y * 255.0f) << 8) | (uint)(a.x * 255.0f);
}

__kernel void C(__global uint* a, uint b, uint c, float d, float e, float f, float g, __constant float* h

                )

{
  uint i = get_global_id(0);
  uint j = get_global_id(1);

  float k = (i / (float)b) * 2.0f - 1.0f;
  float l = (j / (float)c) * 2.0f - 1.0f;

  float4 m = (float4)(-1.0f, -1.0f, -1.0f, 1.0f);
  float4 n = (float4)(1.0f, 1.0f, 1.0f, 1.0f);

  float4 o;
  float4 p;

  oh

      float4 q = normalize(((float4)(k, l, -2.0f, 0.0f)));
  p.hp.hp.zh p.w = 0.0f;

  float r, s;
  int t = A(o, p, m, n, &r, &s);
  if (!t) {
    if ((i < b) && (j < c)) {
      uint u = (j * b) + i;
      a[u] = 0;
    }
    return;
  }
  if (r < 0.0f)
    r = 0.0f;

  q = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
  float v = s;

  for (uint u = 0; u < 500; u++) {
    float4 w = o + p * v;
    w = w * 0.5f + 0.5f;
    float4 x = (float4)(w, w, w, .25f);

    float y = x.w * d;
    q = mix(q, x, (float4)(y, y, y, y));

    v -= 0.01f;
    if (v < r)
      break;
  }
  q *= e;

  if ((i < b) && (j < c)) {
    uint u = (j * b) + i;
    a[u] = B(q);
  }
}
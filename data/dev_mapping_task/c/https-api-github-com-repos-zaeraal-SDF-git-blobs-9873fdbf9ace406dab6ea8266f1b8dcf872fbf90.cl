float A(float4 a, float4 b, float4 c, float4 d, float4 e) {
  float4 f = d - c;
  float4 g = e - c;
  float h, i, j, k;

  float4 l = cross(b, g);
  h = dot(f, l);

  if (h > -0.00001f && h < 0.00001f)
    return 99999.0;

  i = 1.0f / h;
  float4 m = a - c;
  j = i * dot(m, l);

  if (j < 0.0f || j > 1.0f)
    return 99999.0;

  float4 n = cross(m, f);
  k = i * dot(b, n);

  if (k < 0.0f || j + k > 1.0f)
    return 99999.0;

  float o = i * dot(g, n);

  if (o > 0.00001f)
    return o;

  else

    return 99999.0;
}

__kernel void B(__global const uint3* a, __global const float4* b, __global const uint* c, __global const float4* d, __global const uint* e, const uint4 f, __global float* g) {
  const uint h = get_global_id(0);

  uint i = h;
  uint j = i / f.y;

  if (j >= f.w)
    return;

  float k = 99999.0;
  float l = 99999.0;
  float m = 0.0f;
  uint n = 0;

  const float4 o = d[i];
  float4 p = b[a[c[j]].x];
  float4 q = b[a[c[j]].y];
  float4 r = b[a[c[j]].z];
  const float4 s = (p + q + r) / 3.0f;
  const float4 t = normalize((-1.0f) * cross(q - p, r - p));
  float4 u;

  for (n = 0; n < f.z; n++) {
    j = e[(i * f.z) + n];
    if (j == 0)
      break;

    j = j - 1;

    p = b[a[j].x];
    q = b[a[j].y];
    r = b[a[j].z];

    l = A(s, o, p, q, r);
    if (l < 99999.0) {
      u = normalize(cross(q - p, r - p));
      m = acos(dot(o, u) / length(o));
      m = m * (180.0f / 0x1.921fb6p+1f);
      if ((m < 90.0f) && (l < k))
        k = l;
    }
  }

  g[i] = k;
}
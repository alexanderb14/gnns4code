float3 A(const float a, const float b, const float3 c, const float d, const float e, const int f, const float g) {
  float3 h = (float3)0.0f;
  float3 i = (float3)0.0f;

  for (int j = 0; j <= f; j++) {
    const float k = -0x1.921fb6p+1f + j * (2.0f * 0x1.921fb6p+1f / f);
    float l, m;
    l = sincos(k, &m);

    const float n = m;
    const float o = 0.75f * l;
    const float p = 0.5f * (4.0f * m * m + l * l);
    const float3 q = 4.0f * c * (n * a + o * b - p);

    float3 r, s;
    r = sincos(q, &s);
    h += s;
    i += r;
  }

  h *= g;
  i *= g;

  const float t = d * (0x1.921fb6p+1f / 2.0f);
  float u, v;
  u = sincos(t, &v);

  return e * ((v + u) * h * h + (v - u) * i * i);
}

__kernel void B(__global float* a, const int b, const int c, const int d, const int e, const float3 f, const float3 g, const float3 h, const float i, const float j, const float k, const int l, const float m) {
  const int n = get_global_id(0);
  const int o = get_global_id(1);

  const int p = n + b;
  const int q = o + c;

  const float r = +10.0f / (d - 1);
  const float s = -10.0f / (e - 1);

  const float t = r * p - 5.0f;
  const float u = s * q + 5.0f;

  const float3 v = A(t, u, h, j, k, l, m);
  const float3 w = __clc_fabs(f * sin(g * atan(i * v)));

  const int x = o * get_global_size(0) + n;
  a[x * 3 + 0] = w.x;
  a[x * 3 + 1] = w.y;
  a[x * 3 + 2] = w.z;
}
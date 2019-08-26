float4 A(global uint* a, int b) {
  float4 c;
  uint4 d;
  uint e;
  const float f = 1.f / (1023.f * 1023.f);
  const float g = 1.f / (4092.f * 4092.f);
  const float4 h = (float4f);

  e = a[b];
  d.z = e >> 22;
  d.y = (e >> 10) & 4095;
  d.x = e & 1023;
  d.w = 1;

  c = convert_float4(d * d) * h;

  return c;
}

float4 B(global float4* a, int2 b, const int c, float2 d, float2 e, float2 f) {
  float4 g = 0.f;
  float2 h, i, j, k, l, m;

  h = 0.5f - __clc_fabs(fmod(e, 1.f) - 0.5f);

  j = max(0.f, __clc_ceil(d - e));
  k = min(convert_float2(b - 1), __clc_floor(d + e));

  if (c == 0)
    for (i.y = j.y; i.y <= k.y; i.y += 1.f) {
      for (i.x = j.x; i.x <= k.x; i.x += 1.f) {
        l = __clc_fabs(d - i);
        l = max(l, h);
        m = f * (l - e);

        g += a[(int)i.y * b.x + (int)i.x] * m.x * m.y;
      }
    }
  else
    for (i.y = j.y; i.y <= k.y; i.y += 1.f) {
      for (i.x = j.x; i.x <= k.x; i.x += 1.f) {
        l = __clc_fabs(d - i);
        l = max(l, h);
        m = f * (l - e);

        g += A(a, (int)i.y * b.x + (int)i.x) * m.x * m.y;
      }
    }

  return g;
}
float4 C(global uint* a, global uchar* b, float4 c) {
  const int2 d = (int2)(get_global_id(0), get_global_id(1));
  const float2 e = convert_float2(d);
  global float* f = a;
  global ulong* g = a;
  global float4* h;
  int2 i;
  int j;
  float2 k, l, m, n;

  h = (global float4*)&b[a[0] + (a[1] << 32)];
  i.x = a[2];
  i.y = a[3];
  k.x = f[4];
  k.y = f[5];
  l.x = f[6];
  l.y = f[7];
  j = a[8];
  n.x = f[9];
  n.y = f[10];

  m = k * (e + l);
  k = max(1.f, k);
  c += B(h, i, j, m, k, n);

  return c;
}
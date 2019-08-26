float A(global const float* a, int b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);

  int i = g - c / 2 - 1;
  int j = g + c - c / 2 - 1;
  int k = h - d / 2 - 1;
  int l = h + d - d / 2 - 1;

  j = clamp(j, 0, e - 1);
  l = clamp(l, 0, f - 1);

  float m = 0;
  float n = 0;
  float o = 0;

  if (k >= 0 && i >= 0)
    m = a[k * b + i];

  if (k >= 0)
    n = a[k * b + j];

  if (i >= 0)
    o = a[l * b + i];

  float p = a[l * b + j];

  return (p - n) - (o - m);
}

kernel void B(global const float* a, global float* b, int c, int d, int e, int f, int g, int h, float4 i) {
  const int j = get_global_id(0);
  const int k = get_global_id(1);

  c /= sizeof(float);
  d /= sizeof(float);

  float l = i.x;

  float m = A(a, c, g, h, e, f);

  float n = b[k * d + j];

  b[k * d + j] = m - 2.f * n + l;
}

kernel void C(global const float* a, global float* b, int c, int d, int e, int f, int g, int h, float4 i) {
  const int j = get_global_id(0);
  const int k = get_global_id(1);

  c /= sizeof(float);
  d /= sizeof(float);

  float l = i.x;

  float m = A(a, c, g, h, e, f);

  float n = b[k * d + j];

  b[k * d + j] = (m - 2.f * n + l) / sqrt(m * l);
}

kernel void D(global const float* a, global float* b, int c, int d, int e, int f, int g, int h, float4 i) {
  const int j = get_global_id(0);
  const int k = get_global_id(1);

  c /= sizeof(float);
  d /= sizeof(float);

  float l = i.x;

  float m = A(a, c, g, h, e, f);

  float n = b[k * d + j];

  b[k * d + j] = n / sqrt(m * l);
}

float2 E(float2 a, float2 b) {
  float2 c;
  c.x = a.x * b.x - a.y * b.y;
  c.y = a.x * b.y + a.y * b.x;
  return c;
}

kernel void F(global const uchar* a, global float* b, int c, int d, int e, int f, int g, int h, int i) {
  c /= sizeof(uchar);
  d /= sizeof(float);
  const int j = get_global_id(0);
  const int k = get_global_id(1);

  int l = k + f;
  if (l < 0)
    l += h;

  int m = j + e;
  if (m < 0)
    m += g;

  uchar n = (*(a + k * c + j));

  b[l * d + m] = convert_float(n);
}

kernel void G(global const float* a, global uchar* b, int c, int d, int e, int f, int g) {
  c /= sizeof(float);
  d /= sizeof(uchar);
  const int h = get_global_id(0);
  const int i = get_global_id(1);

  if (h > e - 1 || i > f - 1)
    return;

  float j = a[i * c + h];

  (*(b + i * d + h)) = j;
}

kernel void H(global const float2* a, global const float2* b, global float2* c, int d, int e, int f, int g, int h, float i) {
  d /= sizeof(float2);
  e /= sizeof(float2);
  f /= sizeof(float2);
  const int j = get_global_id(0);
  const int k = get_global_id(1);

  float2 l = b[k * e + j];

  l.y = -l.y;

  float2 m = E(a[k * d + j], l);

  m *= i;

  c[k * f + j] = m;
}
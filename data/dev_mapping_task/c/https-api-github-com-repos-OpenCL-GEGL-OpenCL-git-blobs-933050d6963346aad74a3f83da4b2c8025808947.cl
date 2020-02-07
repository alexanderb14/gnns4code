float4 A(__global const float4* a, const int b, const int c, const int d, const int e, const int f, const int g) {
  const int h = clamp(f - d, 0, b - 1);
  const int i = clamp(g - e, 0, c - 1);
  return a[i * b + h];
}

float4 B(const float4 a, const float4 b, const float4 c, const float4 d, const float e, const float f) {
  return mix(mix(a, c, f), mix(b, d, f), e);
}

float C(float a, float b) {
  return atan2(b, a);
}

kernel void D(__global const float4* a, __global float4* b, const int c, const int d, const int e, const int f, const int g, const int h, const int i, const int j, const int k, const int l, const float m, const float n, const float o) {
  const int p = get_global_id(0);
  const int q = get_global_id(1);

  const int r = p + g;
  const int s = q + h;

  const float t = r - n;
  const float u = s - o;
  const float v = hypot(t, u);

  const float w = v * m * 0x1.6a09e6p+0f;

  int x = max((int)__clc_ceil(w), 3);

  if (x > 100)
    x = 100 + (int)sqrt((float)(x - 100));

  const float y = C(t, u);
  const float z = y + m / 2.0f;
  const float aa = m / (float)x;

  float4 ab = (float4)0.0f;
  int ac = 0;

  for (int ad = 0; ad < x; ad++) {
    float ae, af;
    ae = sincos(z - ad * aa, &af);

    const float ag = n + v * af;
    const float ah = o + v * ae;
    const int ai = (int)__clc_floor(ag);
    const int aj = (int)__clc_floor(ah);

    if (ai >= k && ai < k + i && aj >= l && aj < l + j) {
      const float4 ak = A(a, c, d, e, f, ai, aj);
      const float4 al = A(a, c, d, e, f, ai + 1, aj);
      const float4 am = A(a, c, d, e, f, ai, aj + 1);
      const float4 an = A(a, c, d, e, f, ai + 1, aj + 1);
      ab += B(ak, al, am, an, ag - ai, ah - aj);
      ac++;
    }
  }

  float4 ao;
  if (ac == 0)
    ao = A(a, c, d, e, f, r, s);
  else
    ao = ab / (float)ac;
  b[q * get_global_size(0) + p] = ao;
}
float4 A(const __global float4* a, int b, int c, int d, int e, int f, int g) {
  int h = f - d;
  int i = g - e;

  h = clamp(h, 0, b - 1);
  i = clamp(i, 0, c - 1);

  return a[i * b + h];
}

__kernel void B(const __global float4* a, int b, int c, int d, int e, __global float4* f, int g, int h, int i, float j, float k) {
  int l = get_global_id(0);
  int m = get_global_id(1);

  float4 n = 0.0f;
  int o = l + g;
  int p = m + h;

  for (int q = 0; q < i; ++q) {
    float r = i == 1 ? 0.0f : q / (float)(i - 1) - 0.5f;

    float s = o + r * j;
    float t = p + r * k;

    int u = (int)__clc_floor(s);
    int v = (int)__clc_floor(t);

    float w = s - __clc_floor(s);
    float x = t - __clc_floor(t);

    float4 y, z, aa, ab, ac, ad;

    aa = A(a, b, c, d, e, u, v);
    ab = A(a, b, c, d, e, u + 1, v);
    ac = A(a, b, c, d, e, u, v + 1);
    ad = A(a, b, c, d, e, u + 1, v + 1);

    y = x * (ac - aa) + aa;
    z = x * (ad - ab) + ab;

    n += w * (z - y) + y;
  }

  f[m * get_global_size(0) + l] = n / (float4)(i);
}
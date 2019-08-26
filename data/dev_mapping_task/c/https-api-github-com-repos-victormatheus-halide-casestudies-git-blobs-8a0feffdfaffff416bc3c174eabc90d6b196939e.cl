float4 A(const __global float4* a, int b, int c, int d, int e) {
  int f = clamp(d, 0, b - 1);
  int g = clamp(e, 0, c - 1);

  return a[g * b + f];
}

__kernel void B(__global const float4* a, __global float4* b, int c, int d, int e, float f, float g) {
  int h = get_global_id(0);
  int i = get_global_id(1);

  float4 j = 0.0f;

  for (int k = 0; k < e; k++) {
    float l = e == 1 ? 0.0f : k / (float)(e - 1) - 0.5f;

    float m = h + l * f;
    float n = i + l * g;

    int o = (int)__clc_floor(m);
    int p = (int)__clc_floor(n);

    float q = m - __clc_floor(m);
    float r = n - __clc_floor(n);

    float4 s, t, u, v, w, x;

    u = A(a, c, d, o, p);
    v = A(a, c, d, o + 1, p);
    w = A(a, c, d, o, p + 1);
    x = A(a, c, d, o + 1, p + 1);

    s = r * (w - u) + u;
    t = r * (x - v) + v;

    j += q * (t - s) + s;
  }

  b[i * c + h] = j / e;
}
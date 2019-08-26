void A(const __global float4* a, int b, int c, const __global float* d, const __global float* e, const __global float* f, int g, int h, int i, int j, float4* k, float4* l, int m, int n) {
  float4 o;
  float4 p;
  float4 q = *(a + b * h + g);
  int r;

  o = q;
  p = q;

  int s = (b * h + g) * (n)*j + m * j;
  int t = s;
  s %= 95273;
  t %= 29537;
  for (r = 0; r < j; r++) {
    int u;
    float v;

    u = s++;
    v = d[t++] * i;

    if (s >= 95273)
      s = 0;
    if (t >= 29537)
      t = 0;

    int w = g + v * e[u];
    int x = h + v * f[u];

    if (w >= b || w < 0 || x >= c || x < 0) {
      continue;
    }
    float4 y = *(a + (b * x + w));
    if (y.w <= 0.0f) {
      continue;
    }

    o = y < o ? y : o;
    p = y > p ? y : p;
  }

  (*k).xyz = o.xyz;
  (*l).xyz = p.xyz;
}

void B(const __global float4* a, int b, int c, const __global float* d, const __global float* e, const __global float* f, int g, int h, int i, int j, int k, float4* l, float4* m) {
  float4 n = 0;
  float4 o = 0;
  float4 p = *(a + b * h + g);

  int q;
  for (q = 0; q < k; q++) {
    float4 r, s;
    float4 t, u;

    A(a, b, c, d, e, f, g, h, i, j, &r, &s, q, k);
    t = s - r;
    u = t <= 0.0f ? 0.5f : (p - r) / t;
    o += u;
    n += t;
  }

  float4 u = o / (float4)(k);
  float4 t = n / (float4)(k);

  if (m)
    *m = p + (1.0f - u) * t;

  if (l)
    *l = p - u * t;
}

__kernel void C(const __global float4* a, int b, int c, const __global float* d, const __global float* e, const __global float* f, __global float2* g, int h, int i, int j) {
  int k = get_global_id(0);
  int l = get_global_id(1);

  int m = k + h;
  int n = l + h;

  int o = (b * n + m);
  int p = k + get_global_size(0) * l;
  float4 q, r;

  B(a, b, c, d, e, f, m, n, h, i, j, &q, &r);

  float4 s = *(a + o);

  float t = 0, u = 0;
  float4 v = (s - q) * (s - q);
  float4 w = (s - r) * (s - r);

  t = v.x + v.y + v.z;
  u = w.x + w.y + w.z;

  t = sqrt(t);
  u = sqrt(u);
  u += t + u;

  g[p].x = (u > 0.000f) ? (t / u) : 0.5f;
  g[p].y = a[o].w;
}
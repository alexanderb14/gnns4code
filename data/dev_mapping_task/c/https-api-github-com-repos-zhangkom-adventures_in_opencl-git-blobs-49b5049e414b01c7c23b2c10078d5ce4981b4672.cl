float A(float4 a, float4 b, float4 c, float4 d, int e, float f, float g, float h, float i, float j) {
  float k = 1.f / j;
  float4 l = (float4)(0.f, 0.f, 0.f, 0.f);

  if (e == 1) {
    l = 2.f * b - d + f * f * i * i * k * k * (c - 2.f * b + a);
  } else if (e == 2) {
    float m = f * k / 2.f;
    l = -d + 2.f * b + i * i * k * k * ((c - 2.f * b + a) + m * ((c - b) * (c - b) - (b - a) * (b - a)));
  } else if (e == 3) {
    float n = f * k * k / 4.f;
    l = -d + 2.f * b + i * i * k * k * ((c - 2.f * b + a) + n * ((c - b) * (c - b) * (c - b) - (b - a) * (b - a) * (b - a)));
  }

  float o = l.y < g ? g : l.y;
  float p = o > h ? h : o;

  return p;
}

__kernel void B(__global float4* a, __global float4* b, __global float4* c, __global float4* d, int e, int f, int g, float h, float i, float j, float k, float l) {
  unsigned int m = get_global_id(0);

  int n, o, p;
  int q = 0;
  int r = g - 1;
  {
    int s = 0;

    n = m + s * g;
    o = q + s * g;
    p = r + s * g;

    int t = n - 1;
    int u = n + 1;
    float4 v = c[t];
    float4 w = c[n];
    float4 x = c[u];
    float4 y = d[n];

    float4 z = (float4)(0.f, 0.f, 0.f, 0.f);
    v = t < o ? z : v;
    x = u > p ? z : x;

    float aa = A(v, w, x, y, f, h, i, j, k, l);
    a[n].y = aa;

    a[n].w = 1.;

    float ab = sin(aa * 12 * 3.14f);

    b[n].y = -1.f * ab + 1.f;
    b[n].x = 1.f * ab + 1.f;
    b[n] *= .09f;
  }
}
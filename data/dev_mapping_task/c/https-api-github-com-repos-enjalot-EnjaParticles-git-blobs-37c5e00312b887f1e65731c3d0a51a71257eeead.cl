float A(float4 a) {
  return sqrt(a.x * a.x + a.y * a.y + a.z * a.z);
}
float4 B(float4 a) {
  float4 b;
  float c = A(a);
  c = c < 1.e-8 ? 1. : 1. / c;
  b.xyz = a.xyz * c;
  b.w = a.w;
  return b;
}

__kernel void C(__global float4* a, __global float4* b, __global float4* c, __global float4* d, __global float4* e, __global float4* f, __global float4* g, float h, float i) {
  unsigned int j = get_global_id(0);
  unsigned int k = get_global_size(0);

  float l = 30.;
  float m = 20.;

  float4 n = a[j];
  float4 o = c[j];

  e[j] = (float4)(0., 0., 0., 0.);
  f[j] = (float4)(0., 0., 0., 0.);
  g[j] = (float4)(0., 0., 0., 0.);

  for (int p = 0; p < k; p++) {
    float4 q = n - a[p];
    float r = A(q);
    if (r < l) {
      f[j].xyz += a[p].xyz;
      f[j].w += 1;
      g[j].xyz += c[p].xyz;
      g[j].w += 1;

      if (r < m && r != 0.) {
        q /= r * r;
        e[j].xyz += q.xyz;
        e[j].w += 1;
      }
    }
  }
}

__kernel void D(__global float4* a, __global float4* b, __global float4* c, __global float4* d, __global float4* e, __global float4* f, __global float4* g, float h, float i) {
  unsigned int j = get_global_id(0);
  unsigned int k = get_global_size(0);

  float l = 0.03f;
  float m = 0.3f;
  float n = 0.3f;
  float o = 3.f;

  float4 p = a[j];
  float4 q = c[j];

  e[j].xyz /= e[j].w > 0.f ? e[j].w : 1.f;
  f[j].xyz /= f[j].w > 0.f ? f[j].w : 1.f;
  g[j].xyz /= g[j].w > 0.f ? g[j].w : 1.f;

  float4 r = B(e[j]);

  float4 s = f[j] - p;
  s = B(s);

  float4 t = g[j] - q;
  t = B(t);

  d[j] += l * s + m * r + n * t;
  float u = A(d[j]);

  float4 v = B(d[j]);

  if (u > o) {
    d[j] = v * o;
  }
  d[j].w = 1.f;

    float4 w = (float4)(-3.*j].y, j].x, 0, 0.);
    w = w * .01f;
    c[j] = w + d[j];
}
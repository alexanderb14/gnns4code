__constant float4 Ga = (float4)(0, 0, -10, 0); __kernel void A(int a, __global float4* b, __global float* c, __global int* d, __global int* e, __global float2* f, __global float4* g) {
  int h = get_global_id(0);
  int i = h * a;

  float j = c[h];
  if (j > 1e-5f) {
    g[h] = Ga / j;
  }
  for (int k = 0; k < d[h]; ++k) {
    int l = e[i + k];

    float m = distance(b[l], b[h]);

    if (m < 1e-5f)
      continue;

    float4 n = (b[l] - b[h]) / m;

    g[h] += n * f[i + k].y * (m - f[i + k].x);
  }
}

__kernel void B(float a, __global float* b, __global float4* c, __global float4* d, __global float4* e) {
  int f = get_global_id(0);
  e[f] = c[f] + a * d[f] * b[f];
}

__kernel void C(float a, __global float4* b, __global float4* c, __global float4* d) {
  int e = get_global_id(0);

  d[e] = b[e] + a * c[e];

  if ((d[e].z < -d[e].x * 0.3f)) {
    d[e].z = -d[e].x * 0.3f;
    c[e].z = 0.0f;
    c[e] *= 0.5f;
  }
  c[e] *= 0.999f;
}

__kernel void D(__global float4* a, __global int4* b, __global float* c) {
  int d = get_global_id(0);

  c[d] = dot(a[b[d].x], cross(a[b[d].y], a[b[d].z])) / 6.0f;
}

__kernel void E(float a, int b, __global float4* c, __global int* d, __global int2* e, __global float4* f) {
  int g = get_global_id(0);

  for (int h = 0; h < d[g]; ++h) {
    int i = e[b * g + h].x;
    int j = e[b * g + h].y;

    float4 k = c[g];
    float4 l = c[i];
    float4 m = c[j];

    float4 n = cross(l - k, m - k);
    f[g] += n * a * 20000;
  }
}

__kernel void F(int a, __global float4* b, __global int* c, __global int2* d, __global float4* e) {
  int f = get_global_id(0);

  float4 g = (float4)(0);

  for (int h = 0; h < c[f]; ++h) {
    int i = d[a * f + h].x;
    int j = d[a * f + h].y;

    float4 k = b[f];
    float4 l = b[i];
    float4 m = b[j];

    float4 n = cross(l - k, m - k);
    g += normalize(n);
  }

  e[f] = normalize(g);
}
kernel void A(global float4* a, global float4* b, global float4* c, global float4* d) {
  int e = get_global_id(0);
  c[e] = a[e];
  d[e] = b[e];
}

kernel void B(global float4* a, global float4* b, global float4* c, global float4* d, global float4* e, global float4* f, global float4* g, float h) {
  int i = get_global_id(0);

  bool j = 0 < a[i].x;
  if (j) {
    return;
  }

  float k = a[i].y;
  f[i] = b[i] + e[i] * h;
  g[i] = c[i] + d[i] * h / k;
}

kernel void C(global float4* a, global float4* b, global float4* c, global float4* d, global float4* e, global float4* f, global float4* g, global float4* h, global float4* i, global float4* j, global float4* k, global float4* l, global float4* m, float n) {
  int o = get_global_id(0);

  bool p = 0 < a[o].x;
  if (p) {
    return;
  }

  float q = a[o].y;

  d[o] = b[o] + n / 6.0f * (f[o] + 2.0f * g[o] + 2.0f * h[o] + i[o]);

  e[o] = c[o] + n / (6.0f * q) * (j[o] + 2.0f * k[o] + 2.0f * l[o] + m[o]);
}
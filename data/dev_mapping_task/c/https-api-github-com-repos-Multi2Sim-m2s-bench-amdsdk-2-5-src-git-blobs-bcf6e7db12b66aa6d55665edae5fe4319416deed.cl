__kernel void A(int a, const __global float4* b, __global float4* c, __local float4* d, __local float4* e) {
  unsigned int f = get_local_id(0);
  unsigned int g = get_group_id(0);

  float4 h = b[g];

  float4 i = (1.0f - h) * 5.0f + h * 30.f;
  float4 j = (1.0f - h) * 1.0f + h * 100.f;
  float4 k = (1.0f - h) * 0.25f + h * 10.f;
  float4 l = k * (1.0f / (float)a);
  float4 m = 0.30f * sqrt(l);
  float4 n = 0.02f * l;
  float4 o = exp(n);
  float4 p = 1.0f / o;
  float4 q = exp(m);
  float4 r = 1.0f / q;
  float4 s = (o - r) / (q - r);
  float4 t = 1.0f - s;
  float4 u = s * p;
  float4 v = t * p;

  float4 w = i * exp(m * (2.0f * f - (float)a)) - j;
  d[f].x = w.x > 0 ? w.x : 0.0f;
  d[f].y = w.y > 0 ? w.y : 0.0f;
  d[f].z = w.z > 0 ? w.z : 0.0f;
  d[f].w = w.w > 0 ? w.w : 0.0f;

  barrier(1);

  for (int x = a; x > 0; x -= 2) {
    if (f < x) {
      e[f] = u * d[f] + v * d[f + 1];
    }
    barrier(1);

    if (f < x - 1) {
      d[f] = u * e[f] + v * e[f + 1];
    }
    barrier(1);
  }

  if (f == 0)
    c[g] = d[0];
}
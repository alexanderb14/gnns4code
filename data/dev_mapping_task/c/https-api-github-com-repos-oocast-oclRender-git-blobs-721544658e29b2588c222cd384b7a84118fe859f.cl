inline bool A(float a, float b, __global float* c, __global int* d) {
  int2 e, f, g;
  int h = 0;
  int i = 0;
  bool j, k, l;
  j = 0;
  e = vload2(h++, d);
  for (int m = 0; m < e.y; m++) {
    f = vload2(h++, d);
    k = 1;
    for (int n = 0; n < f.y; n++) {
      g = vload2(h++, d);
      if (g.y == 0) {
        float3 o = vload3(i++, c);
        float3 p = vload3(i++, c);
        l = a * a * o.x + b * b * o.y + a * b * o.z + a * p.x + b * p.y + p.z < 0;
      } else {
        l = 1;
        for (int q = 0; q < g.y; q++) {
          float3 o = vload3(i++, c);
          l *= ((o.x * a + o.y * b + o.z)) > 0;
        }
      }
      k *= (g.x == l);
    }
    j += (f.x == k);
  }
  return (e.x == j);
}

__kernel void B(__global float* a, __global float* b, __global float* c, __global int* d, int e, int f, int g,

                float h, float i, float j, float k,

                int l, int m) {
  int n = get_global_id(0) + l;
  if (n >= g)
    return;
  int o = get_global_id(1) + m;
  if (o >= f)
    return;

  float p = n * 1.0f / f;
  float q = o * 1.0f / f;
  float r, s;
  float t = 0.0f;
  for (int u = 0; u < e; u++) {
    float2 v = vload2(u, c);
    r = q + v.x;
    s = p + v.y;
    t += A(r, s, b, d);
  }
  t = t * k / e;

  float4 w = vload4((n * f + o), a);
  float x = 1.0f - t;
  w.x = w.x * x + h * t;
  w.y = w.y * x + i * t;
  w.z = w.z * x + j * t;
  w.w = 1.0f - x * (1 - w.w);
  vstore4(w, ((n * f) + o), a);
}
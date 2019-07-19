inline bool A(float a, float b, __global float* c) {
  float3 d = vload3(0, c);
  float3 e = vload3(1, c);
  float f = a * a * d.x + b * b * d.y + a * b * d.z + a * e.x + b * e.y + e.z;
  return f < 0;
}

inline bool B(float a, float b, __global float* c, int d) {
  int e = 1;
  for (int f = 0; f < d; f++) {
    float3 g = vload3(f, c);
    e *= ((g.x * a + g.y * b + g.z)) > 0;
  }
  return e;
}

__kernel void C(__global float* a, __global float* b, __global float* c, int d, int e, int f,

                float g, float h, float i, float j, int k, int l, int m) {
  int n = get_global_id(0) + l;
  if (n >= f)
    return;
  int o = get_global_id(1) + m;
  if (o >= e)
    return;

  float p = n * 1.0f / e;
  float q = o * 1.0f / e;
  float r, s;
  float t = 0.0f;
  for (int u = 0; u < d; u++) {
    float2 v = vload2(u, c);
    r = q + v.x;
    s = p + v.y;
    if (k == 0)
      t += A(r, s, b);
    else
      t += B(r, s, b, k);
  }
  t = t * j / d;

  float4 w = vload4((n * e + o), a);
  float x = 1.0f - t;
  w.x = w.x * x + g * t;
  w.y = w.y * x + h * t;
  w.z = w.z * x + i * t;
  w.w = 1.0f - x * (1 - w.w);
  vstore4(w, ((n * e) + o), a);
}
struct ray {
  float4 origin;
  float4 direction;
};

int A(float4 a, float4 b, float4 c, float4 d, float* e, float* f) {
  float4 g = (float4)(1.0f, 1.0f, 1.0f, 1.0f) / b;
  float4 h = g * (c - a);
  float4 i = g * (d - a);

  float4 j = min(i, h);
  float4 k = max(i, h);

  float l = max(max(j.x, j.y), max(j.x, j.z));
  float m = min(min(k.x, k.y), min(k.x, k.z));

  *e = l;
  *f = m;

  return m > l;
}

float B(const float4 a, const int b, __global float* c) {
  int d = a.x * b;
  int e = a.y * b;
  int f = a.z * b;

  if (d > b - 1 || d < 0)
    return (0.0f);
  if (e > b - 1 || e < 0)
    return (0.0f);
  if (f > b - 1 || f < 0)
    return (0.0f);

  return c[d + e * b + f * b * b];
}

float4 C(const float4 a, const int b, __global float* c) {
  float4 d;

  d.x = B((float4)(a.x + a2 .0fabz, 0.0f), b, c) - B((float4)(a.x - a2 .0fabz, 0.0f), b, c);
  d.y = B((float4)(a.x, a.y + a2 .0f / b0f), b, c) - B((float4)(a.x, a.y - a2 .0f / b0f), b, c);
  d.z = B((float4)(a.x, a.y, a.z + 2.0f/bb, c) -
    B((float4)(a.x, a.y, a.z - 2.0f/bb, c);
  d.w = 0.0f;

  if(dot(d, d) < 0.001f){
    d = (float4)(0.0f, 0.0f, 1.0f, 0.0f);
  }

  return normalize(d);
}

__kernel void D(const int a, const int b, __global float4* c, const int d, __global float* e, const float f, const float16 g) {
  int2 h = (int2)(get_global_id(0), get_global_id(1));

  float2 i = (float2)( (hx / (float) a0f-1.0f, (hy / (float) bf-1.0f );

  float4 j = (float4)(-1.0f, -1.0f, -1.0f,1.0f);
  float4 k = (float4)(1.0f, 1.0f, 1.0f,1.0f);


  struct ray l;

  l.gat4 m = normalize(((float4)(ix, iy, -2.0f, 0.0f)));
  l.directionl.directionl.directionl.direction.w = 0.0f;

  float4 n = (float4)(0.0f);

  float o, p;
  int q = A(l.origin, l.direction, j, k, &o, &p);
  if(q){
    if (o < 0.0f)
      o = 0.0f;
    float r = 256.0f;
    float s = (p - o) / r;
    float t = o + 0.0001f;
    for (int u = 0; u < r; ++u) {
      float4 v = ((l.origin + t * l.direction) + 1.0f) / 2.0f;
      float w = B(v, d, e);

      if (w > f) {
        n = 0.5f + 0.5f * dot(normalize((float4)(0.3f, -2.0f, 0.0f, 0.0f)), C(v, d, e));
        break;
      }

      t += s;
      if (t > p)
        break;
    }
  }

  if(h.x < a && h.y < b){
    c[h.x + h.y * a] = n;
  }
}

__kernel void E(const int a, const int b, __global float4* c, const int d, __global float* e, const float f, const float g, const float16 h) {
  int2 i = (int2)(get_global_id(0), get_global_id(1));

  float2 j = (float2)( (ix / (float) a0f-1.0f, (iy / (float) bf-1.0f );

  float4 k = (float4)(-1.0f, -1.0f, -1.0f,1.0f);
  float4 l = (float4)(1.0f, 1.0f, 1.0f,1.0f);


  struct ray m;

  m.hat4 n = normalize(((float4)(jx, jy, -2.0f, 0.0f)));
  m.directionm.directionm.directionm.direction.w = 0.0f;

  float4 o = (float4)(0.0f);

  float p, q;
  int r = A(m.origin, m.direction, k, l, &p, &q);
  if(r){
    if (p < 0.0f)
      p = 0.0f;
    float s = 256.0f;
    float t = (q - p) / s;
    float u = q - 0.0001f;
    for (int v = 0; v < s; ++v) {
      float4 w = ((m.origin + u * m.direction) + 1.0f) / 2.0f;
      float x = B(w, d, e);

      float y = clamp(f * (x - g) + 0.5f, 0.0f, 1.0f);
      float4 z = (float4)(0.5f + 0.5f * dot(normalize((float4)(0.3f, -2.0f, 0.0f, 0.0f)), C(w, d, e)));

      z x) + 0.1f;

      o = (1.0f - y) * o + y * z;

      u -= t;
      if (u < p)
        break;
    }
  }

  if(i.x < a && i.y < b){
    c[i.x + i.y * a] = (float4)(o);
  }
}
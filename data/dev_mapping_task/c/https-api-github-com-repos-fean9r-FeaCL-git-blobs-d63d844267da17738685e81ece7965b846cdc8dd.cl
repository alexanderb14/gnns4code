float4 A(float4 a, float4 b, float c) {
  return ((1.0f - c) * a) + (c * b);
}

__kernel void B(__global const float4* a, __global float2* b, __global float4* c, __local float4* d, __local float4* e) {
  int f = get_global_id(0) / 9;

  float2 g = b[f];

  int h = get_local_id(0);
  int i = h / 3;
  float4 j = a[i + h];
  float4 k = a[i + h + 1];
  float4 l = a[i + h + 4];
  float4 m = a[i + h + 5];

  float4 n = A(j, k, g.x);
  float4 o = A(l, m, g.x);

  float4 p = A(n, o, g.y);

  d[h] = p;

  barrier(1);

  if (h < 4) {
    i = h / 2;
    float4 q = d[i + h];
    float4 r = d[i + h + 1];
    float4 s = d[i + h + 3];
    float4 t = d[i + h + 4];

    float4 u = A(q, r, g.x);
    float4 v = A(s, t, g.x);

    float4 w = A(u, v, g.y);

    e[h] = w;
    barrier(1);

    if (h == 1) {
      float4 x = A(e[0], e[1], g.x);
      float4 y = A(e[2], e[3], g.x);

      float4 z = A(x, y, g.y);
      int aa = i + h + 5;

      c[f] = z;
    }
  }

  int aa = i + h;
}
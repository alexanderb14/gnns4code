kernel void A(global float4* a, global int2* b, global float4* c, global float4* d, global float4* e, global float4* f, global float4* g) {
  int h = get_global_id(0);

  int i = b[h].s0;
  int j = b[h].s1;

  float k = c[h].s0;
  float l = c[h].s1;
  float m = c[h].s2;

  float4 n = d[i];
  float4 o = d[j];

  float4 p = e[i];
  float4 q = e[j];

  float4 r = n - o;
  float4 s = p - q;

  float t = distance(n, o);
  if (0 < t) {
    r /= t;
  }

  float u = -(t - m) * k;

  float v = -l * dot(r, s);

  float w = u + v;
  float4 x = r * w;

  f[h] = x;
  g[h] = f[h];
}

kernel void B(global int* a, global int* b, global float4* c, global float4* d, global float4* e, int f) {
  int g = get_global_id(0);
  float4 h = (float4)(0, 0, 0, 0);

  int i = a[g];

  for (int j = 0; j < i; j++) {
    int k = +1;
    int l = b[f * g + j];

    if (l < 0) {
      k = -1;
      l *= -1;
    }
    l -= 1;

    float4 m = c[l];
    h += m * (float)(k);
  }

  d[g] += h;
}
kernel void A(global float4* a, global float4* b, const int c, const int d, const float e) {
  int f = get_global_id(0);
  int g = get_global_id(1);
  int h = f + c;
  int i = g + c;
  int j = get_global_size(0);
  int k = j + c * 2;
  float4 l[256];
  float4 m = 1.0;
  int n, o, p;
  int q = c * c;
  float4 r;
  for (n = 0; n < d; n++)
    l[n] = 0.0;

  for (n = -c; n <= c; n++) {
    for (o = -c; o <= c; o++) {
      if (n * n + o * o <= q) {
        r = a[h + n + (i + o) * k];
        l[(int)(r.x * (d - 1))].x += 1;
        l[(int)(r.y * (d - 1))].y += 1;
        l[(int)(r.z * (d - 1))].z += 1;
        l[(int)(r.w * (d - 1))].w += 1;
      }
    }
  }

  for (n = 0; n < d; n++) {
    if (m.x < l[n].x)
      m.x = l[n].x;
    if (m.y < l[n].y)
      m.y = l[n].y;
    if (m.z < l[n].z)
      m.z = l[n].z;
    if (m.w < l[n].w)
      m.w = l[n].w;
  }
  float4 s = 0.0;
  float4 t = 0.0;
  float4 u, v;
  for (n = 0; n < d; n++) {
    u = l[n] / m;
    v = __clc_pow(u, (float4)e);
    t += v * (float4)n;
    s += v;
  }
  b[f + g * j] = t / s / (float)(d - 1);
}

kernel void B(global float4* a, global float4* b, const int c, const int d, const float e) {
  int f = get_global_id(0);
  int g = get_global_id(1);
  int h = f + c;
  int i = g + c;
  int j = get_global_size(0);
  int k = j + c * 2;
  float4 l[256];
  int m[256], n;
  int o, p, q;
  int r = c * c;
  float4 s;
  for (o = 0; o < d; o++) {
    m[o] = 0;
    l[o] = 0.0;
  }
  for (o = -c; o <= c; o++) {
    for (p = -c; p <= c; p++) {
      if (o * o + p * p <= r) {
        s = a[h + o + (i + p) * k];

        q = (int)((0.299 * s.x + 0.587 * s.y + 0.114 * s.z) * (float)(d - 1));
        m[q] += 1;
        l[q] += s;
      }
    }
  }
  n = 1;

  for (o = 0; o < d; o++) {
    if (m[o] > n)
      n = m[o];
  }
  float t = 0.0;
  float u, v, w;

  float4 x = 0.0;
  for (o = 0; o < d; o++) {
    if (m[o] > 0) {
      u = (float)(m[o]) / (float)(n);
      v = __clc_pow(u, e);
      w = v / (float)(m[o]);

      t += v;
      x += w * l[o];
    }
  }
  b[f + g * j] = x / t;
}
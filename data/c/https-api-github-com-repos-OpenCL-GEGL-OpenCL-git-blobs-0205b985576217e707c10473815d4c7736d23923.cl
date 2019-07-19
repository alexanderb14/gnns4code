kernel void A(global float4* a, global float4* b, const float c, const float d) {
  int e = get_global_id(0);
  int f = get_global_id(1);
  int g = __clc_ceil(c);
  int h = get_global_size(0);
  int i = h + g * 2;

  int j, k, l, m;
  float4 n = a[(f + g) * i + e + g];
  float4 o = 0.0f;
  float4 p = 0.0f;
  float q = 0.0f;
  float r, s, t;

  for (k = -g; k <= g; ++k) {
    for (j = -g; j <= g; ++j) {
      l = e + g + j;
      m = f + g + k;

      int u = l + m * i;
      p = a[u];

      r = exp(-(((n.x - p.x) * (n.x - p.x)) + ((n.y - p.y) * (n.y - p.y)) + ((n.z - p.z) * (n.z - p.z))) * d);

      s = exp(-0.5f * (((j) * (j)) + ((k) * (k))) / c);

      t = r * s;

      o += p * t;
      q += t;
    }
  }
  b[e + f * h] = o / q;
}
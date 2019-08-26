kernel void A(global const float4* restrict a, global const unsigned int* restrict b, global float4* restrict c, unsigned int d, float e) {
  const unsigned int f = get_global_id(0);
  if (f >= d)
    return;

  const float4 g = a[f];

  const float h = g.w;
  const unsigned int i = __builtin_astype(h, uint);
  const unsigned int j = i >> 6;
  const unsigned int k = (i & 0x3f);

  float4 l, m = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
  for (int n = 0; n < k; n++) {
    l = a[b[j + n]];
    m += (l - g);
  }

  m /= k;
  float4 o = g + e * m;
  o.w = h;
  c[f] = o;
}

kernel void B(global const float4* restrict a, local float* restrict b, global const unsigned int* restrict c, global float4* restrict d, unsigned int e, float f) {
  const unsigned int g = get_global_id(0);
  if (g >= e)
    return;

  const unsigned int h = get_local_id(0);
  const unsigned int i = get_local_size(0);
  const unsigned int j = get_group_id(0);
  const unsigned int k = j * i;

  const float4 l = a[g];

  vstore3(l.xyz, h, b);

  barrier(1);

  const float m = l.w;
  const unsigned int n = __builtin_astype(m, uint);
  const unsigned int o = n >> 6;
  const unsigned int p = (n & 0x3f);

  float4 q, r = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
  float3 s;
  unsigned int t;
  int u;
  for (int v = 0; v < p; v++) {
    t = c[o + v];
    u = t - k;

    if (u >= 0 && u < i) {
      s = vload3(u, b);
   q = (s;
    } else {
      q = a[t];
    }
    r += (q - l);
  }

  r /= p;
  float4 w = l + f * r;
  w.w = m;
  d[g] = w;
}

kernel void C(global const float4* restrict a, local float* restrict b, global const unsigned int* restrict c, global float4* restrict d, unsigned int e, float f) {
  const unsigned int g = get_global_id(0);

  const unsigned int h = get_local_id(0);
  const unsigned int i = get_local_size(0);
  const unsigned int j = get_group_id(0);
  const unsigned int k = j * i;

  const int l = g - i;
  if (l >= 0)
    vstore3(a[g - i].xyz, h, b);

  if (g >= e)
    return;

  const float4 m = a[g];
  vstore3(m.xyz, (h + i), b);

  if (g + i < e)
    vstore3(a[g + i].xyz, (h + 2 * i), b);

  barrier(1);

  const float n = m.w;
  const unsigned int o = __builtin_astype(n, uint);
  const unsigned int p = o >> 6;
  const unsigned int q = (o & 0x3f);

  float4 r, s = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
  float3 t;
  unsigned int u;
  int v;
  const int w = 2 * i;
  for (int x = 0; x < q; x++) {
    u = c[p + x];
    v = u - k;

    if (v >= -i && v < w) {
      t = vload3(v + i, b);
   r = (t;
    } else {
      r = a[u];
    }
    s += (r - m);
  }

  s /= q;
  float4 y = m + f * s;
  y.w = n;

  d[g] = y;
}

kernel void D(global const float4* restrict a, global const unsigned int* restrict b, global const unsigned int* restrict c, global float4* restrict d, unsigned int e, float f) {
  const unsigned int g = get_global_id(0);
  if (g >= e)
    return;

  const float4 h = a[g];
  const float i = h.w;
  const unsigned int j = __builtin_astype(i, uint);

  float4 k;
  float4 l = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
  int m = 0;
  for (int n = 0; n < j; n++) {
    k = a[b[g + m]];
    l += (k - h);
    m += c[n];
  }

  l /= j;
  float4 o = h + f * l;
  o.w = i;
  d[g] = o;
}

kernel void E(global const float4* restrict a, global const unsigned int* restrict b, global const unsigned int* restrict c, local unsigned int* restrict d, const unsigned int e, global float4* restrict f, unsigned int g, float h) {
  const unsigned int i = get_local_id(0);
  const unsigned int j = get_global_id(0);

  if (i < e)
    d[i] = c[i];
  barrier(1);
  if (j >= g)
    return;

  const float4 k = a[j];
  const float l = k.w;
  const unsigned int m = __builtin_astype(l, uint);

  float4 n;
  float4 o = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
  int p = 0;
  for (int q = 0; q < m; q++) {
    n = a[b[j + p]];
    o += (n - k);
    p += d[q];
  }

  o /= m;
  float4 r = k + h * o;
  r.w = l;
  f[j] = r;
}
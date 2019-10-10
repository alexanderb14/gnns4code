kernel void A(global float* a, global float* b, int c) {
  int d = get_global_size(0);
  int e = get_global_size(1);

  int f = get_global_id(0);
  int g = get_global_id(1);

  int2 h = {f - c g - c};
  int2 i = {min(fd), min(ge)};
  int2 j = isless(convert_float2(h), 0.f);

  float k = 0.f;
  k += ((j.x || j.y) ? (0.f) : (a[h.y * d + h.x]));
  k -= ((j.y) ? (0.f) : (a[h.y * d + i.x]));
  k -= ((j.x) ? (0.f) : (a[i.y * d + h.x]));
  k += a[i.y * d + i.x];

  int2 l = i - ((j) ? (-1) : (h));
  float m = l.x * l.y;

  b[g * d + f] = k / m;
}
kernel void B(global float* a, global float4* b, local float* c, int d, float e) {
  int f = get_global_size(0);
  int g = get_global_size(1);
  int h = get_local_size(0);
  int i = get_local_size(1);

  int j = get_global_id(0);
  int k = get_global_id(1);
  int l = get_local_id(0);
  int m = get_local_id(1);
  int n = get_group_id(0);
  int o = get_group_id(1);

  int2 p = {j - d k - d};
  int2 q = {min(jf), min(kg)};
  int2 r = isless(convert_float2(p), 0.f);

  float s = 0.f;
  s += ((r.x || r.y) ? (0.f) : (a[p.y * f + p.x]));
  s -= ((r.y) ? (0.f) : (a[p.y * f + q.x]));
  s -= ((r.x) ? (0.f) : (a[q.y * f + p.x]));
  s += a[q.y * f + q.x];

  int2 t = q - ((r) ? (-1) : (p));
  float u = t.x * t.y;

  int v = m * h + l;

  c[v] = e * s / u;
  barrier(1);

  if (v < 16 * 16 / 4) {
    int w = v % 4;
    int x = v / 4;
    int y = 4 * w * h + x;
    float4 z = {
      y yh y2 * h y3 * h

                           b[(n * h + x) * g / 4 + (o * i / 4 + w)] = z;
  }
}
kernel void C(global float* a, global float* b, local float* c, int d) {
  int e = get_global_size(0);
  int f = get_global_size(1);
  int g = get_local_size(0);
  int h = get_local_size(1);
  int i = g + 2 * d;

  int j = get_global_id(0);
  int k = get_global_id(1);
  int l = get_local_id(0);
  int m = get_local_id(1);

  for (int n = m, o = k - d; n < h + 2 * d; n += h, o += h) {
    for (int p = l, q = j - d; p < g + 2 * d; p += g, q += g) {
      uint r = (q >= 0 && o >= 0 && q < e && o < f);
      c[n * i + p] = ((r) ? (a[o * e + q]) : (0.f));
    }
  }
  barrier(1);

  float s = 0.f;
  for (int t = m; t <= m + 2 * d; ++t)
    for (int u = l; u <= l + 2 * d; ++u)
      s += c[t * i + u];

  int2 v = {j - d k - d};
  int2 w = {min(je), min(kf)};
  int2 x = v < 0;

  int2 y = w - ((x) ? (-1) : (v));
  float z = y.x * y.y;

  b[k * e + j] = s / z;
}
__kernel void A(__global const float4* a, __global float4* b, int c, int d, int e) {
  const int f = get_global_id(0);
  int g = get_global_id(1) * e;
  const int h = min(g + e, d);

  const int i = max(f - 1, 0) + g * c;
  const int j = min(f + 1, c - 1) + g * c;
  int k = f + g * c;
  float4 l = a[i] + a[k] + a[j];

  const int m = max(g - 1, 0);
  const int n = max(f - 1, 0) + m * c;
  const int o = min(f + 1, c - 1) + m * c;
  const int p = f + m * c;
  float4 q = a[n] + a[p] + a[o];

  const int r = f + (d - 1) * c;
  const int s = max(f - 1, 0) + (d - 1) * c;
  const int t = min(f + 1, c - 1) + (d - 1) * c;

  const int u = min(g + 1, d - 1);
  int v = max(f - 1 + u * c, u * c);
  int w = min(f + 1 + u * c, u * c + c - 1);
  int x = f + u * c;

  for (; g < h; ++g, k += c, x += c, v += c, w += c) {
    const int y = min(x, r);
    const int i = min(v, s);
    const int j = min(w, t);
    const float4 z = a[i] + a[y] + a[j];
    const float4 aa = (z + l + q) * (1.f / 9.f);
    b[k] = aa;
    q = l;
    l = z;
  }
}
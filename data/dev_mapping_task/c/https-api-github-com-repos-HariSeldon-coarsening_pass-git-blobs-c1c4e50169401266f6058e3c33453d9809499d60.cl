__kernel void A(__global uint* a, __global uint* b, __global float* c, const uint2 d, const uint2 e) {
  uint f = get_global_id(0);

  uint g = d.x;
  uint h = d.y;

  uint i = f % g;
  uint j = f / g;

  uint k = e.x;
  uint l = e.y;

  uint m = (k - 1) / 2;
  uint n = (l - 1) / 2;

  uint o = (i < m) ? 0 : (i - m);
  uint p = ((i + m) >= g) ? g - 1 : (i + m);
  uint q = (j < n) ? 0 : (j - n);
  uint r = ((j + n) >= h) ? h - 1 : (j + n);

  float s = 0;

  for (uint t = o; t <= p; ++t)
    for (uint u = q; u <= r; ++u) {
      uint v = (u - (j - n)) * k + (t - (i - m));
      uint w = u * g + t;

      s += ((float)b[w] * c[v]);
    }

  s += 0.5f;
  a[f] = (uint)s;
}
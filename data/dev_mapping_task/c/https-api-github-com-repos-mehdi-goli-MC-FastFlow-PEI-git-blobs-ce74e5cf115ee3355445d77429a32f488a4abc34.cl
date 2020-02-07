__kernel void A(__global uint* a, __global uint* b, __global float* c, const uint2 d, const uint2 e, int f) {
  uint g = get_global_id(0);

  uint h = d.x;
  uint i = d.y;

  uint j = g % h;
  uint k = g / h;

  uint l = e.x;
  uint m = e.y;

  uint n = (l - 1) / 2;
  uint o = (m - 1) / 2;

  uint p = (j < n) ? 0 : (j - n);
  uint q = ((j + n) >= h) ? h - 1 : (j + n);
  uint r = (k < o) ? 0 : (k - o);
  uint s = ((k + o) >= i) ? i - 1 : (k + o);

  float t = 0;

  for (uint u = p; u <= q; ++u)
    for (uint v = r; v <= s; ++v) {
      uint w = (v - (k - o)) * l + (u - (j - n));
      uint x = v * h + u;

      t += ((float)b[x] * c[w]);
    }

  t += 0.5f;
  a[g] = (uint)t;
}
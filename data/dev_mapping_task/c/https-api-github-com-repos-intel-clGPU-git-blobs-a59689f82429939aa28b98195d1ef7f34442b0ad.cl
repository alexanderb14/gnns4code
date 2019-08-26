__kernel void A(uint a, uint b, uint c, float d, __global float* e, uint f, __global float* g, uint h, float i, __global float* j, uint k) {
  const uint l = get_global_id(0);
  const uint m = l;

  float n = 0.f;
  if (i != 0.f) {
    n = j[m * k] * i;
  }

  const uint o = max(m, c) - c;
  const uint p = min(m + b + 1, a);

  float q = 0.f;

  for (uint r = o; r < p; ++r) {
    float s = g[r * h];
    float t = e[((m) * (f) + ((c) + (r) - (m)))];
    q = mad(t, s, q);
  }

  n = mad(d, q, n);
  j[m * k] = n;
}
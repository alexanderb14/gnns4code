__kernel void A(__global float* a, __global float* b, uint c, uint d, uint e, uint f, uint g, uint h, float i) {
  uint j = get_global_id(0);
  uint k = get_global_id(1);
  uint l = get_global_id(2);

  uint m = j * g;
  uint n = k * h;

  uint o = e * f * l;

  float p = 0.0;
  for (uint q = 0; q < h; q++) {
    const uint r = o + (e * (n + q));
    for (uint s = 0; s < g; s++) {
      const uint t = r + m + s;
      const float u = a[t];
      p += u;
    }
  }

  uint v = c * d * l;
  uint w = v + (c * k);
  uint x = w + j;
  b[x] = p * i;
}

__kernel void B(__global float* a, __global float* b, uint c, uint d, uint e, uint f, uint g, uint h, float i) {
  uint j = get_global_id(0);
  uint k = get_global_id(1);
  uint l = get_global_id(2);

  uint m = j / g;
  uint n = k / h;

  uint o = e * f * l;
  const uint p = o + (e * n);
  const uint q = p + m;
  const float r = a[q];

  uint s = c * d * l;
  uint t = s + (c * k);
  uint u = t + j;
  b[u] = r * i;
}
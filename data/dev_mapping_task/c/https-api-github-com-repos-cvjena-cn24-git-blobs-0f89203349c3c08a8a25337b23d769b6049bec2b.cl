__kernel void A(__global float* a, __global float* b, __global float* c, uint d, uint e, uint f, uint g, uint h, uint i, uint j) {
  const uint k = get_global_id(0);
  const uint l = get_global_id(1);
  const uint m = get_global_id(2);

  const uint n = k * i;
  const uint o = l * j;

  const uint p = d * e * m;

  float q = -0x1.fffffep127f;
  uint r = 0;
  uint s = 0;
  for (uint t = 0; t < j; t++) {
    const uint u = p + (d * (o + t));
    for (uint v = 0; v < i; v++) {
      const uint w = u + n + v;

      b[w] = 0;
      const float x = a[w];
      if (x > q) {
        r = v;
        s = t;
        q = x;
      }
    }
  }

  const uint y = p + (d * (o + s));
  const uint z = y + n + r;
  b[z] = 1;

  const uint aa = g * h * m;
  const uint ab = aa + (g * l);
  c[ab + k] = q;
}

__kernel void B(__global float* a, __global float* b, __global float* c, uint d, uint e, uint f, uint g, uint h, uint i, uint j) {
  const uint k = get_global_id(0);
  const uint l = get_global_id(1);
  const uint m = get_global_id(2);

  const uint n = k / i;
  const uint o = l / j;

  const uint p = d * e * m;
  const uint q = p + (d * l);
  const uint r = q + k;
  const float s = b[r];

  const uint t = g * h * m;
  const uint u = t + (g * o);
  const uint v = u + n;
  const float w = c[v];

  a[r] = s * w;
}
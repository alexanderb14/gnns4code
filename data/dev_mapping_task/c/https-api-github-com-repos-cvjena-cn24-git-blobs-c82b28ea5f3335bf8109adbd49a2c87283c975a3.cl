__kernel void A(__global float* a, __global uint* b, __global float* c, uint d, uint e, uint f, uint g, uint h, uint i, uint j, uint k, uint l) {
  const uint m = get_global_id(0);
  const uint n = get_global_id(1);
  const uint o = get_global_id(2);

  const uint p = m * k;
  const uint q = n * l;

  const uint r = d * e * o;

  float s = -0x1.fffffep127f;
  uint t = 0;
  uint u = 0;
  for (uint v = 0; v < j; v++) {
    const uint w = r + (d * (q + v));
    for (uint x = 0; x < i; x++) {
      const uint y = w + p + x;
      const float z = a[y];
      if (z > s) {
        t = x;
        u = v;
        s = z;
      }
    }
  }

  const uint aa = g * h * o;
  const uint ab = aa + (g * n);
  c[ab + m] = s;

  b[ab + m] = (q + u) * d + (p + t);
}

__kernel void B(__global float* a, __global uint* b, __global float* c, uint d, uint e, uint f, uint g, uint h, uint i, uint j, uint k, uint l) {
  const uint m = get_global_id(0);
  const uint n = get_global_id(1);
  const uint o = get_global_id(2);
  const uint p = n * d + m;

  const uint q = g * h * o;

  const uint r = (m < i) ? 0 : (m - i) / k + 1;
  const uint s = min(m / k + 1, g);

  const uint t = (n < j) ? 0 : (n - j) / l + 1;
  const uint u = min(n / l + 1, h);

  float v = 0.0;
  uint w = 0;
  for (uint x = t; x < u; x++) {
    const uint y = q + (g * x);
    for (uint z = r; z < s; z++) {
      w++;
      const uint aa = y + z;

      if (b[aa] == p)
        v += c[aa];
    }
  }

  const uint ab = d * e * o;
  const uint ac = ab + (d * n);
  const uint ad = ac + m;

  a[ad] = v;
}
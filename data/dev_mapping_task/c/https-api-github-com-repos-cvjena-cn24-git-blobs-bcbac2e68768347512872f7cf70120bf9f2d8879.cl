__kernel void A(__global float* a, __global float* b, uint c, uint d, uint e) {
  const uint f = get_global_id(0);
  const uint g = get_global_id(1);

  const uint h = c * d * e * g;
  const uint i = h + c * d * f;

  float j = 0;

  for (uint k = 0; k < d; k++) {
    const uint l = i + c * k;
    if (c > 3) {
      const uint m = (c - 4) & ~(0x3);
      for (uint n = 0; (n << 2) <= m; n++) {
        const float4 o = vload4(n, a + l);
        j += dot(o, 1.0);
      }
      for (uint n = m + 4; n < c; n++) {
        const float o = a[l + n];
        j += o;
      }
    } else {
      for (uint n = 0; n < c; n++) {
        const float o = a[l + n];
        j += o;
      }
    }
  }

  b[g * e + f] = j;
}

__kernel void B(__global float* a, __global float* b, uint c, uint d, float e) {
  const uint f = get_global_id(0);
  float g = 0;
  for (uint h = 0; h < d; h++) {
    const float i = a[h * c + f];
    g += i;
  }

  g *= (e);

  b[f] = g;
}
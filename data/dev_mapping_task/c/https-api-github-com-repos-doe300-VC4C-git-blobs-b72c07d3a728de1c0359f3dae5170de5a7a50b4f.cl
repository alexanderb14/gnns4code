__kernel void A(__read_only image2d_t a, __global short* b, const int c, const int d, const int e, const float f, const float g) {
  const sampler_t h = 0x0000 | 0x0002 | 0x0000;

  uint i = get_global_id(0);
  uint j = get_global_id(1);

  float k = 0;
  float l = 0;
  uint m = read_imageui(a, h, (int2)(i, j)).x;
  float n = 1.f / f / f;
  float o = 1.f / g / g;

  for (int p = -e; p <= e; p++) {
    for (int q = -e; q <= e; q++) {
      uint r = read_imageui(a, h, (int2)(i + p, j + q)).x;
      float s = exp(-n * (p * p + q * q)) * exp(-o * ((1.f * m - r) * (1.f * m - r)));
      k += r * s;
      l += s;
    }
  }

  b[i + c * j] = (short)(k / l);
}

__kernel void B(__read_only image2d_t a, __global float* b, const int c, const int d, const int e, const float f, const float g) {
  const sampler_t h = 0x0000 | 0x0002 | 0x0000;

  uint i = get_global_id(0);
  uint j = get_global_id(1);

  float k = 0;
  float l = 0;
  float m = read_imagef(a, h, (int2)(i, j)).x;

  float n = 1.f / f / f;
  float o = 1.f / g / g;

  for (int p = -e; p <= e; p++) {
    for (int q = -e; q <= e; q++) {
      float r = read_imagef(a, h, (int2)(i + p, j + q)).x;
      float s = exp(-n * (p * p + q * q)) * exp(-o * ((1.f * m - r) * (1.f * m - r)));
      k += r * s;
      l += s;
    }
  }

  b[i + c * j] = k / l;
}
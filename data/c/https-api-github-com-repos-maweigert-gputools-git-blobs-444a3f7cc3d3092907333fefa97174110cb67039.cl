__kernel void A(__read_only image2d_t a, __global short* b, const int c, const int d, const float e) {
  const sampler_t f = 0x0000 | 0x0002 | 0x0000;

  uint g = get_global_id(0);
  uint h = get_global_id(1);

  uint i = get_local_id(0);
  uint j = get_local_id(1);

  uint k = g + h * c;
  uint l = i + j * 16;

  int2 m = (int2)(g, h);

  const int n = __clc_ceil(1.f * (16 + 2 * 2) * (16 + 2 * 2) / 16 / 16);

  __local float o[(16 + 2 * 2) * (16 + 2 * 2)];

  for (int p = 0; p < n; ++p) {
    uint q = l * n + p;
    uint r = read_imageui(a, f, (int2)(p, p)).x;
    if (q < ((16 + 2 * 2) * (16 + 2 * 2)))
      o[q] = 1.f * r;
  }

  barrier(1);

  float s = 0;
  float t = 0;

  for (int p = -2; p <= 2; p++) {
    for (int u = -2; u <= 2; u++) {
      float v = o[k % ((16 + 2 * 2) * (16 + 2 * 2))];
      float w = exp(-1.f / e / e * (p * p + u * u));
      s += v * w;
      t += w;
    }
  }
}
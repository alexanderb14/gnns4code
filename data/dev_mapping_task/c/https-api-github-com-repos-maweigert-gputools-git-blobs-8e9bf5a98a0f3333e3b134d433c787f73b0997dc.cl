__kernel void A(__read_only image2d_t a, __read_only image2d_t b, __global short* c, const int d, const int e, const int f, const float g, const float h) {
  const sampler_t i = 0x0000 | 0x0002 | 0x0000;

  const sampler_t j = 0x0000 | 0x0002 | 0x0000;

  uint k = get_global_id(0);
  uint l = get_global_id(1);

  float m = 0;
  float n = 0;
  uint o = read_imageui(a, i, (int2)(k, l)).x;

  float p = 0.0001f + read_imageui(b, j, (int2)(k, l)).x;
  ;

  float q = p;

  for (int r = -f; r <= f; r++) {
    for (int s = -f; s <= f; s++) {
      uint t = read_imageui(a, i, (int2)(k + r, l + s)).x;
      float u = 0.0001f + read_imageui(b, j, (int2)(k + r, l + s)).x;
      ;

      q = h * (p + u);
      float v = exp(-1.f / g / g * (r * r + s * s)) * exp(-1.f / q / q * ((1.f * o - t) * (1.f * o - t)));

      m += t * v;
      n += v;
    }
  }

  c[k + d * l] = (short)(m / n);
}
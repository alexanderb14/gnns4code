sampler_t Ga = 0x0000 | 0x0004 | 0x0000; __kernel void A(__read_only image2d_t a, uint b, uint c, __global float* d, __global float* e) {
  int f = get_global_id(0), g = get_global_id(1);
  if (f >= b || g >= c)
    return;

  int h = g * b + f;

  uint2 i = (uint2)0;

  int j = h - b, k = h + b;
  bool l = f < b - 1, m = g < c - 1, n = g, o = f;
  if (n) {
    if (o)
      i += (uint2)(1, 1) * (uint2)((read_imageui(a, Ga, (int2)(f - 1, g - 1)).x + read_imageui(a, Ga, (int2)(f - 1, g - 1)).y + read_imageui(a, Ga, (int2)(f - 1, g - 1)).z) * read_imageui(a, Ga, (int2)(f - 1, g - 1)).w / 255 / 3);
    i += (uint2)(2, 0) * (uint2)((read_imageui(a, Ga, (int2)(f, g - 1)).x + read_imageui(a, Ga, (int2)(f, g - 1)).y + read_imageui(a, Ga, (int2)(f, g - 1)).z) * read_imageui(a, Ga, (int2)(f, g - 1)).w / 255 / 3);
    if (l)
      i += (uint2)(1, -1) * (uint2)((read_imageui(a, Ga, (int2)(f + 1, g - 1)).x + read_imageui(a, Ga, (int2)(f + 1, g - 1)).y + read_imageui(a, Ga, (int2)(f + 1, g - 1)).z) * read_imageui(a, Ga, (int2)(f + 1, g - 1)).w / 255 / 3);
  }

  if (o)
    i += (uint2)(0, 2) * (uint2)((read_imageui(a, Ga, (int2)(f - 1, g)).x + read_imageui(a, Ga, (int2)(f - 1, g)).y + read_imageui(a, Ga, (int2)(f - 1, g)).z) * read_imageui(a, Ga, (int2)(f - 1, g)).w / 255 / 3);
  i += (uint2)(0, 0) * (uint2)((read_imageui(a, Ga, (int2)(f, g)).x + read_imageui(a, Ga, (int2)(f, g)).y + read_imageui(a, Ga, (int2)(f, g)).z) * read_imageui(a, Ga, (int2)(f, g)).w / 255 / 3);
  if (l)
    i += (uint2)(0, -2) * (uint2)((read_imageui(a, Ga, (int2)(f + 1, g)).x + read_imageui(a, Ga, (int2)(f + 1, g)).y + read_imageui(a, Ga, (int2)(f + 1, g)).z) * read_imageui(a, Ga, (int2)(f + 1, g)).w / 255 / 3);

  if (m) {
    if (o)
      i += (uint2)(-1, 1) * (uint2)((read_imageui(a, Ga, (int2)(f - 1, g + 1)).x + read_imageui(a, Ga, (int2)(f - 1, g + 1)).y + read_imageui(a, Ga, (int2)(f - 1, g + 1)).z) * read_imageui(a, Ga, (int2)(f - 1, g + 1)).w / 255 / 3);
    i += (uint2)(-2, 0) * (uint2)((read_imageui(a, Ga, (int2)(f, g + 1)).x + read_imageui(a, Ga, (int2)(f, g + 1)).y + read_imageui(a, Ga, (int2)(f, g + 1)).z) * read_imageui(a, Ga, (int2)(f, g + 1)).w / 255 / 3);
    if (l)
      i += (uint2)(-1, -1) * (uint2)((read_imageui(a, Ga, (int2)(f + 1, g + 1)).x + read_imageui(a, Ga, (int2)(f + 1, g + 1)).y + read_imageui(a, Ga, (int2)(f + 1, g + 1)).z) * read_imageui(a, Ga, (int2)(f + 1, g + 1)).w / 255 / 3);
  }

  uint2 p = i * i;
  d[h] = sqrt((float)(p.x + p.y));
  e[h] = atan2((float)i.y, (float)i.x);
}

__kernel void B(__global const float* a, float b, __global uchar4* c) {
  int d = get_global_id(0);
  uchar e = a[d] / b * 255;
  c[d] = (uchar4)(e, e, e, 255);
}
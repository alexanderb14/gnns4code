__constant sampler_t Ga = 0x0000 | 0x0002 | 0x0000; __kernel void A(__read_only image2d_t a, __read_only image2d_t b, __global uchar* c, __global uchar* d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);

  int2 i = {(4 * h - 1 * (h > 0)), (4 * g - 1 * (g > 0))};

  uint4 j = read_imageui(a, Ga, i);
  uint4 k = read_imageui(b, Ga, i);

  c[g * e + h] = 0.2126 * j.x + 0.7152 * j.y + 0.0722 * j.z;
  d[g * e + h] = 0.2126 * k.x + 0.7152 * k.y + 0.0722 * k.z;
}
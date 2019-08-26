kernel void A(__read_only image2d_t a, global uint4* b, unsigned int c, unsigned int d, unsigned int e, unsigned int f, unsigned int g, unsigned int h, unsigned int i) {
  int j = get_global_id(0);
  int k = get_global_id(1);
  if ((j >= c) || (k >= d))
    return;
  uint4 l;
  const sampler_t m = 0x0000 | 0x0000 | 0x0000;
  int2 n;
  n.x = f + j;
  n.y = g + k;
  l = read_imageui(a, m, n);

  *(b + i + c * k + j) = l;
}
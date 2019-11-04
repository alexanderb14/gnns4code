kernel void A(__read_only image2d_t a, global uchar* b, unsigned int c, unsigned int d, unsigned int e, unsigned int f, unsigned int g, unsigned int h, unsigned int i) {
  int j = get_global_id(0);
  int k = get_global_id(1);
  int l = get_global_id(2);
  uint4 m = (uint4)(0);
  int2 n;
  if ((j >= c) || (k >= d) || (l >= e))
    return;
  n.x = f + j;
  n.y = g + k;
  i += (l * d + k) * c + j;
  m.x = b[i];
  write_imageui(a, n, m);
}
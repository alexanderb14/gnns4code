__kernel void A(image2d_t a, int b) {
  int2 c;
  float4 d;
  int e = get_group_id(0);
  int f = get_group_id(1);
  int g = get_num_groups(0);
  int h = get_num_groups(1);

  c.x = get_global_id(0);
  c.y = get_global_id(1);
  d = (floatft)gh;
  write_imagef(a, c, d);
}
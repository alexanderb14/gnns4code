__kernel void A(image2d_t a, int b) {
  int2 c;
  float4 d;
  c.x = get_global_id(0);
  c.y = get_global_id(1);
  d = (float4){((b24)&0xFF), (b16)&0xFF, (b8)&0xFF, bxFF};
  d = d / 255.0f;
  write_imagef(a, c, d);
}
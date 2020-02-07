const sampler_t Ga = 0x0001 | 0x0006 | 0x0000; __kernel void A(__read_only image2d_t a) {
  int2 b = (int2)(get_global_id(0), get_global_id(1));
  float4 c = read_imagef(a, Ga, b);
}
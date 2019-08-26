__constant sampler_t Ga = 0x0000 | 0x0004 | 0x0000; __kernel void A(__read_only image2d_t a) {
  float4 b = read_imagef(a, Ga, (int2)(1));
}
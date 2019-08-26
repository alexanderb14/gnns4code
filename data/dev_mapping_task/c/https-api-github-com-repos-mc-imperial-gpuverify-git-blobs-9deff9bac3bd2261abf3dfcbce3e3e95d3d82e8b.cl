__kernel void A(__read_only image2d_t a, sampler_t b) {
  int2 c = (int2)(get_global_id(0), get_global_id(1));
  float4 d = read_imagef(a, b, c);
}
__kernel void A(__read_only image2d_t a, __global float* b) {
  const sampler_t c = 0x0000 | 0x0002 | 0x0000;

  int2 d = (int2){get_global_id(0), get_global_id(1)};
  int2 e = get_image_dim(a);

  float4 f = read_imagef(a, c, d);
  b[d.s1 * e.s0 + d.s0] = f.s0;
}
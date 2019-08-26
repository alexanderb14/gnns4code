__attribute__((reqd_work_group_size(32, 8, 1))) __kernel void A(__read_only image2d_t a, __global float* b, unsigned int c, unsigned int d, float e, float f, float g) {
  sampler_t h = 0x0000 | 0x0010;

  const int2 i = (int2)(get_global_id(0), get_global_id(1));

  const float2 j = convert_float2(get_image_dim(a) - 1) / 2.f;
    const float2 k = (ft float2 l =
        g * (convert_float2(i) - k) + j;


    b[c + i.y * d + i.x]
        = read_imagef(a, h, l).s0;
}
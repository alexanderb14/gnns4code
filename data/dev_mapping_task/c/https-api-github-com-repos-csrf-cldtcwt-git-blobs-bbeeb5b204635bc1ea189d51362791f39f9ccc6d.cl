__attribute__((reqd_work_group_size(32, 8, 1))) __kernel void A(__read_only image2d_t a, __global float* b, unsigned int c, unsigned int d) {
  sampler_t e = 0x0000 | 0x0010;

  const int2 f = (int2)(get_global_id(0), get_global_id(1));

  b[c + f.y * d + f.x] = read_imagef(a, e, f).s0;
}
void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(read_only image2d_t a, float2 b, global float4* c) {
  sampler_t d = 0x0000 | 0x0002 | 0x0010;
  *c = read_imagef(a, d, b);
}
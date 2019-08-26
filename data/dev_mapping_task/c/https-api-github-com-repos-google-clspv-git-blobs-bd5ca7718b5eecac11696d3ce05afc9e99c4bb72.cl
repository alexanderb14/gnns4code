void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(sampler_t a, read_only image2d_t b, float2 c, global float4* d) {
  *d = read_imagef(b, a, c);
}
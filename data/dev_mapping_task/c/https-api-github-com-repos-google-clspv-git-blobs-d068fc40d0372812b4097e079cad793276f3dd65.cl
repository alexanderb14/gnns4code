constant sampler_t Ga = 0x0000 | 0x0002 | 0x0010; constant sampler_t Gb = 0x0000 | 0x0002 | 0x0000; void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(read_only image2d_t a, float2 b, global float4* c) {
  if (b.x < 0.0f) {
    *c = read_imagef(a, Ga, b);
  } else {
    *c = read_imagef(a, Gb, b);
  }
}
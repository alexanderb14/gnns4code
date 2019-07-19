float2 A(float2 a, read_only image2d_t b) {
  return a + (float2)(2.5, 2.5);
}

void kernel B(global float4* a, read_only image2d_t b, sampler_t c, float2 d) {
  *a = read_imagef(b, c, A(d, b));
}
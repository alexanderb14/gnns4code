void __attribute__((overloadable)) A(sampler_t, read_only image1d_t); void __attribute__((overloadable)) A(sampler_t, read_only image2d_t); constant sampler_t Ga = 5; void kernel B(read_only image1d_t a, read_only image2d_t b) {
  const sampler_t c = 10;
  A(Ga, a);
  A(c, b);
}
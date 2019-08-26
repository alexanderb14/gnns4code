__kernel void A(__read_only image2d_t a, __global float* b, __global float* c, const int d, const int e) {
  const sampler_t f = 0x0000 | 0x0002 | 0x0000;

  int g = get_global_id(0);

  float h = 0.f;

  for (int i = 0; i < e; ++i) {
    float j = -.5f * (e - 1) + i;
    h += b[i] * read_imagef(a, f, (float2)(gj0)).x;
  }

  c[g] = h;
}
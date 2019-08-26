__kernel void A(__read_only image2d_t a, __global float* b, __global float* c, const int d, const int e, const int f, const int g) {
  const sampler_t h = 0x0000 | 0x0002 | 0x0000;

  int i = get_global_id(0);
  int j = get_global_id(1);

  float k = 0.f;

  for (int l = 0; l < f; ++l) {
    for (int m = 0; m < g; ++m) {
      float n = -.5f * (f - 1) + l;
      float o = -.5f * (g - 1) + m;

  k += b[l+f*m]*read_imagef(a,h,(float2)(injo).x;
    }
  }
  c[i + j * d] = k;
}
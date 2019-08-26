__constant sampler_t Ga = 0x0000 | 0x0002 | 0x0000; __kernel void A(__read_only image2d_t a, __constant float* b, __global float* c, __private int d) {
  const int2 e = {get_global_id(0), get_global_id(1)};

  float f = 0.0f;

  for (int g = -d; g < d + 1; g++) {
    for (int h = -d; h < d + 1; h++) {
      f += b[g + d + (h + d) * (d * 2 + 1)] * read_imagef(a, Ga, e + (int2)(g, h)).x;
    }
  }

  c[e.x + e.y * get_global_size(0)] = f;
}
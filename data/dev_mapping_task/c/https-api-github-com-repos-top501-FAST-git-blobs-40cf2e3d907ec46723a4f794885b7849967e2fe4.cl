__constant sampler_t Ga = 0x0000 | 0x0000 | 0x0000; __kernel void A(__read_only image2d_t a, __global char* b, __global char* c, __private float d, __private float e) {
  const int2 f = {get_global_id(0), get_global_id(1)};
  const uint g = f.x + f.y * get_global_size(0);

  int2 h[8] = {{1, 0}, {0, 1}, {1, 1}, {-1, 0}, {0, -1}, {-1, -1}, {-1, 1}, {1, -1}};

  if (b[g] == 2) {
    float i = (float)read_imageui(a, Ga, f).x;
    if (i >= d && i <= e) {
      b[g] = 1;

      for (int j = 0; j < 8; j++) {
        int2 k = f + h[j];
        if (k.x < 0 || k.y < 0 || k.x >= get_global_size(0) || k.y >= get_global_size(1))
          continue;
        uint l = k.x + k.y * get_global_size(0);
        if (b[l] == 0) {
          b[l] = 2;
          c[0] = 0;
        }
      }
    } else {
      b[g] = 0;
    }
  }
}
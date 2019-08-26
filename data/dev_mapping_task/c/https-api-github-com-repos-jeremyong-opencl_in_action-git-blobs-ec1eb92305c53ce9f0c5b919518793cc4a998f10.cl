__constant sampler_t Ga = 0x0000 | 0x0002 | 0x0000; __kernel void A(read_only image2d_t a, __global uchar* b) {
  int c[9] = {-1, -1, -1, -1, 9, -1, -1, -1, -1};

  int d = get_global_id(0);
  int e = get_global_id(1);

  int f = c[0] * read_imageui(a, Ga, (int2)(d - 1, e - 1)).s0 + c[1] * read_imageui(a, Ga, (int2)(d, e - 1)).s0 + c[2] * read_imageui(a, Ga, (int2)(d + 1, e - 1)).s0 + c[3] * read_imageui(a, Ga, (int2)(d - 1, e)).s0 + c[4] * read_imageui(a, Ga, (int2)(d, e)).s0 + c[5] * read_imageui(a, Ga, (int2)(d + 1, e)).s0 + c[6] * read_imageui(a, Ga, (int2)(d - 1, e + 1)).s0 + c[7] * read_imageui(a, Ga, (int2)(d, e + 1)).s0 + c[8] * read_imageui(a, Ga, (int2)(d + 1, e + 1)).s0;

  b[e * get_global_size(0) + d] = (uchar)clamp(f, 0, 255);
}
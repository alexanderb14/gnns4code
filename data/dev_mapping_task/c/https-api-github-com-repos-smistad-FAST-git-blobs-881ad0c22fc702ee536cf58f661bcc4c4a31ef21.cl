__constant sampler_t Ga = 0x0000 | 0x0000 | 0x0000; __kernel void A(__read_only image2d_t a, __global float* b, __private float c, __private int d, __private int e) {
  const int2 f = {get_global_id(0), get_global_id(1)};
  const int g = get_image_channel_data_type(a);
  float h;
  if (g == 0x10DE) {
    h = read_imagef(a, Ga, f).x;
  } else if (g == 0x10D7 || g == 0x10D8) {
    h = read_imagei(a, Ga, f).x;
  } else {
    h = read_imageui(a, Ga, f).x;
  }

  h = h * c;
  if (e) {
    h = h * 2 - 1;
  }

  if (d == 1) {
    b[f.x + (get_global_size(0) - f.y - 1) * get_global_size(0)] = h;
  } else {
    b[f.x + f.y * get_global_size(0)] = h;
  }
}
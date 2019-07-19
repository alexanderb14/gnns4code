__kernel void A(__read_only image3d_t a, __global int* b) {
  b[0] = get_image_width(a);
  b[1] = get_image_height(a);
  b[3] = get_image_depth(a);
  b[4] = get_image_channel_data_type(a);
  b[5] = get_image_channel_order(a);
}
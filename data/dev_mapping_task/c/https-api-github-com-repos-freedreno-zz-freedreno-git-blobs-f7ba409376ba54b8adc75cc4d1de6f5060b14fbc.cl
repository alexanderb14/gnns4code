__kernel void A(__read_only image2d_t a, __global int* b) {
  b[0] = get_image_channel_order(a);
}
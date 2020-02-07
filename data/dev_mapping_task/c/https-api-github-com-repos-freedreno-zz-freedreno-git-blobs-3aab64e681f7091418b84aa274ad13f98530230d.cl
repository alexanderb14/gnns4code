__kernel void A(__read_only image3d_t a, __global int* b) {
  b[0] = get_image_width(a);
}
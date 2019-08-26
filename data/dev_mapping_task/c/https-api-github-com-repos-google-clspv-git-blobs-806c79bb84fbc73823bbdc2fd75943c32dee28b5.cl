void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global int* a, read_only image2d_t b) {
  *a = get_image_width(b);
}
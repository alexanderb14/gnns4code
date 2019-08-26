__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(__global const char16* a, __global char16* b) {
  size_t c = get_global_id(0);
  b[c] = a[c];
}
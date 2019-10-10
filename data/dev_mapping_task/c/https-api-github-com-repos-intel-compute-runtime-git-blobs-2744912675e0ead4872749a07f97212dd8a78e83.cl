__kernel __attribute__((reqd_work_group_size(8, 4, 4))) void A(__global unsigned int* a, __global unsigned int* b) {
  int c = (int)get_global_id(0);
  b[c] = a[c];
}

__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void B(__global unsigned int* a, __global unsigned int* b) {
  int c = (int)get_global_id(0);
  b[c] = a[c];
}
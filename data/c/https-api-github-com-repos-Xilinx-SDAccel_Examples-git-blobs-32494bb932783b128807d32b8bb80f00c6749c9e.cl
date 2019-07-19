__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(__global uint* a, __global uint* b, uint c) {
  for (uint d = 0; d < c; d++) {
    a[d] = b[d];
  }
}
void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global short* a, global float* b) {
  vstore_half(*b, 0, (global half*)a);
}
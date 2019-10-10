void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global float* a, global float* b) {
  *a = fmin(*b, 1.0f);
}
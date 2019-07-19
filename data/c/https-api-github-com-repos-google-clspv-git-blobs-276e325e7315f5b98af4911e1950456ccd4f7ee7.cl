void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global float* a, global float* b) {
  *a = mad(*b, 42.0f, 1.0f);
}
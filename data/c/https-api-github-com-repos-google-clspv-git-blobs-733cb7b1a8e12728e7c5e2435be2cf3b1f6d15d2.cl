void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global float* a, global float* b) {
  *a = clamp(*b, 0.0f, 1.0f);
}
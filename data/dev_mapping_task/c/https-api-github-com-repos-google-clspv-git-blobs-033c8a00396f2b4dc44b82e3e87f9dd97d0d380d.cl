void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global int* a, global float* b) {
  *a = isequal(b[0], b[1]);
}
void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global uint* a, global float* b) {
  *b = (float)*a;
}
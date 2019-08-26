void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(constant uint* a, global uint* b) {
  *b = *a;
}
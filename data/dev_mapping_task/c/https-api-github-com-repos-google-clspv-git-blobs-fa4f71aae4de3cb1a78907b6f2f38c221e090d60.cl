void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global float* a, global int* b, int c) {
  ((global int*)a)[c] = *b;
}
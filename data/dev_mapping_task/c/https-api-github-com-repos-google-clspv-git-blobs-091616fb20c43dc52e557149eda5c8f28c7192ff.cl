void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global int* a, global float* b, int c) {
  global half* d = (global half*)a;
  vstore_half(*b, c, (global half*)a);
}
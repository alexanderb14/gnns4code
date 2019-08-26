void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global float* a, float b, local float* c, uint d) {
  a[d] = c[d] + b;
}
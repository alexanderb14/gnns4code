void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global int2* a, global float2* b) {
  *a = isinf(b[0]);
}
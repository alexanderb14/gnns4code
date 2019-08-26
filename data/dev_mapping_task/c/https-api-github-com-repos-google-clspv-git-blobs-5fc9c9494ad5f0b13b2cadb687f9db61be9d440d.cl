void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global float2* a, global float2* b) {
  *a = mad(*b, 42.0f, 1.0f);
}
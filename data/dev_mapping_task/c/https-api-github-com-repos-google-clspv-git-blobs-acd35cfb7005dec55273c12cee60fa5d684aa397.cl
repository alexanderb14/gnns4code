void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global float2* a, global float2* b, global float2* c) {
  *a = atan2(*b, *c);
}
void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global int4* a, global float4* b) {
  *a = signbit(b[0]);
}
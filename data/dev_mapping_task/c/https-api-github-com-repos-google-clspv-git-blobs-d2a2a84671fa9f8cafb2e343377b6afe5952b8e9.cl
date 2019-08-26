void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global int2* a, global float4* b) {
  *((global float4*)a) = *b;
}
void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global int3* a, global float3* b) {
  *a = isnotequal(b[0], b[1]);
}
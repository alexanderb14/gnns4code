void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(float a, global float4* b) {
  (*b).y = a;
}
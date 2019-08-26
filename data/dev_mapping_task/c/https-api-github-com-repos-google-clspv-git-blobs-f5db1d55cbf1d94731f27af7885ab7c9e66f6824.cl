void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global float4* a, global float4* b) {
  *a = fmax(*b, 1.0f);
}
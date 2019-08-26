void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global float4* a, global float2* b) {
  vstore_half2(*b, 0, (global half*)a);
}
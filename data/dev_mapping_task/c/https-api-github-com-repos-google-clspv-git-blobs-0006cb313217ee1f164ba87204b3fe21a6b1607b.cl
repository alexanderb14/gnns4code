typedef float float3 __attribute__((ext_vector_type(3))); typedef int int3 __attribute__((ext_vector_type(3))); void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global float3* a, global float3* b, global int3* c) {
  local int3 d;
  *a = frexp(*b, &d);
  *c = d;
}
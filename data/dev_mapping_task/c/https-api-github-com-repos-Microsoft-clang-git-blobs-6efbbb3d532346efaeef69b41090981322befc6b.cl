typedef float float3 __attribute__((ext_vector_type(3))); typedef float float4 __attribute__((ext_vector_type(4))); void kernel A(global float3* a, global float3* b) {
  *b = *a;
}

void kernel B(global float3* a, global float4* b) {
  *a = __builtin_astype(*b, float3);
}

void kernel C(global float3* a, global float4* b) {
  *b = __builtin_astype(*a, float4);
}
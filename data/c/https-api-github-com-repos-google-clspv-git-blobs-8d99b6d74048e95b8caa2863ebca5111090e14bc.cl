void kernel A(global float3* a, float3 b) {
  *a = asinpi(b);
}
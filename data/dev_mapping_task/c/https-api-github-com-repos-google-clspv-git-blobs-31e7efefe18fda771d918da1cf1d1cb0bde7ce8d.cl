void kernel A(global float3* a, float3 b, float3 c) {
  *a = atan2pi(b, c);
}
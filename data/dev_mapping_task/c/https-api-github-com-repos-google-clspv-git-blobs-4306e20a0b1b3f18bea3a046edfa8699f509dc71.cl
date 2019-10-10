void kernel A(global float4* a, float4 b, float4 c) {
  *a = atan2pi(b, c);
}
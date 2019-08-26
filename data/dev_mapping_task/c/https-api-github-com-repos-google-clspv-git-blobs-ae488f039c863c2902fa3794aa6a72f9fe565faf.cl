void kernel A(global float2* a, float2 b, float2 c) {
  *a = atan2pi(b, c);
}
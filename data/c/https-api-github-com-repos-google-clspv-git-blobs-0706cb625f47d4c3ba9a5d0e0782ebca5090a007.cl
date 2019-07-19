void kernel A(global float2* a, float2 b) {
  *a = asinpi(b);
}
void kernel A(global float4* a, float4 b) {
  *a = asinpi(b);
}
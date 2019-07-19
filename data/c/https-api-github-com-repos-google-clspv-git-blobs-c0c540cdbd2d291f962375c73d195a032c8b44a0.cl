void kernel A(global float4* a) {
  float4 b;
  b.w = 1111.0f;
  *a = b;
}
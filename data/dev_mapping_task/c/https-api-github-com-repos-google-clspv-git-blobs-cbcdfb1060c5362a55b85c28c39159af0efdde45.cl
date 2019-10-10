void kernel A(global float3* a, global float3* b, float3 c) {
  float3 d;
  *a = fract(c, &d);
  *b = d;
}
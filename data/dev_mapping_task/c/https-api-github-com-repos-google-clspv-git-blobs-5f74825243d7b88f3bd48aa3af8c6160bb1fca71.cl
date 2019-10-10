void kernel A(global float4* a, global float4* b, float4 c) {
  float4 d;
  *a = fract(c, &d);
  *b = d;
}
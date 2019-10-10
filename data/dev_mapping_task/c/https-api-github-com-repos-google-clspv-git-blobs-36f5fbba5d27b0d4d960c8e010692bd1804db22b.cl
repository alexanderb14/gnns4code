void kernel A(global float2* a, global float2* b, float2 c) {
  float2 d;
  *a = fract(c, &d);
  *b = d;
}
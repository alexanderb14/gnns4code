void kernel A(global float* a, global float* b, float c) {
  float d;
  *a = fract(c, &d);
  *b = d;
}
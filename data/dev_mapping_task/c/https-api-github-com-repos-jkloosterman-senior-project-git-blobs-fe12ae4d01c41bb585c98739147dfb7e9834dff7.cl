float A(int a, int b, int c) {
  float d = a;
  float e = b;
  float f = c;

  return e * __clc_pow(d, 1.0f / f);
}
float B(int a, int b, int c, int d) {
  float e = a;
  float f = b;
  float g = c;
  float h = d;

  float i = g * h * __clc_pow(e, (1 / h) + 1);
  float j = g * h * __clc_pow(f, (1 / h) + 1);
  float k = h + 1;

  return (j - i) / k;
}
float C(int a, int b, int c) {
  return A(a, b, c) - A(a - 1, b, c);
}
float D(int a, int b, int c, float d) {
  return C(a + 1, b, c) / d;
}
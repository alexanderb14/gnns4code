float A(float, float, float, float); float B(float); __kernel void C(int a, float b, float c, int d, __global float* e, __global uchar* f) {
  int g = get_global_id(0);
  int h = get_global_id(1);
  float i = (float)a - 1;
  float j = b * ((2 * (float)g / i) - 1);
  float k = b * ((2 * (float)h / i) - 1);
  float l = 0.0f;
  for (int m = 0; m < d; ++m) {
    l += A(c, e[m], j, k);
  }
  uchar n = (uchar)(255.0f * clamp(B(l), 0.0f, 1.0f));
  vstore4((uchar4)(255, n, 128, n), h * a + g, f);
}

float B(float a) {
  int b = (int)a;
  if (a < 0)
    b -= 1;
  float c = a - (float)b;
  if (b % 2 == 1)
    c = 1 - c;
  return c;
}

float A(float a, float b, float c, float d) {
  return (cos(cos(b) * c + sin(b) * d + a) + 1) / 2;
}
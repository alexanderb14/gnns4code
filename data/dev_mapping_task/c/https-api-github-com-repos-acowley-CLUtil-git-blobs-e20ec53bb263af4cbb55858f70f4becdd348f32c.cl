float A(float); __kernel void B(int a, float b, float c, __global float* d, __global float* e, __global uchar* f) {
  int g = get_global_id(0);
  int h = get_global_id(1);
  float i = (float)a - 1;
  float j = b * ((2 * (float)g / i) - 1);
  float k = b * ((2 * (float)h / i) - 1);

  float8 l = vload8(0, d);
  float8 m = vload8(0, e);

  float8 n = (cos(l * j + m * k + c) + 1.0f) / 2.0f;
  float o = n.s0 + n.s1 + n.s2 + n.s3 + n.s4 + n.s5 + n.s6;
  uchar p = (uchar)(255.0f * clamp(A(o), 0.0f, 1.0f));
  vstore4((uchar4)(255, p, 128, p), h * a + g, f);
}

float A(float a) {
  int b = (int)a;
  if (a < 0)
    b -= 1;
  float c = a - (float)b;
  if (b % 2 == 1)
    c = 1 - c;
  return c;
}
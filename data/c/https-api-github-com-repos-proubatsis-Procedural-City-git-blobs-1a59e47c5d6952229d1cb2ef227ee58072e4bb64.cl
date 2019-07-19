float A(float a, float b) {
  float c = -0.5 * cospi(2 * a) + 0.5;
  if (c > (1.0 - b)) {
    return 1.0;
  } else {
    return 0.0;
  }
}

float B(float a, float b) {
  float c = 5.0 * a;
  float d = 12.5 * (b - 10.0);

  float e = 0.0;
  if (((int)d) % 2 == 0) {
    e = A(c, 0.99);
  } else {
    e = A(5 * (a - 0.5), 0.99);
  }
  e = e + A(d, 0.99);

  return e;
}

__kernel void C(__global unsigned char* a, int b, int c) {
  int d = get_global_id(0);

  unsigned char e, f, g;
  float h = B((d % b) / (float)b, (d / b) / (float)c);

  if (h > 1.0) {
    e = 192;
    f = e;
    g = e;
  } else {
    e = 100;
    f = e;
    g = e;
  }

  d = d * 4;

  a[d] = g;
  a[d + 1] = f;
  a[d + 2] = e;
  a[d + 3] = 255;
}
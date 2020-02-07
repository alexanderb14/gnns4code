typedef struct Color { int r, g, b; } color;

float A(float a, float b) {
  if (b >= a) {
    return 1;
  }
  return 0;
}

float B(float a, float b, float c) {
  return A(a, c) - A(b, c);
}

color C(float a, float b) {
  float c = 15 * a + 1;
  float d = 15 * b + 1;
  int e = (int)c;
  int f = (int)d;
  float g = c - e;
  float h = d - f;

  float i = B(0.4, 0.6, h) + B(0.49, 0.51, h);
  color j;
  if (i == 2.0) {
    j.r = 26;
    j.g = 26;
    j.b = 26;
  } else if (i == 1.0) {
    j.r = 77;
    j.g = 77;
    j.b = 77;
  } else {
    j.r = 102;
    j.g = 102;
    j.b = 102;
  }
  return j;
}

__kernel void D(__global unsigned char* a, int b, int c) {
  int d = get_global_id(0);

  unsigned char e, f, g;
  color h = C((d % b) / (float)b, (d / b) / (float)c);

  e = h.r;
  f = h.g;
  g = h.b;

  d = d * 4;

  a[d] = g;
  a[d + 1] = f;
  a[d + 2] = e;
  a[d + 3] = 255;
}
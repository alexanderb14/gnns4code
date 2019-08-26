float A(float a, float b) {
  if (b >= a) {
    return 1;
  }
  return 0;
}

float B(float a, float b, float c) {
  return A(a, c) - A(b, c);
}

int C(float a, float b) {
  float c = a * 32 + 1;
  float d = b * 32 + 1;
  int e = (int)c;
  int f = (int)d;
  float g = c - e;
  float h = d - f;

  if (f == 1 || f == 3 || f == 30 || f == 32) {
    float i = B(0.5 - (0.25 / 2), 0.5 + (0.25 / 2), h);
    return (int)i * 255;
  } else if (e == 30 || e == 32) {
    float i = B(0.5 - (0.25 / 2), 0.5 + (0.25 / 2), g);
    return (int)i * 255;
  }

  return 0;
}

__kernel void D(__global unsigned char* a, int b, int c) {
  int d = get_global_id(0);

  unsigned char e, f, g;
  int h = C((d % b) / (float)b, (d / b) / (float)c);

  e = h;
  f = e;
  g = e;

  d = d * 4;

  a[d] = g;
  a[d + 1] = f;
  a[d + 2] = e;
  a[d + 3] = 255;
}
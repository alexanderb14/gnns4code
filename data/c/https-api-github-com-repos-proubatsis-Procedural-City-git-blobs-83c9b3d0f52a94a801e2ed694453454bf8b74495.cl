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

int C(float a, float b) {
  float c = a * 32 + 1;
  float d = b * 32 + 1;
  int e = (int)c;
  int f = (int)d;
  float g = c - e;
  float h = d - f;

  if (e == 30 || e == 32) {
    float i = B(0.5 - (0.25 / 2), 0.5 + (0.25 / 2), g);
    return (int)i * 255;
  }

  return 0;
}

color D(float a, float b) {
  float c = B(0.5 - (0.25 / 2), 0.5 + (0.25 / 2), a);
  color d;
  d.r = c * 255;
  d.g = c * 255;
  d.b = 0;

  return d;
}

color E(float a, float b) {
  float c = B(0.5 - (0.25 / 2), 0.5 + (0.25 / 2), a) - B(0.5 - (0.5 / 2), 0.5 + (0.5 / 2), b);

  color d;
  d.r = 0;
  d.g = 0;
  d.b = 0;

  if (c > 0.0) {
    d.r = c * 255;
    d.g = c * 255;
    d.b = c * 255;
  }

  return d;
}

color F(float a, float b) {
  float c = a * 31 + 1;
  float d = b * 31 + 1;
  int e = (int)c;
  int f = (int)d;
  float g = c - e;
  float h = d - f;

  if (C(a, b) == 255) {
    color i;
    i.r = 255;
    i.g = 255;
    i.b = 255;
    return i;
  }

  if (e == 16) {
    return D(g, h);
  }
  if (e == 8 || e == 12 || e == 20 || e == 24) {
    return E(g, h);
  }

  color j;
  j.r = 0;
  j.g = 0;
  j.b = 0;

  return j;
}

__kernel void G(__global unsigned char* a, int b, int c) {
  int d = get_global_id(0);

  unsigned char e, f, g;
  color h = F((d % b) / (float)b, (d / b) / (float)c);

  e = h.r;
  f = h.g;
  g = h.b;

  d = d * 4;

  a[d] = g;
  a[d + 1] = f;
  a[d + 2] = e;
  a[d + 3] = 255;
}
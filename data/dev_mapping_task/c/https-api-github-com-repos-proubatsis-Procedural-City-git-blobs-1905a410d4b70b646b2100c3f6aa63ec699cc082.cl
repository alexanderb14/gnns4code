float A(float a, float b) {
  if (b >= a) {
    return 1;
  }
  return 0;
}

float B(float a, float b, float c) {
  return A(a, c) - A(b, c);
}

float C(float a, float b) {
  return B(0.05, 0.95, a) - B(0.48, 0.52, a) - B(0, 0.05, b) - B(0.95, 1, b) - B(0.48, 0.52, b);
}

__kernel void D(__global unsigned char* a, int b, int c) {
  int d = get_global_id(0);

  unsigned char e, f, g;
  float h = C((d % b) / (float)b, (d / b) / (float)c);

  e = 0;
  f = h * 64;
  g = h * 128;

  d = d * 4;

  a[d] = g;
  a[d + 1] = f;
  a[d + 2] = e;
  a[d + 3] = 255;
}
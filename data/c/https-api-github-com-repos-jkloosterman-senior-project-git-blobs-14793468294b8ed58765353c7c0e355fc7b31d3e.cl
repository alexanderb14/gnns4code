float A(int a, int b, int c, int d) {
  float e = a;
  float f = b;
  float g = c;
  float h = d;

  float i = h - ((h - g) * exp(-sqrt(h) * 2 * exp(-(h - g) * e / f)));

  return i;
}
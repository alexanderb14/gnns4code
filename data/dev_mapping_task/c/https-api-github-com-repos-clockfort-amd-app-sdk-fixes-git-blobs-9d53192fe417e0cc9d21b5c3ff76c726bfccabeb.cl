float A(int a, __local int* b) {
  int c;
  int d;
  int e = 0;

  int f = get_local_id(0);

  for (c = 4; c >= 0; c--) {
    d = a / 127773;
    a = 16807 * (a - d * 127773) - 2836 * d;

    if (a < 0)
      a += 2147483647;

    if (c < 4)
      b[4 * f + c] = a;
  }
  e = b[0];

  d = a / 127773;
  a = 16807 * (a - d * 127773) - 2836 * d;

  if (a < 0)
    a += 2147483647;

  c = e / (1 + (2147483647 - 1) / 4);
  e = b[4 * f + c];
  return ((1.0 / 2147483647) * e);
}

float2 B(float2 a) {
  float b = sqrt(-2 * log(a.x));
  float c = 2 * 3.14 * a.y;
    return (float2)(b * sin(b * cos(c
}
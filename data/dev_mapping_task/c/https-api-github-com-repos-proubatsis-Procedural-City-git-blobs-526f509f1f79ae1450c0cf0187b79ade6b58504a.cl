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
  float c = B(0.28 / 2, 1 - 0.28 / 2, a);
  float d = B(0.12 / 2, 1 - 0.12 / 2, b);

  if (c == 1 && d == 0) {
    return 1;
  } else if (c == 0) {
    return 2;
  }
  return 3;
}

float D(float a, float b) {
  float c = a * 5;
  float d = b * 25;
  int e = (int)c;
  int f = (int)d;
  float g = c - e;
  float h = d - f;

  int i = C(g, h);
  if (i != 3)
    return i;

  i = 4;
  if (f % 2 == 0)
    i = 5;

  return i;
}

__kernel void E(__global unsigned char* a, int b, int c) {
  int d = get_global_id(0);

  unsigned char e, f, g;
  float h = D((d % b) / (float)b, (d / b) / (float)c);

  if (h == 1) {
    e = 87;
    f = 97;
    g = 102;
  } else if (h == 2) {
    e = 153;
    f = e;
    g = e;
  } else if (h == 4) {
    e = 51;
    f = 77;
    g = 128;
  } else {
    e = 104;
    f = 128;
    g = 179;
  }

  d = d * 4;

  a[d] = g;
  a[d + 1] = f;
  a[d + 2] = e;
  a[d + 3] = 255;
}
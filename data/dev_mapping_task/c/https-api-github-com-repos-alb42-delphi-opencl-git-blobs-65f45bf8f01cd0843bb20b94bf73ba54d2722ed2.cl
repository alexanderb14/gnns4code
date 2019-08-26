float A(float a) {
  return a * 3.25 - 2;
}

float B(float a) {
  return a * 2.5 - 1.25;
}

int C(int a, int b, int c) {
  return a * 4 + 4 * c * b;
}

char D(char a) {
  if (a > 255)
    return 0;
  return a;
}

__kernel void E(__global char* a) {
  int b = get_global_id(0);
  int c = get_global_id(1);
  size_t d = get_global_size(0);
  size_t e = get_global_size(1);
  int f = C(b, c, d);

  float g = A((float)b / d);
  float h = B((float)c / e);

  float i = 0.0;
  float j = 0.0;

  char k = 0;

  char l = 127;
  while ((i * i + j * j <= 4) && (k < l)) {
    float m = i * i - j * j + g;
    j = 2 * i * j + h;
    i = m;
    k++;
  }

  if (k == l) {
    a[f] = 0;
    a[f + 1] = 0;
    a[f + 2] = 0;
  } else {
    a[f] = D(k * 5 * i * j / 100);
    a[f + 1] = D(k * i / 10);
    a[f + 2] = D(k * j / 10);
  }
  a[f + 3] = 255;
}
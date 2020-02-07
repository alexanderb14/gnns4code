int A(int a, int b, int c) {
  return 3 * c * b + a * 3;
}

float B(float a) {
  return a * 3.25 - 2;
}

float C(float a) {
  return a * 2.5 - 1.25;
}

__kernel void D(__global char* a) {
  int b = get_global_id(0);
  int c = get_global_id(1);
  size_t d = get_global_size(0);
  size_t e = get_global_size(1);
  int f = A(b, c, d);

  float g = B((float)b / d);
  float h = C((float)c / e);

  float i = 0.0;
  float j = 0.0;

  int k = 0;

  int l = 256;
  while (i * i + j * j <= 4 && k < l) {
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
    a[f] = k;
    a[f + 1] = k;
    a[f + 2] = k;
  }
}
inline int A(int a, int b, int c) {
  return 4 * c * b + a * 4;
}
inline float B(float a) {
  return a * 3.25f - 2.f;
}
inline float C(float a) {
  return a * 2.5f - 1.25f;
}

__kernel void D(__global char* a) {
  int b = get_global_id(0);
  int c = get_global_id(1);
  int d = get_global_size(0);
  int e = get_global_size(1);
  int f = A(b, c, d);

  float g = B((float)b / (float)d);
  float h = C((float)c / (float)e);

  float i = 0.0f;
  float j = 0.0f;

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
    a[f + 3] = 255;
  } else {
    a[f] = k;
    a[f + 1] = k;
    a[f + 2] = k;
    a[f + 3] = 255;
  }
}
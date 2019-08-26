__kernel void A() {
  int a = 0;
  int b = 5;
  int c = a & b;
  int d = a && b;
  int e = a - b;
  int f = a - -b;
  int g = a | b;
  int h = a || b;
  int i = a ^ b;
  int j = ~a;
  int k = a < b;
  int l = a >= b;
  int m = a == b;
  int n = &a;
  int o = *(int*)a;
  float p = a;
  int q = p;
  unsigned r = q;
  unsigned s = p;
  long t = a;
  short u = a;
  char v = b;
  int w = ~a;
}

__constant int Ga = 5;

int B() {
  return 42;
}

int C(int a) {
  return a + 1;
}

__kernel void D(__global int* a) {
  float b[3];
  float c[3] = {1.0f, 1.0f, 1.0f};
  float d[3] = {1.5f, 2.5f, 3.5f};
  float e[3] = {2.0f, 4.0f, 6.0f};

  b[0] = c[0] + d[0];
  b[1] = c[1] + d[1];
  b[2] = c[2] + d[2];

  b[0] = b[0] * e[0];
  b[1] = b[1] * e[1];
  b[2] = b[2] * e[2];

  float f, g, h;
  f = C(Ga);
  g = 2.0f;
  h = 3.0f;

  A();

  *a = b[0] * f + b[1] * g + b[1] * h + B();
}
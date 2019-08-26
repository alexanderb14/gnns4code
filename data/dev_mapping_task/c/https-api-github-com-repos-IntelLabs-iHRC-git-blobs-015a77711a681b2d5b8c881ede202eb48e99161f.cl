int A(int a, int b) {
  int c = a << b;
  int d = ((int)1) << 33;

  int e = c + d;

  return e;
}

long B(long a, long b) {
  long c = a >> b;
  long d = ((long)8) >> 65;

  long e = c + d;

  return e;
}

typedef __attribute__((ext_vector_type(4))) int int4;

int4 C(int4 a, int4 b) {
  int4 c = a << b;

  int4 d = {1, 1, 1, 1};
  int4 e = {33, 34, -28, -29};
  int4 f = c + (d << e);

  return f;
}

int4 D(int4 a, int b) {
  int4 c = a << b;

  int4 d = {1, 1, 1, 1};
  int4 e = c + (d << 34);

  return e;
}
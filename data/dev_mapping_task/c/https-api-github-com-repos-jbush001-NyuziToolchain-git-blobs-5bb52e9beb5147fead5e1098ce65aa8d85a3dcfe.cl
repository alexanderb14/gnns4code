typedef struct int_single { int a; } int_single;

typedef struct int_pair {
  long a;
  long b;
} int_pair;

typedef struct test_struct {
  int elementA;
  int elementB;
  long elementC;
  char elementD;
  long elementE;
  float elementF;
  short elementG;
  double elementH;
} test_struct;

kernel void A(int_single a, global int* b) {
  b[0] = a.a;
}

kernel void B(int_pair a, global int* b) {
  b[0] = (int)a.a;
  b[1] = (int)a.b;
}

kernel void C(test_struct a, global int* b) {
  b[0] = a.elementA;
  b[1] = a.elementB;
  b[2] = (int)a.elementC;
  b[3] = (int)a.elementD;
  b[4] = (int)a.elementE;
  b[5] = (int)a.elementF;
  b[6] = (int)a.elementG;
  b[7] = (int)a.elementH;
};

void D(int_pair a, global int* b) {
  b[0] = (int)a.a;
  b[1] = (int)a.b;
}
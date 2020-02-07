__kernel void A(const int a, const int b, __global int* c) {
  int d = a;
  int e = b;
  int f;

  for (int g = 0; g < 10; g++) {
    f = e + d;
    d = e;
    e = f;
    c[g] = e;
  }
}
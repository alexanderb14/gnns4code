typedef struct { float a, b, c, d; } S;

S A(S a) {
  a.c = 2.0f;
  a.b = 1.0f;
  return a;
}

kernel void B(global S* a, float b) {
  a[0] = A(a[1]);
}
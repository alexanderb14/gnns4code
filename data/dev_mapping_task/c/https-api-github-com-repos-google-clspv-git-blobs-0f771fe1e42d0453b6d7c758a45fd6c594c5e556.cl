typedef struct { float a, b, c, d; } S;

S A(float a) {
  S b;
  b.a = a;
  b.c = a + 2.0f;
  b.b = a + 1.0f;

  return b;
}

kernel void B(global S* a, float b) {
  *a = A(b);
}
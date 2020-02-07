typedef struct { float a, b, c, d; } S;

S A(float a) {
  S b = {10.0f, 11.0f, 12.0f, 13.0f};
  b.c = a + 2.0f;
  b.b = a + 1.0f;

  return b;
}

kernel void B(global S* a, float b) {
  *a = A(b);
}
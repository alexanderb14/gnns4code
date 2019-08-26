typedef struct { int a, b, c, d; } S;

S A(int a) {
  S b = {a, a, a, a};
  return b;
}

kernel void B(global S* a, global uchar4* b, int c) {
  *b = (uchar4)((uchar)c, 1, 2, 3);
  *a = A(10);
}
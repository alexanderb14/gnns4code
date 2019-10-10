typedef struct {
  int a;
  int b;
  int c;
} S;

S A(S a) {
  return a;
}

kernel void B(global S* a) {
  S b = {7, 7, 7};
  a[0] = A(b);
}
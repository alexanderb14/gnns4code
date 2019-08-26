typedef struct S {
  int a;
  int b;
} S;

kernel void A(local float* a, global float* b, float c, S local* d, constant float* e, float f) {
  *b = *a + *e + c + f;
}
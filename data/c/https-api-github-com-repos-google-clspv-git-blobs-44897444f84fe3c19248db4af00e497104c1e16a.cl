typedef struct S {
  int a;
  int b;
} S;

kernel void A(local float* a, global float* b, S local* c, constant float* d, float e, float f) {
  *b = *a + *d + e + f;
}
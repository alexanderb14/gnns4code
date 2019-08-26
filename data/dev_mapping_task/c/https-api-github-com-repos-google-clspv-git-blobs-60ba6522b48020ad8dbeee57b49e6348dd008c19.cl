kernel void A(global float* a, global float* b, global int* c, global float* d, float e, float f) {
  *a = e + f;
  *b = 0.0f;
  *c = 12;
  *d = e;
}

kernel void B(global float* a, global float* b, global float* c, float d, float e) {
  *a = d * e;
  *b = d / e;
  *c = d;
}
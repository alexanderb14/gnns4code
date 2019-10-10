kernel void A(global float* a, constant float* b) {
  __builtin_memcpy(a, b, 32);
}
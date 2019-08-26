kernel void A(global float* a, float b, float c) {
  *a = step(b, c);
}
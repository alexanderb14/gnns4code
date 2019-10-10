kernel void A(global float* a, float b, float c) {
  *a = b + c;
}

kernel void B(global float* a, float b, float c) {
  *a = b - c;
}
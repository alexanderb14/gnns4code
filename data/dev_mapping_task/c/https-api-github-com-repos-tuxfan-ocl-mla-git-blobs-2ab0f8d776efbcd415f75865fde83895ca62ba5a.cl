__kernel void A(__global const int* a, __global const float* b, __global float* c) {
  int d;

  *c = 0.0f;

  for (d = 0; d < (*a); ++d) {
    *c += b[d];
  }
}
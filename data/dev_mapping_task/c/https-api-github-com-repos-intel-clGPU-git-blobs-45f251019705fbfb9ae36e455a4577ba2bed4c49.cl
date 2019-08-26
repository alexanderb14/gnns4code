__kernel void A(__global float* a, int b, __global float* c, int d) {
  float e = 0.f;
  for (int f = 0; f < b; f++) {
    e += c[f * d] * c[f * d];
  }
  *a = sqrt(e);
}
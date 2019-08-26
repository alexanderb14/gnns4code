__kernel void A(__global float* a, __global int* b) {
  int c = get_global_id(0);
  int d = c * 2;
  float e = (a[d] * 2.0f) - 1.0f;
  float f = (a[(d + 1)] * 2.0f) - 1.0f;
  b[c] = (((e * e) + (f * f)) < 1.0f) ? 1 : 0;
  return;
}
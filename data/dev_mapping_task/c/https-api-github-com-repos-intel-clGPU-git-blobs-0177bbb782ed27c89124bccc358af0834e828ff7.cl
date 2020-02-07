__kernel void A(float a, __global float* b, __global float* c) {
  uint d = get_global_id(0);
  float e = b[d];
  float f = c[d];
  f += a * e;
  c[d] = f;
}
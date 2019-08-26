__kernel void A(float a, __global const float* b, __global const float* c, int d, __global float* e) {
  int f = get_global_id(0);
  if (f < d)
    e[f] = a * b[f] + c[f];
}
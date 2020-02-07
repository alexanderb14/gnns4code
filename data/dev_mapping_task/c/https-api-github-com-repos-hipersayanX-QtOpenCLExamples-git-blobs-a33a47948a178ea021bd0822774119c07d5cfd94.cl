__kernel void A(float a, __global float* b, __global float* c, __global float* d, int e) {
  size_t f = get_global_id(0);

  if (f < e)
    d[f] = a * b[f] + c[f];
}
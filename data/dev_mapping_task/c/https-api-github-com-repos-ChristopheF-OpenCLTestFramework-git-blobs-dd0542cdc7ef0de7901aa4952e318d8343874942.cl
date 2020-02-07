__kernel void A(const long a, __global const float* b, __global const float* c, __global float* d) {
  int e = get_global_id(0);

  if (e < a)
    d[e] = b[e] * c[e];
}
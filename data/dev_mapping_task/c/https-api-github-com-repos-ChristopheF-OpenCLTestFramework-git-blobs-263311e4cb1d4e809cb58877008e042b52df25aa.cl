__kernel void A(const long a, __global const float* b, const float c, __global float* d) {
  int e = get_global_id(0) + a * get_global_id(1);

  d[e] = b[e] + c;
}
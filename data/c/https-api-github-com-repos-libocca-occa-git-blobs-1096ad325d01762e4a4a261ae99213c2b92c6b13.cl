__kernel void A(const int a, __global const float* b, __global const float* c, __global float* d) {
  const int e = get_local_id(0) + (16 * get_group_id(0));

  if (e < a) {
    d[e] = b[e] + c[e];
  }
}
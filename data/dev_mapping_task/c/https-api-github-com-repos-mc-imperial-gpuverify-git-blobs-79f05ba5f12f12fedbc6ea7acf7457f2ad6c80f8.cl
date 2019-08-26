__kernel void A(const __global float* a, const __global float* b, const __global float* c, const __global float* d, const __global float* e, __global float* f, __global float* g) {
  int h = get_group_id(0);
  int i = get_local_id(0);

  __local float j[100 + 1];
  __local float k[100 + 1];
}
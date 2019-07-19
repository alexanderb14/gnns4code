__kernel void A(float a, __global float* b, __global float* c, __global float* d) {
  int e = get_global_id(0);

  d[e] = b[e] + c[e] + a;
}
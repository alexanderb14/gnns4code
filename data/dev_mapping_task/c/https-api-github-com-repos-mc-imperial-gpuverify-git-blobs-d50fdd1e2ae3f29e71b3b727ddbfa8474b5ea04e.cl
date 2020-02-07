__kernel void A(const __global float* a, const __global float* b, const __global float* c, const __global float* d, const __global float* e, __global float* f, __global float* g) {
  f[get_global_id(0)] = a[get_local_id(0)];

  g[get_global_id(0)] = d[get_local_id(0)];
}
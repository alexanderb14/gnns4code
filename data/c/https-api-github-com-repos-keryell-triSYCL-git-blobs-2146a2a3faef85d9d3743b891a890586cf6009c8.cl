__kernel void A(const __global float* a, const __global float* b, __global float* c) {
  c[get_global_id(0)] = a[get_global_id(0)] + b[get_global_id(0)];
}
__kernel void A(__global float* a, __global float* b) {
  b[get_global_id(0)] = a[1];
}
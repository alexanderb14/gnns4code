__kernel void A(__global float* restrict a, __global float* restrict b) {
  size_t c = get_global_id(0);
  b[c] = a[c] * 3.0;
}
__kernel void A(__global const uint* restrict a, __global const uint* restrict b, __global uint* restrict c) {
  int d = get_global_id(0);

  c[d] = a[d] + b[d];
}
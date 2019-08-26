__kernel void A(__global int* restrict a, __global int* restrict b, __global int* restrict c) {
  int d = get_global_id(0);

  c[d] = a[d] + b[d];
}
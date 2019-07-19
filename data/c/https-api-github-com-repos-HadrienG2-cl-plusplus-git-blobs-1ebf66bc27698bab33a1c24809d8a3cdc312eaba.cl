__kernel void A(__global const int* restrict const a, __global const int* restrict const b, __global int* restrict const c) {
  const size_t d = get_global_id(0);
  c[d] = a[d] + b[d];
}
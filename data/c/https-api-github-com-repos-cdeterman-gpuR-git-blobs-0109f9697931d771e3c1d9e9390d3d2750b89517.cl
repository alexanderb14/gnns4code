__kernel void A(__global double* a, __global double* b) {
  const int c = get_global_id(0);

  a[c] = b[c] * (1 - b[c]);
}
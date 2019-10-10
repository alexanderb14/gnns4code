__kernel void A(__global int* a, __global int* b, int c, int d) {
  int e = get_global_id(0);
  int f = get_global_id(1);

  b[f * c + e] = a[e * d + f];
}
__kernel void A(__global int* a, __global int* b, int c, int d) {
  int e, f;

  e = get_global_id(0);
  for (f = e; f < c; f += d) {
    b[f] = a[f];
  }
}
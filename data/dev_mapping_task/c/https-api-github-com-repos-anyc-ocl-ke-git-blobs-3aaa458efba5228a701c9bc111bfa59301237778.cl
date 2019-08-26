__kernel void A(__global int* a, __global int* b, int c, unsigned int d) {
  int e = get_global_id(0);
  if (e < d)
    b[e] = a[e] + c;
}
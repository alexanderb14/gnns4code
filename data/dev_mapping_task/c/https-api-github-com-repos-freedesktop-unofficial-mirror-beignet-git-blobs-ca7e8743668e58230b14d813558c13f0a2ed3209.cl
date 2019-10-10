__kernel void A(__constant short* a, __global int* b, int c) {
  int d = (int)get_global_id(0);
  b[d] = c + a[d % 69];
}
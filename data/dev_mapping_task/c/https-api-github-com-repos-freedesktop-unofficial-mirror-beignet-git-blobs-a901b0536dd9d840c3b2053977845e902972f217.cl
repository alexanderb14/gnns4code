__kernel void A(__global int* a, int b) {
  int c = (int)get_global_id(0);
  a[c] += b;
}
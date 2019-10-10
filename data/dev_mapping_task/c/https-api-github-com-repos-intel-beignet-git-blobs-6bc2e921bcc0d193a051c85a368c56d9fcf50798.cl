__kernel void A(__global int* a, short b) {
  int c = (int)get_global_id(0);
  a[c] = b;
}
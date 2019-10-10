__kernel void A(__global int* a) {
  int b = (int)get_global_id(0);
  a[b] = a[b] / 2;
}
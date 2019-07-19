__kernel void A(__global int* a) {
  int b = get_global_id(0);
  a[b] = b;
}
__kernel void A(__global int* a) {
  int b = get_local_id(0);
  int c = get_local_id(1);
  a[c] = b;
}
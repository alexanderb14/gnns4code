__kernel void A(__global int* a) {
  int b = get_local_id(0);
  a[b] = 0;
}
__kernel void A(__local int* a, int b) {
  a[b] = get_local_id(0) / 64;
}
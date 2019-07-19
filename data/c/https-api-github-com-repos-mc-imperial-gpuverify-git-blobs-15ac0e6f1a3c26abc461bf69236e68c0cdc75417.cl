__kernel void A(__local int* a) {
  a[0] = get_local_id(0);
}
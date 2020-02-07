__kernel void A(__global* a) {
  size_t b = get_global_id(0);
  a[b] = a[b] * a[b];
}
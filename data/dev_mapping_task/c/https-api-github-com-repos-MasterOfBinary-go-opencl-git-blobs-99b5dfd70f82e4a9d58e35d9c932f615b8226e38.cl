kernel void A(global float* a) {
  size_t b = get_global_id(0);
  a[b] = b;
}
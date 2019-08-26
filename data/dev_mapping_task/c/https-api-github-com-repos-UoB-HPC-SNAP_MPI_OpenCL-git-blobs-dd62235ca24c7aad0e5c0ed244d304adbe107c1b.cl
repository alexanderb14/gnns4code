kernel void A(global double* a) {
  size_t b = get_global_id(0);
  a[b] = 0.0;
}
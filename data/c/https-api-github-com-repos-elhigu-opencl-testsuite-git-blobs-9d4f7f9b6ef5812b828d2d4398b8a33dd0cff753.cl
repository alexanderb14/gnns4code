kernel void A(void) {
  local uint a[128];
  size_t b = get_local_size(0);
  for (size_t c = 0; c < b; c++) {
    a[c] = 0;
  }
}
kernel void A(global ulong* a) {
  size_t b = get_global_id(0);
  for (ulong c = 0; c < 100000000; c++) {
    a[b] += c;
  }
}
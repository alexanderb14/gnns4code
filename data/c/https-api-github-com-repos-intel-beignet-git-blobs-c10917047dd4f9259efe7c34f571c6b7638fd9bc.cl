kernel void A(global uint* a, global int* b) {
  int c = get_global_id(0);
  b[c] = a[c] >> 24;
}
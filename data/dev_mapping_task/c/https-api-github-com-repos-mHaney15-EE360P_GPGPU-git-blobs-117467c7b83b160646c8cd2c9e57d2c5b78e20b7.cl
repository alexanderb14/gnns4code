kernel void A(global const char* a, global char* b, int c) {
  unsigned int d = get_global_id(0);
  b[d] = a[d];
}
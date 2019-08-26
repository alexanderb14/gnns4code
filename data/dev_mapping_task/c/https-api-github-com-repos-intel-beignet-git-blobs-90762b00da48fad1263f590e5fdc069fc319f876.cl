kernel void A(global char* a, char b, unsigned int c, unsigned int d) {
  int e = get_global_id(0);
  if (e < d) {
    a[e + c] = b;
  }
}
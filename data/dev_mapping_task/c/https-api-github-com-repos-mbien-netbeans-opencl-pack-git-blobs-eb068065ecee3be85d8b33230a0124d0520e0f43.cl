kernel void A(global int* a, const int b, const int c) {
  int d = get_global_id(0);
  if (d >= b) {
    return;
  }
  a[d] = 42;
}
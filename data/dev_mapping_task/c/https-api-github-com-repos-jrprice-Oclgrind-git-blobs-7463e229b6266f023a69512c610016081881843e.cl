kernel void A(global int* a) {
  int b = get_global_id(0);
  if (b > 0) {
    a[b] = a[b - 1];
  }
}
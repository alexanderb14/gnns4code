kernel void A(global int* a, global int* b) {
  int c = get_local_id(0);
  b[c] = a[0];
  barrier(1);
  if (c == 0) {
    a[0] = -1;
  }
}
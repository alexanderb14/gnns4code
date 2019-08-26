kernel void A(global int* restrict a, global int* restrict b) {
  int c = a[get_global_id(0)];
  if (c == 0) {
    barrier(2);
  }
  b[0] = c;
}
kernel void A() {
}

kernel void B(global char* restrict a, global char* restrict b) {
  int c = get_global_id(0);
  a[c] = b[c];
}
kernel void A(global int* a, local int* b) {
  int c = get_global_id(0);
  *b = c;
  barrier(1);
  a[c] = *b;
}
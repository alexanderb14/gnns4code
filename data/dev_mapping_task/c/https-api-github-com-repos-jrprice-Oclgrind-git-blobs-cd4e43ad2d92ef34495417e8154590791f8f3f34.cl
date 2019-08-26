kernel void A(global long16* a) {
  long16 b[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11};

  int c = get_global_id(0);

  long16* d = b;

  a[c] = d[c];
}
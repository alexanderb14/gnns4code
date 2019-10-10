kernel void A(global int* a, local int* b) {
  int c = get_local_id(0);
  b[c] = 0;
  barrier(1);

  b[c] = c;
  if (c == 0) {
    int d = 0;
    for (int e = 0; e < get_local_size(0); e++) {
      d += b[e];
    }
    *a = d;
  }
}
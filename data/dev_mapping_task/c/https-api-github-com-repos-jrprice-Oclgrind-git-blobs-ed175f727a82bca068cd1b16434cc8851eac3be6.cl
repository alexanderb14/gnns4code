kernel void A(global int* a, global int* b) {
  int c = get_global_id(0);
  int d = get_group_id(0);
  a[c] = c;
  barrier(2);
  if (get_local_id(0) == 0) {
    int e = 0;
    for (int f = 0; f < get_local_size(0); f++) {
      e += a[get_local_size(0) * d + f];
    }
    b[d] = e;
  }
}
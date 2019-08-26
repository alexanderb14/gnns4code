void A(local float* a, global float const* b, int c) {
  int d = (c + get_local_size(0) - 1) / get_local_size(0);
  for (int e = 0; e < d; e++) {
    int f = e * get_local_size(0) + get_local_id(0);
    if (f < c) {
      a[f] = b[f];
    }
  }
}

void B(global float* a, local float const* b, int c) {
  int d = (c + get_local_size(0) - 1) / get_local_size(0);
  for (int e = 0; e < d; e++) {
    int f = e * get_local_size(0) + get_local_id(0);
    if (f < c) {
      a[f] = b[f];
    }
  }
}
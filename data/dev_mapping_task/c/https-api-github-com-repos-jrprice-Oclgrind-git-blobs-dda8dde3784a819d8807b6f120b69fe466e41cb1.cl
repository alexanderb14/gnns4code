kernel void A(global int* a, local int* b) {
  int c = get_local_id(0);
  if (c == 0) {
    b[0] = 0;
  }
  barrier(1);

  bool d = false;
  int e, f;
  int g;
  for (int h = 0; h < get_local_size(0); h++) {
    barrier(1);
    e = b[0];
    barrier(1);

    if (!d) {
      f = atomic_cmpxchg(b, e, e + 1);
      if (f == e) {
        d = true;
        g = b[0];
      }
    }
  }

  barrier(1);
  if (c == 0) {
    *a = *b;
  }
  a[c + 1] = g;
}
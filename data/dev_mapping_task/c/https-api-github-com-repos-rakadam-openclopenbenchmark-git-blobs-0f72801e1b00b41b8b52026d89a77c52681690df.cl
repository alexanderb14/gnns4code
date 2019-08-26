kernel void A(global int* a, global int* b, int c) {
  int d = a[get_global_id(0)];

  for (int e = 0; e < 8; e++) {
    barrier(2);
  }

  b[get_global_id(0)] = d;
}
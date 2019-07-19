kernel void A(global int* a, global int* b, int c) {
  int d = a[get_global_id(0)];

  for (int e = 0; e < 1; e++) {
    barrier(1);
  }

  b[get_global_id(0)] = d;
}
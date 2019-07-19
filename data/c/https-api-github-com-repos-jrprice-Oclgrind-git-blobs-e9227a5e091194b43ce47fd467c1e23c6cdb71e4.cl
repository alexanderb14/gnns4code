kernel void A(global int* a, local int* b) {
  int c = get_global_id(0);
  int d = get_local_id(0);
  int e = get_group_id(0);
  if (d == 0) {
    *b = 0;
  }
  barrier(1);
  atomic_add(b, c);
  barrier(1);
  if (d == 0) {
    a[e] = *b;
  }
}
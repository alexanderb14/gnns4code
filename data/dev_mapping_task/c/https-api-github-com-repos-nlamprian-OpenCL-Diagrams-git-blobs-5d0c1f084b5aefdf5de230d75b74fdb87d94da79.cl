kernel void A(global int* a, global int* b, local int* c) {
  int d = get_global_id(0);
  int e = get_local_id(0);
  int f = get_local_size(0);

  c[e] = a[d];
  if (e == f - 1)
    c[f] = ((d == get_global_size(0) - 1) ? (0) : (a[d + 1]));
  barrier(1);

  b[d] = c[e] + c[e + 1];
}
kernel void A(global int* a, global int* b, global int* c) {
  int d = get_global_id(0);
  c[d] = hadd(a[d], b[d]);
}
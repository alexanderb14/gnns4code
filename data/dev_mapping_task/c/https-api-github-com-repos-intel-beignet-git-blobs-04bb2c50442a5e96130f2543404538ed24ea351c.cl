kernel void A(global int* a, global int* b, global int* c, global int* d) {
  int e = get_global_id(0);
  d[e] = mad24(a[e], b[e], c[e]);
}
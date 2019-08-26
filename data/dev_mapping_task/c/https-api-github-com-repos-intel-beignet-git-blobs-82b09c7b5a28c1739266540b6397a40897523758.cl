kernel void A(global int* a, global int* b, global int* c, global int* d) {
  int e = get_global_id(0);
  d[e] = (mul_hi((a[e]), (b[e])) + (c[e]));
}
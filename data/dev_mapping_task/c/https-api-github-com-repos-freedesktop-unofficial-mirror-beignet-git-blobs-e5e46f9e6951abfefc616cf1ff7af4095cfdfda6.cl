kernel void A(global double* a, global double* b, global double* c) {
  int d = get_global_id(0);
  c[d] = a[d] + b[d];
}
kernel void A(global const double* a, global const double* b, global double* c) {
  unsigned int d = get_global_id(0);
  c[d] = a[d] + b[d];
}
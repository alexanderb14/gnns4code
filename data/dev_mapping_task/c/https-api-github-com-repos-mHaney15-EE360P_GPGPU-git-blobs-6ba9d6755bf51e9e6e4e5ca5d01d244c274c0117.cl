kernel void A(global const double* a, global double* b, int c) {
  unsigned int d = get_global_id(0);
  unsigned int e = get_global_id(1);
  b[d * c + e] = a[e * c + d];
}
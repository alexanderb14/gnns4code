kernel void A(global const short4* a, global const short4* b, global short4* c) {
  int d = get_global_id(0);
  c[d] = a[d] + b[d];
}
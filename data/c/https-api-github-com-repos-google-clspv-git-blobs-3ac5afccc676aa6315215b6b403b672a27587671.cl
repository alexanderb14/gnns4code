kernel void A(global int4* a, global int4* b, global int* c) {
  size_t d = get_global_id(0);
  b[d][c[d]] = 42;
}
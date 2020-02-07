kernel void A(global float* a, global float* b, global int* c) {
  int d = get_global_id(0);
  b[d] = frexp(a[d], &c[d]);
}
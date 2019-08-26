kernel void A(global float* a, global float* b, global float* c) {
  int d = get_global_id(0);
  float e;
  b[d] = modf(a[d], &e);
  c[d] = e;
}
kernel void A(global float* a, global float* b, global int* c) {
  int d = get_global_id(0);
  b[d] = lgamma_r(a[d], c + d);
};
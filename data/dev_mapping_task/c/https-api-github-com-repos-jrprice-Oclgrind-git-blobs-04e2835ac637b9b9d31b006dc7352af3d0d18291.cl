kernel void A(global float* a, global float* b, global float* c) {
  size_t d = get_global_id(0);
  c[d] = a[d] + b[d];
}
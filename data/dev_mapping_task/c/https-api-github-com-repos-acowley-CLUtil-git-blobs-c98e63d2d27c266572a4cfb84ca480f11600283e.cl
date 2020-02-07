kernel void A(global float* a, global float* b, global float* c) {
  size_t d = get_global_id(0);
  size_t e = get_global_id(1);
  size_t f = e * get_global_size(0) + d;
  c[f] = a[f] + b[f];
}

kernel void B(global float* a, global float* b, global float* c) {
  size_t d = get_global_id(0);
  c[d] = a[d] + b[d];
}
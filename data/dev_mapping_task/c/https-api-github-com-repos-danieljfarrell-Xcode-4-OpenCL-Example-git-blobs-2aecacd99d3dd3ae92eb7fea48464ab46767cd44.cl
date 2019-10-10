kernel void A(global float* a, global float* b) {
  size_t c = get_global_id(0);
  b[c] = a[c] * a[c];
}
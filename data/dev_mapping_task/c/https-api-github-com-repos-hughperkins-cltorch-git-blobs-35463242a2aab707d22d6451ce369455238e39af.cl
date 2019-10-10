kernel void A(global float* a, global float* b, int c) {
  if (get_global_id(0) == 0) {
    a[0] = b[c];
  }
}
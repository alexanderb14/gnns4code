kernel void A(global float* a, global float* b) {
  int c = get_global_id(0);
  b[c] = radians(a[c]);
}
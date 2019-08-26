kernel void A(global float* a, global float* b) {
  int c = get_global_id(0);
  b[c] = exp2(-a[c]);
};
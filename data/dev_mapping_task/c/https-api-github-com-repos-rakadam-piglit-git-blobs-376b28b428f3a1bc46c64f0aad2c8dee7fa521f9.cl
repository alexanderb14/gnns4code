kernel void A(global float* a, global float* b, int c) {
  int d = get_global_id(0) + get_global_id(1) * 16 + get_global_id(2) * 16 * 18;
  b[d] = get_global_id(0) * 20 * 18 + get_global_id(1) * 20 + get_global_id(2);
}
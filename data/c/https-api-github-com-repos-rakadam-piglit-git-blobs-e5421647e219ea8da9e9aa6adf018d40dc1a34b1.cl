kernel void A(global float* a, global float* b, int c) {
  b[0] = get_global_size(0);
  b[1] = get_global_size(1);
  b[2] = get_global_size(2);
}
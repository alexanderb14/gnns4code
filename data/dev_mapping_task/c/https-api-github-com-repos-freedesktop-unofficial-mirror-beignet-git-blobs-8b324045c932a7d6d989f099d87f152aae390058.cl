kernel void A(global float* a, global double* b) {
  int c = get_global_id(0);
  float d = 1.234567890123456789f;
  b[c] = c < 14 ? d : 14;
}
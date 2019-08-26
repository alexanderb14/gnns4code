kernel void A(global float* a, global uint* b) {
  int c = get_global_id(0);
  b[c] = convert_uchar_sat(a[c]);
}
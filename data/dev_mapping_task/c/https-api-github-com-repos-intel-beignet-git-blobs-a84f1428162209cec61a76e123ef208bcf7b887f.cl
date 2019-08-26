kernel void A(global double* a, global double* b) {
  int c = get_global_id(0);
  double d = 1.234567890123456789;
  if (c < 14)
    b[c] = d * (a[c] + d);
  else
    b[c] = 14;
}
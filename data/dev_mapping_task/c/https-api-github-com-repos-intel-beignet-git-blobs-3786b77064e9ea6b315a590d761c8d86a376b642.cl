kernel void A(global long* a, global long* b) {
  int c = get_global_id(0);
  if (c > 7)
    b[c] = a[c] << c;
  else
    b[c] = a[c] + 1;
}
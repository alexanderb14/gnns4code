kernel void A(global float* a) {
  local float b[16];

  int c = get_local_id(0);
  if (c != get_local_size(0) / 2) {
    b[c] = c;
  }
  a[c] = b[c];
}
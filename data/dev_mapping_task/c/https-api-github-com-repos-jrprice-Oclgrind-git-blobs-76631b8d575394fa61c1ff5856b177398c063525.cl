kernel void A(local float* a, global float* b) {
  int c = get_local_id(0);
  if (c != get_local_size(0) / 2) {
    a[c] = c;
  }
  b[c] = a[c];
}
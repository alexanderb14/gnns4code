kernel void A(global int* a, unsigned int b, global int* c, unsigned int d, unsigned int e, unsigned int f, unsigned int g) {
  int h = get_global_id(0);
  if (h > e - 1)
    return;

  if (h == 0) {
    c[d] = (c[d] & f) | (a[b] & (~f));
  } else if (h == e - 1) {
    c[h + d] = (a[h + b] & g) | (c[h + d] & (~g));
  } else {
    c[h + d] = a[h + b];
  }
}
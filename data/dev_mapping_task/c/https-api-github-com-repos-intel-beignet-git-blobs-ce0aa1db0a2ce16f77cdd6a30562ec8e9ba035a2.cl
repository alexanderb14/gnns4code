kernel void A(global int* a, unsigned int b, global int* c, unsigned int d, unsigned int e, unsigned int f, unsigned int g, unsigned int h, unsigned int i, int j) {
  int k = get_global_id(0);
  unsigned int l = 0;

  if (k > e - 1)
    return;

  if (k == 0) {
    l = ((a[b + k] & i) << h);
  } else if (j && k == e - 1) {
    l = ((a[b + k - 1] & ~i) >> (32 - h));
  } else {
    l = ((a[b + k - 1] & ~i) >> (32 - h)) | ((a[b + k] & i) << h);
  }

  if (k == 0) {
    c[d] = (c[d] & f) | (l & (~f));
  } else if (k == e - 1) {
    c[k + d] = (l & g) | (c[k + d] & (~g));
  } else {
    c[k + d] = l;
  }
}
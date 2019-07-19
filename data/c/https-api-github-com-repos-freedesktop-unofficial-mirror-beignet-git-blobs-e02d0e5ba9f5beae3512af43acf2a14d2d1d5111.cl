kernel void A(global int* a, unsigned int b, global int* c, unsigned int d, unsigned int e, unsigned int f, unsigned int g, unsigned int h, unsigned int i) {
  int j = get_global_id(0);
  unsigned int k = 0;

  if (j > e - 1)
    return;

  if ((j == e - 1) && ((g & (~(~i >> h))) == 0)) {
    k = ((a[b + j] & ~i) >> h);
  } else {
    k = ((a[b + j] & ~i) >> h) | ((a[b + j + 1] & i) << (32 - h));
  }

  if (j == 0) {
    c[d] = (c[d] & f) | (k & (~f));
  } else if (j == e - 1) {
    c[j + d] = (k & g) | (c[j + d] & (~g));
  } else {
    c[j + d] = k;
  }
}
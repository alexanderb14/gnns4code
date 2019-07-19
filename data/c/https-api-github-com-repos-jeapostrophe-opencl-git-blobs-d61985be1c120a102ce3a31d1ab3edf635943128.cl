__kernel void A(__global uint4* a, __const __global uint* b, const unsigned int c, const unsigned int d, const unsigned int e, const unsigned int f) {
  unsigned int g = get_global_id(0);

  unsigned int h = d + f * g;
  unsigned int i = h + f - 1;

  unsigned int j = b[h];
  unsigned int k = b[i];

  if ((j > c) || (k < c)) {
    return;
  } else {
    a[0].x = h;
    a[0].y = i;
    a[0].w = 1;
  }
}
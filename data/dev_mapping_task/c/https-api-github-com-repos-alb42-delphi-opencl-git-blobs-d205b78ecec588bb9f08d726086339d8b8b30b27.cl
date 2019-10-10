__kernel void A(__global char* a, __global char* b, int c, int d) {
  unsigned int e = get_global_id(0);

  unsigned int f = e * 4;

  unsigned char g;

  g = a[f];
  b[f] = a[f + 2];
  b[f] = a[f + 1];
  b[f + 2] = g;

  b[f + 3] = a[f + 3];
}
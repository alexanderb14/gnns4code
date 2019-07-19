__kernel void A(__global char* a, __global char* b, int c, int d) {
  unsigned int e = get_global_id(0);

  unsigned int f = e * 4;

  unsigned char g;
  g = 0.1 * a[f] + 0.6 * a[f + 1] + 0.3 * a[f + 2];
  b[f] = g;
  b[f + 1] = g;
  b[f + 2] = g;

  b[f + 3] = a[f + 3];
}
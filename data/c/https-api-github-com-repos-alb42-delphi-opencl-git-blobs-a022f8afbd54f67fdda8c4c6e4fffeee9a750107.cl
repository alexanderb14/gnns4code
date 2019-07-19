__kernel void A(__global char* a, __global char* b, int c, int d) {
  unsigned int e = get_global_id(0);

  unsigned int f, g;

  unsigned int h = e * 4;

  g = e / c;
  f = e % c;

  unsigned int i, j;

  i = g;
  j = f;

  if ((i < c) && (j < d)) {
    unsigned int k = ((j * c + i) * 4);

    b[k] = a[h];
    b[k + 1] = a[h + 1];
    b[k + 2] = a[h + 2];

    b[k + 3] = a[h + 3];
  }
}
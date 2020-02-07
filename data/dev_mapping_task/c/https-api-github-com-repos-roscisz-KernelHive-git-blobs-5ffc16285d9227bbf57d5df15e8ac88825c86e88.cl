__kernel void A(__global unsigned char* a, unsigned int b, unsigned int c, __global unsigned char* d, unsigned int e) {
  int f = get_global_id(0);
  int g;
  int h = b / c;

  int i;
  int j, k;

  if (f == 0) {
    for (j = 0; j < c; j++) {
      g = j * h;
      i = (a[g + 3] << 24) + (a[g + 2] << 16) + (a[g + 1] << 8) + a[g];
      if (i > 0) {
        for (k = 0; k < h; k++) {
          d[k] = a[g + k];
        }
        break;
      }
    }
  }
}
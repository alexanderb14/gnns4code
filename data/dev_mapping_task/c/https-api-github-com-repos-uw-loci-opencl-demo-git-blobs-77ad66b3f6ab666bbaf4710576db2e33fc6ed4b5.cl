__kernel void A(__global char* a, __global char* b, int c, int d) {
  int e = get_global_id(0);
  int f = get_global_id(1);
  int g[9];
  int h = f * c + e;
  if (e < 1 || f < 1 || e > c - 2 || f > d - 2) {
    b[h] = 0;
  } else {
    g[0] = a[h - c - 1] & 0xff;
    g[1] = a[h - c] & 0xff;
    g[2] = a[h - c + 1] & 0xff;
    g[3] = a[h - 1] & 0xff;
    g[4] = a[h] & 0xff;
    g[5] = a[h + 1] & 0xff;
    g[6] = a[h + c - 1] & 0xff;
    g[7] = a[h + c] & 0xff;
    g[8] = a[h + c + 1] & 0xff;

    int i = g[0] + 2 * g[1] + g[2] - g[6] - 2 * g[7] - g[8];
    int j = g[0] + 2 * g[3] + g[6] - g[2] - 2 * g[5] - g[8];
    float k = i * i + j * j;

    int l = sqrt(k);
    if (l > 255)
      l = 255;
    b[h] = (char)l;
  }
};
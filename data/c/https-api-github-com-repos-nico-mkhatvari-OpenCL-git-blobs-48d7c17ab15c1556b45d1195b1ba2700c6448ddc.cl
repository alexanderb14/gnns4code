kernel void A(global uchar* a, global float* b, int c, global uchar* d, global uchar* e) {
  int f = get_global_id(1);
  int g = get_global_id(0);
  int h = get_global_size(0);
  int i = get_global_size(1);

  int j, k;

  float l = 0;

  int m, n, o;
  global int* p;

  l = 0;

  for (o = 0; o < 2 * c + 1; o++) {
    if ((f + o - c) < 0)
      m = o;
    else if ((h - 1) - (f + o + c) < 0)
      m = h - 1 - o;
    else
      m = f + o - c;

    l += b[o] * a[g * h + m];
  }
  e[g * h + f] = l;

  l = 0;
  for (o = 0; o < 2 * c + 1; o++) {
    if ((g + o - c) < 0)
      n = o;
    else if ((h - 1) - (g + o + c) < 0)
      n = i - 1 - o;
    else
      n = g + o - c;

    l += b[o] * e[n * h + f];
  }
  d[g * h + f] = convert_uchar(l);
}
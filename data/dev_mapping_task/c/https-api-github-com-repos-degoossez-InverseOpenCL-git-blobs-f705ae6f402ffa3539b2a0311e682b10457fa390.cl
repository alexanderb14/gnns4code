kernel void A(global const int* a, global int* b, const uint c) {
  int d = get_global_id(0);
  int e = get_global_id(1);
  int f = a[d + e * c];
  int g;

  int h = (f >> 16) & 0xff;
  int i = (f >> 8) & 0xff;
  int j = f & 0xff;
  h = 255 - h;
  i = 255 - i;
  j = 255 - j;

  b[d + e * c] = 0xff000000 | (h << 16) | (i << 8) | j;
}
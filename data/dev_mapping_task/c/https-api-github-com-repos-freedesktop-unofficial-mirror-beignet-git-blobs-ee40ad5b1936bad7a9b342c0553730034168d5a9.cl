kernel void A(const global uint* a, const global uint* b, int c, int d, global uint* e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);
  uint h = b[g * c + f];
  int i = f + h;
  int j = g + h;
  if (0 <= i && i < c && 0 <= j && j < d)
    e[g * c + f] = a[j * c + i];
  else
    e[g * c + f] = 0;
}
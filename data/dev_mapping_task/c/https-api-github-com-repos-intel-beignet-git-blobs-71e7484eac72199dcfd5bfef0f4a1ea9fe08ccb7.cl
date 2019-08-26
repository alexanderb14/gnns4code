kernel void A(global char* a, global char* b, unsigned int c, unsigned int d, unsigned int e, unsigned int f, unsigned int g, unsigned int h, unsigned int i, unsigned int j, unsigned int k) {
  int l = get_global_id(0);
  int m = get_global_id(1);
  int n = get_global_id(2);
  if ((l >= c) || (m >= d) || (n >= e))
    return;
  f += n * i + m * h + l;
  g += n * k + m * j + l;
  b[g] = a[f];
}
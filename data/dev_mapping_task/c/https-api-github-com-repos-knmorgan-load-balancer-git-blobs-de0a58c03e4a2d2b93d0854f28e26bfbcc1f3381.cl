__kernel void A(__global unsigned long* a, __global unsigned long* b, const unsigned long c, const unsigned long d) {
  unsigned int e = get_global_id(0);
  int f = e * d;
  int g = f + d;
  int h = 0;
  if (g > c)
    g = c;
  for (int i = f; i < g; i++)
    h += a[i];
  b[e] = h;
}
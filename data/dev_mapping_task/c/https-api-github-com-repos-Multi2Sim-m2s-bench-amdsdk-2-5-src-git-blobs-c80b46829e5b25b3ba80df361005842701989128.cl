inline unsigned int A(unsigned int a, unsigned int b) {
  return (b < a) ? b : a;
}
__kernel void B(__global unsigned int* a, __global unsigned int* b, const unsigned int c, const unsigned int d) {
  unsigned int e = get_local_id(0);
  unsigned int f = get_group_id(0);

  unsigned int g = d;
  unsigned int h = f * c;

  unsigned int i = a[h + e];

  unsigned int j = a[h + g];
  unsigned int k = a[g * c + e];

  unsigned int l = j + k;

  if (l < i) {
    a[h + e] = l;
    b[h + e] = g;
  }
  a[h + e] = A(a[h + e], a[h + g] + a[g * c + e]);
}
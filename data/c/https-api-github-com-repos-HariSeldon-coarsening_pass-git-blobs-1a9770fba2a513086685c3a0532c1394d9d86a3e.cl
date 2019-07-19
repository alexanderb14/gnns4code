inline unsigned int A(unsigned int a, unsigned int b) {
  return (b < a) ? b : a;
}
__kernel void B(__global uint* a, __global uint* b, const unsigned int c, const unsigned int d) {
  int e = get_global_id(0);
  int f = get_global_id(1);

  int g = d;
  int h = a[f * c + e];
  int i = (a[f * c + g] + a[g * c + e]);

  if (i < h) {
    a[f * c + e] = i;
    b[f * c + e] = g;
  }
}
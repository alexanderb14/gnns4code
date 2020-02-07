__kernel void A(uint a, __global uint* b, __global int* c, __global int* d, __global int* e, __global int* f) {
  int g = c[0];
  int h = d[0];
  int i;
  int j;
  uint k = 1;
  e[0] = h;
  f[0] = g;
  for (ulong l = 1; l < a; l++) {
    i = c[l];
    j = d[l];
    if (((h) == (j))) {
      g = ((g) + (i));
    } else {
      e[k - 1] = h;
      f[k - 1] = g;
      g = i;
      k++;
    }
    h = j;
  }
  e[k - 1] = h;
  f[k - 1] = g;
  *b = k;
}
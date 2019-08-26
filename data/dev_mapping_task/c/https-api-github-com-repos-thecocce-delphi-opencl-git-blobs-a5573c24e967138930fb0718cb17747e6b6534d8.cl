unsigned char A(unsigned char a) {
  return 25 * log((float)a + 1);
}

__kernel void B(__global char* a, __global char* b, int c, int d) {
  unsigned int e = get_global_id(0);

  unsigned int f = e * 4;

  b[f] = A(a[f]);
  b[f + 1] = A(a[f + 1]);
  b[f + 2] = A(a[f + 2]);
  b[f + 3] = a[f + 3];
}
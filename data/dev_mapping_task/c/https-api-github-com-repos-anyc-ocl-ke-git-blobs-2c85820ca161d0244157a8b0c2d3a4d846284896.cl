int A(int a, int b) {
  return a + b;
}

__kernel void B(__global int* a, __global int* b, int c, unsigned int d) {
  int e = get_global_id(0);
  if (e < d)
    b[e] = A(a[e], c);
}
int A(int a, int b, int c); __kernel void B(__global int* a, __global const int* b, __global const int* c, __global const int* d) {
  int e = get_global_id(0);
  a[e] = A(b[e], c[e], d[e]);
}
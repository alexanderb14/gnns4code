int A(int a, int b) {
  return (a + b) / 2;
}

__kernel void B(__global int* a) {
  int b = get_global_id(0) * get_global_size(0) + get_local_id(0);
  a[b] = A(b, b);
}
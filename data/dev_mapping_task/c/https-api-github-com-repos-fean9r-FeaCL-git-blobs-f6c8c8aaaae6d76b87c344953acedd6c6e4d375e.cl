int A(int a) {
  if (a == 0)
    return 1;
  else
    return (a * A(a - 1));
}

__kernel void B(__global int* a, __global int* b) {
  unsigned int c = get_global_id(0);

  b[c] = A(a[c]);
}
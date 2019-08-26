__attribute__((always_inline)) int A() {
  return get_local_id(0);
}

__kernel void B(__global int* a, __global int* b) {
  int c = A();

  int d = get_group_id(0) * get_local_size(0) + c;

  for (int e = 0; e < 100; e++) {
    a[d] = b[d] + 2;

    b[d]++;
  }
}
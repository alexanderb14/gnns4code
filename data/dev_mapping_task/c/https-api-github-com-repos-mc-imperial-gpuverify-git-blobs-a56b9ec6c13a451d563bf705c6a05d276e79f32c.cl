__attribute__((always_inline)) int A() {
  return get_global_id(0);
}

__attribute__((always_inline)) int B(int a) {
  return a;
}

__kernel void C(__global int* a, __global int* b) {
  int c = A();

  int d = get_global_id(1);

  int e;

  e = B(get_global_size(0));

  int f = d * get_global_size(0) + get_global_id(0);

  for (int g = 0; g < 100; g++) {
    a[d * e + c] = b[get_global_id(1) * get_global_size(0) + c] + 2;

    b[f]++;
  }
}
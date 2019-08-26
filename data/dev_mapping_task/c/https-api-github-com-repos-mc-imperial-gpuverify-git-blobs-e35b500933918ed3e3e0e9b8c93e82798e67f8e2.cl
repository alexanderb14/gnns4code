__attribute__((always_inline)) int A() {
  return get_local_id(0);
}

__attribute__((always_inline)) int B(int a) {
  return a;
}

__kernel void C() {
  __local int a[1024];
  __local int b[1024];

  int c = A();

  int d = get_local_id(1);

  int e;

  e = B(get_local_size(0));

  int f = d * get_local_size(0) + get_local_id(0);

  for (int g = 0; g < 100; g++) {
    a[d * e + c] = b[get_local_id(1) * get_local_size(0) + c] + 2;

    b[f]++;
  }
}
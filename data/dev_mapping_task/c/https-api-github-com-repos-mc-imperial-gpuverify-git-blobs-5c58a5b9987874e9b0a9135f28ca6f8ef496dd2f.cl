__attribute__((always_inline)) int A() {
  return get_local_id(0);
}

__attribute__((always_inline)) int B(int a) {
  return a;
}

__kernel void C() {
  __local int a[16][16];
  __local int b[16][16];

  int c = A();

  int d = get_local_id(1);

  for (int e = 0; e < 100; e++) {
    a[d][c] = b[get_local_id(1)][c] + 2;

    b[d][get_local_id(0)]++;
  }
}
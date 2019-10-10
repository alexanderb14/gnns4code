__kernel void A() {
  __local int a[2][4];
  int b, c, d;

  int e = get_local_id(0);
  int f = e == 0 ? 4 : 1;
  int g = e == 0 ? 1 : 4;

  b = 0;
  for (int c = 0; c < f; c++) {
    for (int d = 0; d < g; d++) {
      barrier(1);
      a[1 - b][e] = a[b][(e + 1) % 4];
      b = 1 - b;
    }
  }
}
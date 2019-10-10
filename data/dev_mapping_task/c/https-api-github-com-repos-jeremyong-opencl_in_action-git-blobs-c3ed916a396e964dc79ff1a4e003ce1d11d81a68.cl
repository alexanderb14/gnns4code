__kernel void A(char16 a, __global char* b, int c, __local int* d, __global int* e) {
  char16 f, g;

  d[0] = 0;
  d[1] = 0;
  d[2] = 0;
  d[3] = 0;

  barrier(1);

  int h = get_global_id(0) * c;

  for (int i = h; i < h + c; i++) {
    f = vload16(0, b + i);

    g = f == a;

    if (all(g.s0123))
      atomic_add(d, 1);

    if (all(g.s4567))
      atomic_add(d + 1, 1);

    if (all(g.s89AB))
      atomic_add(d + 2, 1);

    if (all(g.sCDEF))
      atomic_add(d + 3, 1);
  }

  barrier(2);

  if (get_local_id(0) == 0) {
    atomic_add(e, d[0]);
    atomic_add(e + 1, d[1]);
    atomic_add(e + 2, d[2]);
    atomic_add(e + 3, d[3]);
  }
}
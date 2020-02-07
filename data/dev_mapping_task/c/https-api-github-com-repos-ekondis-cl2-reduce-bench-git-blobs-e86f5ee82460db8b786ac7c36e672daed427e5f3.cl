__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void A(__local volatile uint* a, __global uint* b) {
  const uint c = get_global_id(0);
  const uint d = get_local_id(0);
  const uint e = get_local_size(0);

  uint f = c;
  a[d] = f;
  barrier(1);

  int g = e / 2;
  for (; g > 1; g >>= 1) {
    if (d < g)
      a[d] = f = f + a[d + g];
    barrier(1);
  }

  for (; g > 0; g >>= 1) {
    if (d < g)
      a[d] = f = f + a[d + g];
  }

  if (d == 0)
    atomic_add(b, f);
}
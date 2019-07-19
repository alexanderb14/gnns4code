kernel void A(global int* a) {
  int b = get_global_id(0);
  if ((b % 2) == 0) {
    a[b] = 0;
    atomic_add(a + b, 1);
  } else {
    atomic_add(a + b, 1);
    a[b] = a[b] + 1;
  }
}
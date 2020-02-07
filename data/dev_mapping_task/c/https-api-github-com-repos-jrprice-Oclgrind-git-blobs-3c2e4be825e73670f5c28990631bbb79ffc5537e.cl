kernel void A(global int* a) {
  atomic_min(a + 0, -8);
  atomic_min(a + 1, -6);
  atomic_min(a + 2, 3);
  atomic_min(a + 3, -3);
  atomic_min(a + 4, 6);
  atomic_min(a + 5, 8);

  atomic_max(a + 6, -8);
  atomic_max(a + 7, -6);
  atomic_max(a + 8, 3);
  atomic_max(a + 9, -3);
  atomic_max(a + 10, 6);
  atomic_max(a + 11, 8);
}
void A(__global int* a) {
  int b;
  for (b = 0; b < get_global_id(0); b++) {
  }

  if (get_global_id(0) == 24) {
    a[b] = get_global_id(0);
  }
}

__kernel void B(__global int* a) {
  A(a);
}
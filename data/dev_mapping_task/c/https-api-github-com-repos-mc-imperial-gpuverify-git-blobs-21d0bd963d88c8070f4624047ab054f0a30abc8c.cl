void A(__global int* a) {
  if (get_global_id(0) == 24) {
    a[0] = get_global_id(0);
  }
}

__kernel void B(__global int* a) {
  A(a);

  for (int b = 0; b < get_global_id(0); b++) {
  }
}
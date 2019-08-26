__kernel void A(__local int* a) {
  if (get_local_id(0) != 0) {
    a[get_local_id(0)] = get_local_id(0);
  }

  for (int b = 0; b < 100; b++) {
    if (b == 1) {
      a[0] = get_local_id(0);
    }
  }
}
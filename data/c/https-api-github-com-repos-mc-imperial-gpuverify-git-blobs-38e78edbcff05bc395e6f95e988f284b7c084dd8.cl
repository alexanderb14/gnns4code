__kernel void A(__local int* a) {
  for (unsigned int b = 1; b > 0; b /= 2) {
    unsigned int c = get_local_id(0) ^ b;
    if (c > get_local_id(0)) {
      if ((get_local_id(0) & 2) == 0) {
        a[c] = a[get_local_id(0)];
      }
    }

    barrier(1);
  }
}
__kernel void A(__local unsigned int* a) {
  for (unsigned int b = 0; b < 8; ++b) {
    if (get_local_id(0) == 0) {
      a[get_local_id(0)] = 0 + b;
    }

    barrier(1);
  }
}
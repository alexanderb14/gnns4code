__kernel void A(__global int* a) {
  for (int b = get_local_id(0); b < 100; b++) {
  }

  for (int c = 100; c > 0; c--) {
  }
}
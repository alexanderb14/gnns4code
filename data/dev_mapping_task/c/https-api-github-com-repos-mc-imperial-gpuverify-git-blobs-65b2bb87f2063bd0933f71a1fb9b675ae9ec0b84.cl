__kernel void A(void) {
  for (int a = 1024; a > 0; a -= (16)) {
    for (int b = 0; b < a; b += ((256) - (16))) {
      int c = (256) - 1;
      int d = c - (16);

      barrier(1);

      for (int e = c - 1; e >= d; e--) {
        barrier(1);
      }

      barrier(1);
    }
  }
}
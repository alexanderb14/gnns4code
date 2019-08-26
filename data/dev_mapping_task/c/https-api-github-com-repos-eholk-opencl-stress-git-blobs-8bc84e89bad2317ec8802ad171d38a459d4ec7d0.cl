__kernel void A(__global int* a) {
  unsigned int b = get_global_id(0);
  while (b < get_global_id(0)) {
    if (b < 2) {
      if (b < 1) {
        return;
      }
    } else {
      for (int c = 0; c < 2; c++) {
        unsigned int d = c + 2;
        while (d < b) {
          d += 2;
        }
      }
    }
    b++;
  }
  *a = 0;
}
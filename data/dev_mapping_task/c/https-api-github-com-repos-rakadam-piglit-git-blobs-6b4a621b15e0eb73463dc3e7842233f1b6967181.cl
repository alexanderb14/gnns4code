kernel void A(global int* a) {
  int b = a[0];

  for (int c = 0; c < a[1]; c++) {
    if (b % 2 == 0) {
      b = b / 2;
    } else {
      b = 3 * b + 1;
    }
  }

  a[2] = b;
}
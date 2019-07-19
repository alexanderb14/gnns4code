__kernel void A(int a) {
  int b = 0;

  for (int c = 0; c < 100; c++) {
    if (b > 1000) {
      return;
    }
    b += c;
  }

  for (int c = 0; c < 100; c++) {
    b += c;
  }
}
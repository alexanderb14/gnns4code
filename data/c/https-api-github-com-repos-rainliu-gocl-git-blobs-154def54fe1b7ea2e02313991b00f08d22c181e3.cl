__kernel void A(__global char16* a, int b) {
  for (int c = 0; c < b; c++) {
    a[c] = (char16)(5);
  }
}
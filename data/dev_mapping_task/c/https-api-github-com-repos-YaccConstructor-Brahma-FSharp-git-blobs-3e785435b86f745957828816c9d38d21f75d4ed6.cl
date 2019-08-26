__kernel void A(__global int* a) {
  int b = 2;
  for (int c = 1; (c <= 2); c++) {
    a[1] = c;
  };
}
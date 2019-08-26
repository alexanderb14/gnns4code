__kernel void A(__global int* a) {
  int b = 1;
  for (int c = 0; (c <= (b + 1)); c++) {
    int d = (c + 2);
    a[d] = 2;
  };
}
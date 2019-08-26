__kernel void A(__global int* a) {
  for (int b = 1; (b <= 2); b++) {
    int c = 2;
    a[1] = c;
  };
}
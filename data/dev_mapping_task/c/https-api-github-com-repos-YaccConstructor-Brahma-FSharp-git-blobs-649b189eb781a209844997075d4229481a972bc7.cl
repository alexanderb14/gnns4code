__kernel void A(__global int* a) {
  for (int b = 0; (b <= 3); b++) {
    int c = (b * b);
    a[0] = c;
  };
}
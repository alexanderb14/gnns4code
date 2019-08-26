__kernel void A(__global int* a) {
  for (int b = 0; (b <= 1); b++) {
    int c = (b + 2);
    a[c] = 2;
  };
}
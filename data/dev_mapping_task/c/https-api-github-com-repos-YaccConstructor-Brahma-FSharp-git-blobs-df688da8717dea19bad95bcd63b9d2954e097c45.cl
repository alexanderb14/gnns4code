__kernel void A(__global int* a) {
  for (int b = 1; (b <= 3); b++) {
    a[0] = b;
  };
}
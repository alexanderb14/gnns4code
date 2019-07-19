__kernel void A(__global int* a) {
  while ((a[0] < 5)) {
    int b = (a[0] + 1);
    a[0] = (b * b);
  };
}
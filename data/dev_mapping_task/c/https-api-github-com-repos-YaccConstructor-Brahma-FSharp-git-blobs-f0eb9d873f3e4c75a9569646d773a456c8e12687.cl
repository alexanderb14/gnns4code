__kernel void A(__global int* a) {
  while (((a[0] < 5) && ((a[1] < 6) || (a[2] > 2)))) {
    a[0] = 1;
  };
}
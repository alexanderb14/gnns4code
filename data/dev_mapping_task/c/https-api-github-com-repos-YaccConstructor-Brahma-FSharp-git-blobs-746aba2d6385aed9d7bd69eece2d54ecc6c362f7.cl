__kernel void A(__global int* a) {
  if ((2 == 0)) {
    int b = 1;
    a[0] = b;
  } else {
    int c = 2;
    a[0] = c;
  };
}
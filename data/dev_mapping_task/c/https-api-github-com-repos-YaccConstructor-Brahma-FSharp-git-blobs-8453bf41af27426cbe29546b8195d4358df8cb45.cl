__kernel void A(__global int* a) {
  if ((0 == 2)) {
    a[0] = 1;
  } else {
    a[0] = 2;
  };
}
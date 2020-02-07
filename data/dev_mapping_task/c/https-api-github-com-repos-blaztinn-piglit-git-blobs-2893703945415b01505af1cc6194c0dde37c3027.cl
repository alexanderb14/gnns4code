kernel void A(global int* a) {
  a[0] = (0, 0, 1);
  a[1] = 1, 0, 0;
  a[3] = (a[2] = 1, 1);
  a[5] = a[4] = 1, 0;
}
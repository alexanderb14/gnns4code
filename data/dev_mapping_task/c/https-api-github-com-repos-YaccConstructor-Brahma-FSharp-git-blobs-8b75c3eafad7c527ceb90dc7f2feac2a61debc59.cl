__constant int Ga[3] = {1, 2, 3};
__kernel void A(__global int* a) {
  a[0] = Ga[1];
}
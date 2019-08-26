__kernel void A() {
  __local int a[100][99][98];

  int b = a[5][4][3];
}
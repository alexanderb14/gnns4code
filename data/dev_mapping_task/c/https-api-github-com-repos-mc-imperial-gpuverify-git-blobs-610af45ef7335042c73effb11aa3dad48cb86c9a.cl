__kernel void A() {
  __local int a[10][5];

  int b = a[3][4];
}
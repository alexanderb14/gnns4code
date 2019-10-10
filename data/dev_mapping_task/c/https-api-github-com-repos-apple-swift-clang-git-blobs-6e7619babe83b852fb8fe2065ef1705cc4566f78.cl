kernel void A() {
  volatile local int a[120000];
  a[0] = 2;
}
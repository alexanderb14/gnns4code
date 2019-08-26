__kernel void A(__global int* a) {
  int b = 0;
  int c = (b + 1);
  int d = (c * 2);
  int e = (d - b);
  int f = (e / 2);
  a[0] = f;
}
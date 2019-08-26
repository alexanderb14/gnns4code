kernel void A(global int* a) {
  int b = 5;
  int* c = &b;

  a[0] = *(&b);
  a[1] = *c;
  a[2] = *a;
}
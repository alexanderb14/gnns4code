__kernel void A() {
  int a[16];
  int b = get_global_id(0);
  a[b] = b * b;
}
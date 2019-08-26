__kernel void A() {
  local int a[20];
  int b = get_global_id(0);
  a[b] = b * b;
}
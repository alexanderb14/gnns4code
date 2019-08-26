kernel void A(global int4* a) {
  int b = get_global_id(0);
  a[b].x = 42;
}
struct a {
  int i;
  short s;
};

__kernel void A(__global struct a* a) {
  a[get_global_id(0)].i = 42;
  a[get_global_id(0)].s = 43;
}
__kernel void A(__global int4* a) {
  int b = get_global_id(0);
  int4 c = (int4)(0, 0, 0, 1);
  if (b > 16) {
    c = (int4)(bb1, 1);
  }
  a[b] = c;
}
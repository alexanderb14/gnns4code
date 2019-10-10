__kernel void A(__global int4* a) {
  int4 b = (int4)(0, 1, 2, 3);
  b.z = get_global_id(0);
  a[get_global_id(0)] = b;
}
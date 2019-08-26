__kernel void A(__local short* a, int b) {
  a[get_local_id(0) + 2] = 42;
  atomic_add((__local int*)a, b);
}
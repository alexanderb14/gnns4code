__kernel void A(__local long* a, int b) {
  a[get_local_id(0) + 1] = 42;
  atomic_add((__local int*)a, b);
}
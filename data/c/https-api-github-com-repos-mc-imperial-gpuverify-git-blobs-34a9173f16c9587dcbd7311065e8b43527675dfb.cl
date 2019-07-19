__kernel void A(__local int* a) {
  volatile int b;
  b = a[get_local_id(0)];
  atomic_add(a, 1);
}